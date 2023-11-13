//
//  TasksFlow.swift
//  UITests
//
//  Created by Serhii_Sheliepov on 08.11.2023.
//  Copyright © 2023 Cultured Code. All rights reserved.
//

import Foundation
import XCTest

class TasksFlow: BaseFlow, TasksFlowProtocol {
    
    private let checkBoxAId = "cell_image_view"
        
    func checkElementsExist(elementIdentifiers: [String]) {
        for identifier in elementIdentifiers {
            let element = app.staticTexts[identifier]
            XCTAssertTrue(element.exists, "Expected the element '\(identifier)' present on the page")
        }
    }
    
    func tapFirstCheckBoxAndVerifySelected() {
        let checkBoxElements = app.images.matching(identifier: checkBoxAId)
        checkBoxElements.element(boundBy: 0).tap()
        let value = checkBoxElements.element(boundBy: 0).stringValue
        XCTAssertEqual(value, "Selected", "CheckBox is Not selected")
    }
    
    func checkElementsExistInOrderAfterSorting(actualСonsistencytElements: [String], resultSortingByName: [String] ) {
        for elementTexts in actualСonsistencytElements {
            let elementTexts = app.staticTexts.allElementsBoundByIndex.map { $0.label }
            for i in 0..<min(actualСonsistencytElements.count, elementTexts.count - 2) {
                XCTAssertEqual(elementTexts[i + 2], resultSortingByName[i], "Expected the elements to be in the same order")
            }
        }
    }
    
    func checkBoxNotSelected() {
        let imageElements = app.images.matching(identifier: checkBoxAId)
        for imageElement in imageElements.allElementsBoundByIndex {
            let value = imageElement.stringValue
            XCTAssertEqual(value, "Not selected", "CheckBox is Selected")
        }
    }
    
    func expectedImageElements() -> Int {
        let imageElements = app.images.matching(identifier: checkBoxAId)
        return imageElements.count
    }
    
    func checkBoxIsSelected() {
        let imageElements = app.images.matching(identifier: checkBoxAId)
        for imageElement in imageElements.allElementsBoundByIndex {
            let value = imageElement.stringValue
            XCTAssertEqual(value, "Selected", "CheckBox is Not selected")
        }
    }
    
    func tapCompleteAllButton() {
        XCTContext.runActivity(named: "Tap Complete All button") { _ in
            tasksScreen.completeAllButton.tap()
        }
    }
    
    func tapSortByNameButton() {
        XCTContext.runActivity(named: "Tap Sort By Name button") { _ in
            tasksScreen.sortByNameButton.tap()
        }
    }
    
    func tapCancelAllButton() {
        XCTContext.runActivity(named: "Tap Cancel All button") { _ in
            tasksScreen.cancelAllButton.tap()
        }
    }
        
    func isTitleTextFieldDisplayed() -> Bool {
            XCTContext.runActivity(named: "Title field is displayed") { _ in
                let titleTextField = app.staticTexts["Tasks"].isPresent
                return titleTextField
            }
        }
    
    func tapIconMoreInfo() {
            XCTContext.runActivity(named: "Tap icon More Info button") { _ in
                tasksScreen.moreInfoButton.tap()
            }
        }
    
    func isIconMoreInfoDisplayed() -> Bool {
            XCTContext.runActivity(named: "Icon More Info is displayed") { _ in
                tasksScreen.moreInfoButtonDisplayed()
            }
        }
    
    func isCompleteAllButtonDisplayed() -> Bool {
            XCTContext.runActivity(named: "Complete All button is displayed") { _ in
                tasksScreen.completeAllButtonDisplayed()
            }
        }
    
    func isCancelAllButtonDisplayed() -> Bool {
            XCTContext.runActivity(named: "Cancell All button is displayed") { _ in
                tasksScreen.cancelAllButtonDisplayed()
            }
        }
    
    func isSortByNameButtonDisplayed() -> Bool {
            XCTContext.runActivity(named: "Sort By Name button is displayed") { _ in
                tasksScreen.sortByNameButton.isDisplayed()
        }
    }
}
