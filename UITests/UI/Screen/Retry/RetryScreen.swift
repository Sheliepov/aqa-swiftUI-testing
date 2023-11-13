//
//  RetryScreen.swift
//  UITests
//
//  Created by Serhii_Sheliepov on 11.11.2023.
//  Copyright © 2023 Cultured Code. All rights reserved.
//

import Foundation
import XCTest

class RetryScreen: BaseScreen {
    
    private enum Locators {
        static let sortByNameButtonAId = "sort-tasks-bar-button-item"
    }
    
    init(app: XCUIApplication) {
        super.init(app: app, loadableElementPredicate: NSPredicate(format: "identifier = '\(Locators.sortByNameButtonAId)'"))
    }
    
    func retryButtonDisplayed() -> Bool {
        let retryButton = app.buttons["Retry"]
        return retryButton.exists
    }
}
