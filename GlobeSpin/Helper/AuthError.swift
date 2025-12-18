//
//  AuthError.swift
//  GlobeSpin
//
//  Created by Gunay Ismayilova on 16.12.25.
//

import Foundation

enum AuthError: LocalizedError {
    case configurationError
    case noViewController
    case invalidCredentials
    case authenticationFailed
    
    var errorDescription: String? {
        switch self {
        case .configurationError:
            return "Firebase configuration error"
        case .noViewController:
            return "Unable to present sign-in"
        case .invalidCredentials:
            return "Invalid credentials"
        case .authenticationFailed:
            return "Authentication failed"
        }
    }
}
