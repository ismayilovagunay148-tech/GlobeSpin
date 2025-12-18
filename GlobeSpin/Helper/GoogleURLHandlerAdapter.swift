//
//  GoogleURLHandlerAdapter.swift
//  GlobeSpin
//
//  Created by Gunay Ismayilova on 16.12.25.
//

import Foundation
import GoogleSignIn

final class GoogleURLHandlerAdapter: URLHandlerUseCase {
    
    func handleURL(_ url: URL) -> Bool {
        if url.scheme?.contains("googleusercontent") == true {
            return GIDSignIn.sharedInstance.handle(url)
        }
        return false
    }
}
