//
//  TasksScreen.swift
//  UITests
//
//  Created by Serhii_Sheliepov on 10.11.2023.
//  Copyright © 2023 Cultured Code. All rights reserved.
//

import Foundation
import XCTest

class TasksScreen: BaseScreen {
    
    private enum Locators {
        static let sortByNameButtonAId = "sort-tasks-bar-button-item"
    }
    
    init(app: XCUIApplication) {
        super.init(app: app, loadableElementPredicate: NSPredicate(format: "identifier = '\(Locators.sortByNameButtonAId)'"))
    }
    
    var sortByNameButton: ButtonFragment {
        let buttonElement = app.buttons[Locators.sortByNameButtonAId]
        return ButtonFragment(rootElement: buttonElement)
    }

    func completeAllButtonDisplayed() -> Bool {
        let competeAllButton = app.buttons["Complete All"].isPresent
        return competeAllButton
    }
    
    var completeAllButton: ButtonFragment {
        let competeAllButton = app.buttons["Complete All"]
        return ButtonFragment(rootElement: competeAllButton)
    }
    
    var moreInfoButton: ButtonFragment {
        let iconMoreInfoButton = app.buttons["More Info"]
        return ButtonFragment(rootElement: iconMoreInfoButton)
    }
    
    func moreInfoButtonDisplayed() -> Bool {
        let iconMoreInfoButton = app.buttons["More Info"].isPresent
        return iconMoreInfoButton
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
}
