//
//  SleepScreen.swift
//  UITests
//
//  Created by Serhii_Sheliepov on 10.11.2023.
//  Copyright © 2023 Cultured Code. All rights reserved.
//

import Foundation
import XCTest

class LoginScreen: BaseScreen {
    
    private enum Locators {
        static let emailInputAId = "password-text-field"
        static let passwordInputAId = "login-text-field"
        static let loginButtonAId = "login-button"
    }
    
    init(app: XCUIApplication) {
        super.init(app: app, loadableElementPredicate: NSPredicate(format: "identifier = '\(Locators.loginButtonAId)'"))
    }
    
    func emailInput() -> InputFragment {
        return InputFragment(app: app, inputFieldAId: Locators.emailInputAId)
    }
    
    func passwordInput() -> InputFragment {
        return InputFragment(app: app, inputFieldAId: Locators.passwordInputAId)
    }
    
    var loginButton: ButtonFragment {
        let buttonElement = app.buttons[Locators.loginButtonAId]
        return ButtonFragment(rootElement: buttonElement)
    }
    
    func getErrorTitleText() -> String {
        let errorTitleText = app.staticTexts["Error"].label
        return errorTitleText
    }
    
    func getErrorDiscriptionText() -> String {
        let errorDiscriptionText = app.staticTexts["Incorrect login or password format"].label
        return errorDiscriptionText
    }
    
    var oKPopupButton: ButtonFragment {
        let oKPopupButton = app.buttons["Ok"]
        oKPopupButton.firstMatch.waitForExistence(timeout: 10)
        return ButtonFragment(rootElement: oKPopupButton)
    }
    
}

