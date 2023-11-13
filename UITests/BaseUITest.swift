//
//  BaseUITest.swift
//  UITests
//
//  Created by Serhii_Sheliepov on 08.11.2023.
//  Copyright © 2023 Cultured Code. All rights reserved.
//
import XCTest

public class BaseUITest: XCTestCase {

    lazy var loginFlow = LoginFlow(app: application)
    lazy var tasksFlow = TasksFlow(app: application)
    lazy var sleepFlow = SleepFlow(app: application)
    lazy var retryFlow = RetryFlow(app: application)
    lazy var logoutFlow = LogoutFlow(app: application)

    private enum Consts {
        enum LaunchArguments {
            static let shouldResetKeychain = "ShouldResetKeychain"
        }
    }

    lazy var application = XCUIApplication()
    lazy var deviceActions = DeviceActions(app: application)

    public override func setUp() {
        super.setUp()
        continueAfterFailure = false
        application.terminate()
        let appName = "Tasks"
        deviceActions.deleteApp(appName: appName)
        launchApplication()
    }

    public override func tearDown() {
        super.tearDown()
        application.terminate()
    }

    func launchApplication() {
        application.launchArguments.append(Consts.LaunchArguments.shouldResetKeychain)
        application.waitForExistence(timeout: Timeout.small.rawValue)
        application.launch()
    }
}
