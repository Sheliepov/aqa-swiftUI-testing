//
//  SleepScreen.swift
//  UITests
//
//  Created by Serhii_Sheliepov on 10.11.2023.
//  Copyright © 2023 Cultured Code. All rights reserved.
//

import Foundation
import XCTest

class SleepScreen: BaseScreen {
    
    private enum Locators {
        static let sortByNameButtonAId = "sort-tasks-bar-button-item"
        static let backButtonAId = "BackButton"
    }
    
    init(app: XCUIApplication) {
        super.init(app: app, loadableElementPredicate: NSPredicate(format: "identifier = '\(Locators.sortByNameButtonAId)'"))
    }
    
    var sortByNameButton: ButtonFragment {
        let buttonElement = app.buttons[Locators.sortByNameButtonAId]
        return ButtonFragment(rootElement: buttonElement)
    }
    
    var backButton: ButtonFragment {
        let logoutButton = app.buttons["Tasks"]
        return ButtonFragment(rootElement: logoutButton)
    }

    func completeAllButtonDisplayed() -> Bool {
        let competeAllButton = app.buttons["Complete All"].isPresent
        return competeAllButton
    }
    
    func logoutButtonDisplayed() -> Bool {
        let logoutButton = app.buttons["Logout"].isPresent
        return logoutButton
    }
    
    var completeAllButton: ButtonFragment {
        let competeAllButton = app.buttons["Complete All"]
        return ButtonFragment(rootElement: competeAllButton)
    }
    
    var cancelAllButton: ButtonFragment {
        let cancelAllButton = app.buttons["Cancel All"]
        cancelAllButton.firstMatch.waitForExistence(timeout: 10)
        return ButtonFragment(rootElement: cancelAllButton)
    }
    
    func cancelAllButtonDisplayed() -> Bool {
        let cancelAllButton = app.buttons["Cancel All"].isPresent
        return cancelAllButton
    }
    
    var cancelPopupButton: ButtonFragment {
        let cancelPopupButton = app.buttons["Cancel"]
        return ButtonFragment(rootElement: cancelPopupButton)
    }
    
    func cancelPopupButtonDisplayed() -> Bool {
        let cancelPopupButton = app.buttons["Cancel"].isPresent
        return cancelPopupButton
    }
    
    var logoutButton: ButtonFragment {
        let logoutButton = app.buttons["Logout"]
        return ButtonFragment(rootElement: logoutButton)
    }

}
