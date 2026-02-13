//
//  TermsOfServiceController.swift
//  GlobeSpin
//
//  Created by Gunay Ismayilova on 28.01.26.
//

import UIKit

class TermsOfServiceController: StaticContentController {
    init() {
        super.init(
            pageTitle: "Terms of Service",
            content: """
            Here you can add your Terms of Service content.

            This is where you would put all the legal terms and conditions that users need to agree to when using your app.

            You can format this text however you like and add as much content as needed.
            """
        )
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
