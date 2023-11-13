//
//  FluentWait.swift
//  UITests
//
//  Created by Serhii_Sheliepov on 08.11.2023.
//  Copyright © 2023 Cultured Code. All rights reserved.
//

import Foundation
import XCTest

enum Timeout : Double {
    case small = 5
    case medium = 15
    case large = 30
}

protocol FluentWait {
    
    func waitForElementExists(_ element: XCUIElement)
    
    func waitForElementExists(_ element: XCUIElement, withinTimeout: Timeout)
    
}

extension FluentWait {
    
    func waitForElementExists(_ element: XCUIElement) {
        _ = element.waitForExistence(timeout: Timeout.medium.rawValue)
    }
    
    func waitForElementExists(_ element: XCUIElement, withinTimeout: Timeout) {
        _ = element.waitForExistence(timeout: withinTimeout.rawValue)
    }
}
