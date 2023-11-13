//
//  InputFragment.swift
//  UITests
//
//  Created by Serhii_Sheliepov on 08.11.2023.
//  Copyright © 2023 Cultured Code. All rights reserved.
//

import Foundation
import XCTest

class InputFragment: BaseFragment {
    
    internal let app: XCUIApplication
    internal let inputFieldAId: String
    
    init(app: XCUIApplication, inputFieldAId: String) {
        self.app = app
        self.inputFieldAId = inputFieldAId
        super.init(rootElement: app.textFields[inputFieldAId])
    }
    
    func tap() {
        getRootElement().tap()
    }
    
    func enterText(_ text: String) {
        getRootElement().tap()
        rootElement.typeText(text)
    }
    
    func changeText(_ newText: String) {
        rootElement.clearField()
        rootElement.typeText(newText)
    }
    
    func clear() {
        getRootElement().clearField()
    }
    
    fileprivate func enterText(_ text: String, _ input: XCUIElement) {
        input.typeText(text)
    }
}
