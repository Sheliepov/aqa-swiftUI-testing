//
//  LoginFlowProtocol.swift
//  UITests
//
//  Created by Serhii_Sheliepov on 08.11.2023.
//  Copyright © 2023 Cultured Code. All rights reserved.
//

import Foundation

protocol LoginFlowProtocol {
    
    func loginVerificationScreen()
    func enterEmail(email: String)
    func emailInputScreen()
    func enterPasswordField()
    
    func inputPasswordField(password: String)
    func tapLoginButton()
    
    func loginButtonEnabled() -> Bool
    func isErrorTitleTextDisplayed() -> Bool
    func getErrorTitleText() -> String
    func getErrorDiscriptionText() -> String
    func tapOkButton()

    func isEmailFieldDisplayed() -> Bool
    func isPasswordFieldDisplayed() -> Bool
    func isLoginButtonDisplayed() -> Bool
}
