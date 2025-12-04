//
//  FirebaseAuthAdapter.swift
//  GlobeSpin
//
//  Created by Gunay Ismayilova on 03.12.25.
//

import Foundation
import FirebaseAuth
import FirebaseCore

final class FirebaseAuthAdapter: AuthenticationAdapter {
    
    private let auth: Auth
    
    init() {
        if FirebaseApp.app() == nil {
            FirebaseApp.configure()
        }
        self.auth = Auth.auth()
    }
    
    func signUp(email: String, password: String, completion: @escaping (String?, Error?) -> Void) {
        auth.createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                completion(nil, error)
                return
            }
            completion(result?.user.uid, nil)
        }
    }
    
    func logIn(email: String, password: String, completion: @escaping (String?, Error?) -> Void) {
        auth.signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                completion(nil, error)
                return
            }
            completion(result?.user.uid, nil)
        }
    }
    
    func signOut(completion: @escaping (Error?) -> Void) {
        do {
            try auth.signOut()
            completion(nil)
        } catch {
            completion(error)
        }
    }
    
    func getCurrentUser() -> String? {
        auth.currentUser?.uid
    }
    
    func isUserLoggedIn() -> Bool {
        auth.currentUser != nil
    }
}
