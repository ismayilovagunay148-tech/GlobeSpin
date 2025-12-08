//
//  UserService.swift
//  GlobeSpin
//
//  Created by Gunay Ismayilova on 07.12.25.
//

import Foundation
import FirebaseFirestore
import FirebaseCore

class UserService {
    
    static let shared = UserService()
    
    private var db: Firestore {
        return Firestore.firestore()
    }
    private let usersCollection = "users"
    
    private init() {
        if FirebaseApp.app() == nil {
            FirebaseApp.configure()
        }
    }
    
    func saveUserData(userId: String, fullName: String, email: String, completion: @escaping (Error?) -> Void) {
        let userData: [String: Any] = [
            "userId": userId,
            "fullName": fullName,
            "email": email,
            "createdAt": Timestamp(date: Date())
        ]
        
        db.collection(usersCollection).document(userId).setData(userData) { error in
            completion(error)
        }
    }
    
    func getUserData(userId: String, completion: @escaping (UserModel?, Error?) -> Void) {
        db.collection(usersCollection).document(userId).getDocument { snapshot, error in
            if let error = error {
                completion(nil, error)
                return
            }
            
            guard let data = snapshot?.data(),
                  let fullName = data["fullName"] as? String,
                  let email = data["email"] as? String else {
                completion(nil, NSError(domain: "UserService", code: -1, userInfo: [NSLocalizedDescriptionKey: "Unable to parse user data"]))
                return
            }
            
            let user = UserModel(userId: userId, fullName: fullName, email: email)
            completion(user, nil)
        }
    }
    
    func updateUserData(userId: String, fullName: String, completion: @escaping (Error?) -> Void) {
        let updates: [String: Any] = [
            "fullName": fullName,
            "updatedAt": Timestamp(date: Date())
        ]
        
        db.collection(usersCollection).document(userId).updateData(updates) { error in
            completion(error)
        }
    }
}
