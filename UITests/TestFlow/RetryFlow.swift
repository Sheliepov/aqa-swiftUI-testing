//
//  RetryFlow.swift
//  UITests
//
//  Created by Serhii_Sheliepov on 12.11.2023.
//  Copyright © 2023 Cultured Code. All rights reserved.
//

import Foundation
import XCTest

class RetryFlow: BaseFlow {
        
    func retryButtonDisplayed() -> Bool {
        return retryScreen.retryButtonDisplayed()
    }
    
    func getErrorDiscriptionText() -> Bool {
        let errorDiscriptionText = app.staticTexts["Unexpected login error occured"].isPresent
        return errorDiscriptionText
    }
    
    func retryTapButton() {
        XCTContext.runActivity(named: "Tap Retry button") { _ in
            let imagesButton = app.buttons["Retry"]
            while imagesButton.isPresent {
                imagesButton.tap()
            }
        }
    }
}
