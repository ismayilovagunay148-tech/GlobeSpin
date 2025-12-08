//
//  UserModel.swift
//  GlobeSpin
//
//  Created by Gunay Ismayilova on 07.12.25.
//

import Foundation

struct UserModel {
    let userId: String
    let fullName: String
    let email: String
    
    init(userId: String, fullName: String, email: String) {
        self.userId = userId
        self.fullName = fullName
        self.email = email
    }
}
