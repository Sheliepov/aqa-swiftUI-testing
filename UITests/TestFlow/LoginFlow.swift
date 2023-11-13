//
//  LoginFlow.swift
//  UITests
//
//  Created by Serhii_Sheliepov on 08.11.2023.
//  Copyright © 2023 Cultured Code. All rights reserved.
//

import Foundation
import XCTest

class LoginFlow: BaseFlow, LoginFlowProtocol {
    
    private let defaultPassword = "Password1"
    private let lettersNumbers = "abcdefghijklmnopqrstuvwxyz1234567890"
    private let domain = "@gmail.com"
    
    func loginVerificationScreen() {
        XCTContext.runActivity(named: "Registration user flow") { _ in
            loginScreen.emailInput().changeText(generatedEmail)
            enterPasswordField()
            tapLoginButton()
           }
       }
    
    func enterEmail(email: String) {
        XCTContext.runActivity(named: "Input email") { _ in
            loginScreen.emailInput().changeText(email)
        }
    }
    
    func emailInputScreen() {
        XCTContext.runActivity(named: "Registration user flow") { _ in
            loginScreen.emailInput().changeText(generatedEmail)
           }
       }
    
    func enterPasswordField() {
        XCTContext.runActivity(named: "Input password") { _ in
            let passwordSecureTextField = app.secureTextFields["Password"]
            passwordSecureTextField.firstMatch.waitForExistence(timeout: 10)
            passwordSecureTextField.firstMatch.tap()
            passwordSecureTextField.firstMatch.typeText(defaultPassword)
        }
    }
    
    func inputPasswordField(password: String) {
        XCTContext.runActivity(named: "Input password") { _ in
            let passwordSecureTextField = app.secureTextFields["Password"]
            passwordSecureTextField.firstMatch.waitForExistence(timeout: 10)
            passwordSecureTextField.firstMatch.tap()
            passwordSecureTextField.firstMatch.typeText(password)
        }
    }
        
    func tapLoginButton() {
        XCTContext.runActivity(named: "Tap login button") { _ in
            loginScreen.loginButton.tap()
        }
    }
    
    func loginButtonEnabled() -> Bool {
        return loginScreen.loginButton.enabled
    }

    func isErrorTitleTextDisplayed() -> Bool {
        XCTContext.runActivity(named: "Title incorrect text is displayed") { _ in
            let titleIncorrectText = app.staticTexts["Error"].isPresent
                return titleIncorrectText
        }
    }
    
    func getErrorTitleText() -> String {
            return loginScreen.getErrorTitleText()
        }

    func getErrorDiscriptionText() -> String {
            return loginScreen.getErrorDiscriptionText()
        }
    
    func tapOkButton() {
        XCTContext.runActivity(named: "Tap Ok button") { _ in
            loginScreen.oKPopupButton.tap()
        }
    }
    
    private var generatedEmail: String {
            let randomLength = Int.random(in: 5...10)
            let randomString = String((0..<randomLength).map { _ in lettersNumbers.randomElement()! })
            return randomString + domain
    }
        
    func isEmailFieldDisplayed() -> Bool {
            return loginScreen.emailInput().isDisplayed()
        }
    
    func isPasswordFieldDisplayed() -> Bool {
        let passwordSecureTextField = app.secureTextFields["Password"]
        passwordSecureTextField.firstMatch.waitForExistence(timeout: 10)
        return passwordSecureTextField.firstMatch.isVisible
    }
        
    func isLoginButtonDisplayed() -> Bool {
            return loginScreen.loginButton.isDisplayed()
    }
}
