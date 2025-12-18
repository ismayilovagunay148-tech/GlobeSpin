//
//  URLHandlerService.swift
//  GlobeSpin
//
//  Created by Gunay Ismayilova on 16.12.25.
//

import Foundation

class URLHandlerService {
    
    static let shared = URLHandlerService()
    
    private let googleURLHandler: URLHandlerUseCase
    
    init(googleURLHandler: URLHandlerUseCase = GoogleURLHandlerAdapter()) {
        self.googleURLHandler = googleURLHandler
    }
    
    func handleURL(_ url: URL) -> Bool {
        return googleURLHandler.handleURL(url)
    }
}
