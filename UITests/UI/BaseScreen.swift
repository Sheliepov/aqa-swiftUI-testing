//
//  SleepScreen.swift
//  UITests
//
//  Created by Serhii_Sheliepov on 10.11.2023.
//  Copyright © 2023 Cultured Code. All rights reserved.
//

import Foundation
import XCTest

class BaseScreen: FluentWait {
    let app: XCUIApplication
    internal let loadableElementPredicate: NSPredicate
    private lazy var loadableElementQuery = app.descendants(matching: XCUIElement.ElementType.any).matching(loadableElementPredicate)

    init(app: XCUIApplication, loadableElementPredicate: NSPredicate){
        self.app = app
        self.loadableElementPredicate = loadableElementPredicate
    }

    func isOpened() -> Bool {
        return XCTContext.runActivity(named: "'\(String(describing: self))' is opened") { _ in
            return loadableElementQuery.firstMatch.exists
        }
    }
}
