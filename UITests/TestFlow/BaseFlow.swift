//
//  BaseFlow.swift
//  UITests
//
//  Created by Serhii_Sheliepov on 08.11.2023.
//  Copyright © 2023 Cultured Code. All rights reserved.
//

import Foundation
import XCTest

class BaseFlow: FluentWait {
    let app: XCUIApplication

    init(app: XCUIApplication) {
        self.app = app
    }

    lazy var loginScreen = LoginScreen(app: app)
    lazy var tasksScreen = TasksScreen(app: app)
    lazy var sleepScreen = SleepScreen(app: app)
    lazy var logoutScreen = LogoutScreen(app: app)
    lazy var retryScreen = RetryScreen(app: app)

    func isLoginScreenOpened() -> Bool {
        return loginScreen.isOpened()
    }

    func isTasksScreenOpened() -> Bool {
        return tasksScreen.isOpened()
    }

    func isSleepScreenOpened() -> Bool {
        return sleepScreen.isOpened()
    }
}
