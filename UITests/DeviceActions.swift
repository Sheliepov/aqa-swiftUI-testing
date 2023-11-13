//
//  DeviceActions.swift
//  UITests
//
//  Created by Serhii_Sheliepov on 10.11.2023.
//  Copyright © 2023 Cultured Code. All rights reserved.
//

import Foundation
import XCTest

class DeviceActions {
    
    private let app: XCUIApplication
    private let springboard: XCUIApplication? = XCUIApplication(bundleIdentifier: "com.apple.springboard")

    
    init(app: XCUIApplication) {
        self.app = app
    }
    
    func deleteApp(appName: String) {
        springboard!.activate()
        let icon = springboard!.icons[appName]
        if icon.exists {
            icon.press(forDuration: 1.3)
            springboard!.buttons.matching(NSPredicate(format: "label == 'Remove App'")).firstMatch.tap()
            springboard!.buttons.matching(NSPredicate(format: "label == 'Delete App'")).firstMatch.tap()
            springboard!.waitForExistence(timeout: Timeout.small.rawValue)
            springboard!.alerts.buttons.matching(NSPredicate(format: "label == 'Delete'")).firstMatch.tap(withNumberOfTaps: 2, numberOfTouches: 1)
            XCUIDevice.shared.press(.home)
        }
    }
}
