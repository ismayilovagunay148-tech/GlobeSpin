//
//  GoogleLogInAdapter.swift
//  GlobeSpin
//
//  Created by Gunay Ismayilova on 16.12.25.
//

import Foundation
import UIKit
import FirebaseAuth
import GoogleSignIn
import FirebaseCore

final class GoogleLogInAdapter: SocialAuthUseCase {
    
    func signIn(completion: @escaping (SocialAuthResult?, Error?) -> Void) {
        
        guard let clientID = FirebaseApp.app()?.options.clientID else {
            completion(nil, AuthError.configurationError)
            return
        }
        
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let rootViewController = windowScene.windows.first?.rootViewController else {
            completion(nil, AuthError.noViewController)
            return
        }
        
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
        
        GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController) { result, error in
            if let error = error {
                completion(nil, error)
                return
            }
            
            guard let result = result,
                  let idToken = result.user.idToken?.tokenString else {
                completion(nil, AuthError.invalidCredentials)
                return
            }
            
            let accessToken = result.user.accessToken.tokenString
            let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: accessToken)
            
            Auth.auth().signIn(with: credential) { authResult, error in
                if let error = error {
                    completion(nil, error)
                    return
                }
                
                guard let firebaseUser = authResult?.user else {
                    completion(nil, AuthError.authenticationFailed)
                    return
                }
                
                let result = SocialAuthResult(
                    userId: firebaseUser.uid,
                    email: result.user.profile?.email,
                    fullName: result.user.profile?.name
                )
                
                completion(result, nil)
            }
        }
    }
}
