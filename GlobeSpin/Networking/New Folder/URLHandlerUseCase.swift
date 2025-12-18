//
//  URLHandlerUseCase.swift
//  GlobeSpin
//
//  Created by Gunay Ismayilova on 16.12.25.
//

import Foundation

protocol URLHandlerUseCase {
    func handleURL(_ url: URL) -> Bool
}
