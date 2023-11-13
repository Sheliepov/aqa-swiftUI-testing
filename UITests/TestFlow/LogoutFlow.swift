//
//  LogoutFlow.swift
//  UITests
//
//  Created by Serhii_Sheliepov on 10.11.2023.
//  Copyright © 2023 Cultured Code. All rights reserved.
//

import Foundation
import XCTest

class LogoutFlow: BaseFlow, LogoutFlowProtocol {
    
    private let errorMessagePopup = "Do you really want to logout?"
        
    func tapCancelPopupButton() {
            XCTContext.runActivity(named: "Tap Popup Cancel button") { _ in
                logoutScreen.cancelPopupButton.tap()
            }
        }
        
    func tapLogoutButton() {
            XCTContext.runActivity(named: "Tap Logout button") { _ in
                logoutScreen.logoutButton.tap()
            }
        }
        
    func isTitlePopupLogoutTextDisplayed() -> Bool {
            XCTContext.runActivity(named: "Title field is displayed") { _ in
                let titleLogoutTextField = app.staticTexts[errorMessagePopup].isPresent
                return titleLogoutTextField
            }
        }
    
    func checkExpectedLogoutText() -> Bool {
        XCTContext.runActivity(named: "Title field is displayed") { _ in
            let titleLogoutTextField = app.staticTexts[errorMessagePopup]
            return titleLogoutTextField.exists
        }
    }
        
    func isCancelPopupButtonDisplayed() -> Bool {
            XCTContext.runActivity(named: "Cancel button is displayed") { _ in
                logoutScreen.cancelPopupButtonDisplayed()
            }
        }
        
    func isLogoutButtonDisplayed() -> Bool {
            XCTContext.runActivity(named: "Logout button is displayed") { _ in
                logoutScreen.logoutButtonDisplayed()
            }
    }
}
