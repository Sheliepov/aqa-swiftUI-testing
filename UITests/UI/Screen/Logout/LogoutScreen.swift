//
//  LogoutScreen.swift
//  UITests
//
//  Created by Serhii_Sheliepov on 08.11.2023.
//  Copyright © 2023 Cultured Code. All rights reserved.
//

import Foundation
import XCTest

class LogoutScreen: BaseScreen {
    
    private enum Locators {
        static let sortByNameButtonAId = "sort-tasks-bar-button-item"
    }
    
    init(app: XCUIApplication) {
        super.init(app: app, loadableElementPredicate: NSPredicate(format: "identifier = '\(Locators.sortByNameButtonAId)'"))
    }
    
    func logoutButtonDisplayed() -> Bool {
        let logoutButton = app.buttons["Logout"].isPresent
        return logoutButton
    }
    
    func cancelPopupButtonDisplayed() -> Bool {
        let cancelPopupButton = app.buttons["Cancel"].isPresent
        return cancelPopupButton
    }
    
    var cancelPopupButton: ButtonFragment {
        let cancelPopupButton = app.buttons["Cancel"]
        return ButtonFragment(rootElement: cancelPopupButton)
    }
    
    var logoutButton: ButtonFragment {
        let logoutButton = app.buttons["Logout"]
        return ButtonFragment(rootElement: logoutButton)
    }

}
