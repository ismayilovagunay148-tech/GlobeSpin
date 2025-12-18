//
//  SocialAuthUseCase.swift
//  GlobeSpin
//
//  Created by Gunay Ismayilova on 16.12.25.
//

import Foundation
import UIKit

protocol SocialAuthUseCase {
    func signIn(completion: @escaping (SocialAuthResult?, Error?) -> Void)
}
