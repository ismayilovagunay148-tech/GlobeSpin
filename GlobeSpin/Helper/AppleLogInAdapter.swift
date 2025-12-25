//
//  AppleLogInAdapter.swift
//  GlobeSpin
//
//  Created by Gunay Ismayilova on 16.12.25.
//

import Foundation
import UIKit
import FirebaseAuth
import FirebaseCore
import AuthenticationServices
import CryptoKit

final class AppleLogInAdapter: NSObject, SocialAuthUseCase {
    
    private var currentNonce: String?
    private var completionHandler: ((SocialAuthResult?, Error?) -> Void)?
    
    func signIn(completion: @escaping (SocialAuthResult?, Error?) -> Void) {
        self.completionHandler = completion
        
        let nonce = randomNonceString()
        currentNonce = nonce
        
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email]
        request.nonce = sha256(nonce)
        
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        authorizationController.performRequests()
    }
    
    private func randomNonceString(length: Int = 32) -> String {
        var randomBytes = [UInt8](repeating: 0, count: length)
        let status = SecRandomCopyBytes(kSecRandomDefault, randomBytes.count, &randomBytes)
        guard status == errSecSuccess else {
            fatalError("Unable to generate nonce. SecRandomCopyBytes failed with status \(status)")
        }
        
        let charset: [Character] = Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")
        return String(randomBytes.map { charset[Int($0) % charset.count] })
    }
    
    private func sha256(_ input: String) -> String {
        let inputData = Data(input.utf8)
        let hashedData = SHA256.hash(data: inputData)
        return hashedData.compactMap { String(format: "%02x", $0) }.joined()
    }
}

extension AppleLogInAdapter: ASAuthorizationControllerDelegate {
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        
        guard let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential,
              let nonce = currentNonce,
              let appleIDToken = appleIDCredential.identityToken,
              let idTokenString = String(data: appleIDToken, encoding: .utf8) else {
            completionHandler?(nil, AuthError.invalidCredentials)
            return
        }
        
        let credential = OAuthProvider.appleCredential(withIDToken: idTokenString, rawNonce: nonce, fullName: appleIDCredential.fullName)

        Auth.auth().signIn(with: credential) { authResult, error in
            if let error = error {
                self.completionHandler?(nil, error)
                return
            }
            
            guard let firebaseUser = authResult?.user else {
                self.completionHandler?(nil, AuthError.authenticationFailed)
                return
            }
            
            var fullName: String?
            if let givenName = appleIDCredential.fullName?.givenName,
               let familyName = appleIDCredential.fullName?.familyName {
                fullName = "\(givenName) \(familyName)"
            } else {
                fullName = firebaseUser.displayName
            }
            
            let result = SocialAuthResult(
                userId: firebaseUser.uid,
                email: appleIDCredential.email ?? firebaseUser.email,
                fullName: fullName
            )
            
            self.completionHandler?(result, nil)
        }
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        completionHandler?(nil, error)
    }
}

extension AppleLogInAdapter: ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let window = windowScene.windows.first(where: { $0.isKeyWindow }) else {
            return UIWindow()
        }
        return window
    }
}
