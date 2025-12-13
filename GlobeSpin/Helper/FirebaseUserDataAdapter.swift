//
//  FirebaseUserDataAdapter.swift
//  GlobeSpin
//
//  Created by Gunay Ismayilova on 10.12.25.
//

import Foundation
import FirebaseFirestore
import FirebaseCore

final class FirebaseUserDataAdapter: UserDataUseCase {
    
    private let db: Firestore
    private let usersCollection = "users"
    
    init() {
        if FirebaseApp.app() == nil {
            FirebaseApp.configure()
        }
        self.db = Firestore.firestore()
    }
    
    func saveUserData(userId: String, fullName: String, email: String, completion: @escaping (Error?) -> Void) {
        let userData: [String: Any] = [
            "userId": userId,
            "fullName": fullName,
            "email": email,
            "createdAt": Timestamp(date: Date())
        ]
        
        db.collection(usersCollection).document(userId).setData(userData, completion: completion)
    }
    
    func getUserData(userId: String, completion: @escaping (UserModel?, Error?) -> Void) {
        db.collection(usersCollection).document(userId).getDocument { document, error in
            if let error = error {
                completion(nil, error)
                return
            }
            
            guard let document = document, document.exists,
                  let data = document.data(),
                  let fullName = data["fullName"] as? String,
                  let email = data["email"] as? String else {
                completion(nil, nil)
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
        
        db.collection(usersCollection).document(userId).updateData(updates, completion: completion)
    }
    
    func deleteUserData(userId: String, completion: @escaping (Error?) -> Void) {
        db.collection(usersCollection).document(userId).delete(completion: completion)
    }
}
