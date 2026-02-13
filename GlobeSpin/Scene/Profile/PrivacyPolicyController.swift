//
//  PrivacyPolicyController.swift
//  GlobeSpin
//
//  Created by Gunay Ismayilova on 28.01.26.
//

import UIKit

class PrivacyPolicyController: StaticContentController {
    init() {
        super.init(
            pageTitle: "Privacy Policy",
            content: """
            Here you can add your Privacy Policy content.

            This is where you would explain how you collect, use, and protect user data.

            You can format this text however you like and add as much content as needed.
            """
        )
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
