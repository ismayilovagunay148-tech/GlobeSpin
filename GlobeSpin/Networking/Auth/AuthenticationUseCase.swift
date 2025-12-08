//
//  AuthenticationUseCase.swift
//  GlobeSpin
//
//  Created by Gunay Ismayilova on 03.12.25.
//

import Foundation

protocol AuthenticationUseCase {
    func signUp(email: String, password: String, completion: @escaping (String?, Error?) -> Void)
    func logIn(email: String, password: String, completion: @escaping (String?, Error?) -> Void)
    func logOut(completion: @escaping (Error?) -> Void)
    func getCurrentUser() -> String?
    func isUserLoggedIn() -> Bool
}
