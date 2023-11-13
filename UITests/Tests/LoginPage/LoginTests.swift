//
//  LoginTests.swift
//  UITests
//
//  Created by Serhii_Sheliepov on 08.11.2023.
//  Copyright © 2023 Cultured Code. All rights reserved.
//

import Foundation
import XCTest

public class LoginTests: BaseUITest {
    
    /**
    ### Login Page
    * [TestCase] Check field email is displayed.
    * [TestCase] Check field password is displayed.
    * [TestCase] Check successful login with correct email and password.
    */
    public func testLoginVerification() throws {
        XCTAssert(loginFlow.isLoginScreenOpened(), "Login screen is not opened")
            
        XCTAssert(loginFlow.isEmailFieldDisplayed(), "Email field input IS NOT displayed")
        XCTAssert(loginFlow.isPasswordFieldDisplayed(), "Password field input IS NOT displayed")
        XCTAssert(loginFlow.isLoginButtonDisplayed(), "Login button IS NOT displayed")
        loginFlow.loginVerificationScreen()
        if retryFlow.retryButtonDisplayed() {
            retryFlow.retryTapButton()
        }
        XCTAssertTrue(tasksFlow.isTitleTextFieldDisplayed(), "Tasks screen is not opened")
    
    }
    
    /**
    ### Login Page
    * [TestCase] Check login with both "email" and "password" fields empty.
    * [TestCase] Check login with a filled "email" field and an empty "password" field.
    * [TestCase] Check login with an empty "email" field and a filled "password" field.
    * [TestCase] Check successful login with correct email and password.
    */
    public func testValidationEmailAndPassword() throws {
        let validEmail = "davv@ua.com"
        let validPassword = "45795433"
        
        XCTAssert(loginFlow.isLoginScreenOpened(), "Login screen is not opened")
        XCTAssertFalse(loginFlow.loginButtonEnabled(), "Login button enabled")
        
        loginFlow.enterEmail(email: validEmail)
        XCTAssertFalse(loginFlow.loginButtonEnabled(), "Login button enabled")
        
        loginFlow.loginScreen.emailInput().clear()
        loginFlow.inputPasswordField(password: validPassword)
        XCTAssertFalse(loginFlow.loginButtonEnabled(), "Login button enabled")
        
        loginFlow.enterEmail(email: validEmail)
        XCTAssertTrue(loginFlow.loginButtonEnabled(), "Login button disabled")
        loginFlow.tapLoginButton()
        if retryFlow.retryButtonDisplayed() {
            retryFlow.retryTapButton()
        }
        XCTAssertTrue(tasksFlow.isTitleTextFieldDisplayed(), "Tasks screen is not opened")
        
    }
    
    /**
    ### Login Page
     *  [TestCase] Сheck login with incorrect email and correct password
     * [TestCase] Check display of a pop-up window when an invalid email is entered
     * [TestCase] Check error message text in the pop-up window is correct
    */
    public func testLoginIncorrectVerification() throws {
        let invalidEmail = "email.ua.com"
        let validPassword = "Password!"
        
        let expectedAlertErrorMessage = "Incorrect login or password format"
        
        XCTAssert(loginFlow.isLoginScreenOpened(), "Login screen is not opened")
        loginFlow.enterEmail(email: invalidEmail)
        
        XCTAssert(loginFlow.isEmailFieldDisplayed(), "Email field input IS NOT displayed")
        loginFlow.inputPasswordField(password: validPassword)
        XCTAssert(loginFlow.isLoginButtonDisplayed(), "Login button IS NOT displayed")
        XCTAssertTrue(loginFlow.loginButtonEnabled(), "Login button disabled")
        loginFlow.tapLoginButton()
        if retryFlow.retryButtonDisplayed() {
            retryFlow.retryTapButton()
        }
        XCTAssertTrue(loginFlow.isErrorTitleTextDisplayed(), "Error message IS NOT displayed")
        XCTAssertEqual(loginFlow.getErrorDiscriptionText(), expectedAlertErrorMessage, "Incorrect error message IS NOT displayed")
        loginFlow.tapOkButton()
        XCTAssertFalse(loginFlow.isErrorTitleTextDisplayed(), "Error message displayed")
    
    }
}
