//
//  XCUIElement.swift
//  UITests
//
//  Created by Serhii_Sheliepov on 08.11.2023.
//  Copyright © 2023 Cultured Code. All rights reserved.
//

import Foundation
import XCTest

extension XCUIElement {
    
    public var isPresent: Bool {
        self.waitForExistence(timeout: Timeout.small.rawValue)
        return exists && isEnabled
    }
    
    public var isVisible: Bool {
        self.waitForExistence(timeout: Timeout.small.rawValue)
        return exists && isHittable
    }
    
    func clearField() {
        guard let currentValue = self.value as? String else {
            XCTFail("Failed to clear text from non string field")
            return
        }
        self.tap()
        let deletingString = String(repeating: XCUIKeyboardKey.delete.rawValue, count: currentValue.count)
        self.typeText(deletingString)
    }
}

extension XCUIElement {
    var stringValue: String? {
        return self.value as? String
    }
}

