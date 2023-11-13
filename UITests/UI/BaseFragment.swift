//
//  BaseFragment.swift
//  UITests
//
//  Created by Serhii_Sheliepov on 08.11.2023.
//  Copyright © 2023 Cultured Code. All rights reserved.
//

import Foundation
import XCTest

class BaseFragment: FluentWait {
    
    var rootElement: XCUIElement
    
    init(rootElement: XCUIElement) {
        self.rootElement = rootElement
    }
    
    func getRootElement() -> XCUIElement {
        waitForPresence()
        return rootElement
    }
    
    func isDisplayed() -> Bool {
        return XCTContext.runActivity(named: "'\(String(describing: self))' is displayed") { _ in
            return rootElement.isVisible
        }
    }
    
    func waitForPresence() {
        waitForElementExists(rootElement, withinTimeout: Timeout(rawValue: Timeout.medium.rawValue)!)
    }
}

enum FragmentError: Error {
    case unableToGetValueError
}
