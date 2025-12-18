//
//  SocialAuthResult.swift
//  GlobeSpin
//
//  Created by Gunay Ismayilova on 16.12.25.
//

import Foundation

struct SocialAuthResult {
    let userId: String
    let email: String?
    let fullName: String?
    
    init(userId: String, email: String?, fullName: String?) {
        self.userId = userId
        self.email = email
        self.fullName = fullName
    }
}
