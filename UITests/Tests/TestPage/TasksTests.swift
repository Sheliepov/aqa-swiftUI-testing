//
//  TasksTests.swift
//  UITests
//
//  Created by Serhii_Sheliepov on 08.11.2023.
//  Copyright © 2023 Cultured Code. All rights reserved.
//

import Foundation
import XCTest

public class TasksTests: BaseUITest {
    
    /**
     ### Tasks Page
     * [TestCase] Check Tasks page is open.
     * [TestCase] Check Tasks title field is displayed.
     * [TestCase] Check the names of items in the checklist.
     * [TestCase] Check the number of items on the checklist.
     * [TestCase] Check the visibility of the Complete All button.
     * [TestCase] Check the visibility of the Sort By Name button.
     * [TestCase] Check that More Info icon is displayed.
     * [TestCase] Check that Logout button is displayed.
     * [TestCase] Check that Logout popup is open.
     * [TestCase] Logout title is displayed.
     * [TestCase] Logout title is correct.
     * [TestCase] Cansel button functionality
     */
    public func testPageTestsElementsIsDisplayed() throws {
        let checkListElements = ["Buy milk", "Pay rent", "Change tires", "Sleep", "Dance"]
        
        XCTAssert(loginFlow.isLoginScreenOpened(), "Login screen is not opened")
        loginFlow.loginVerificationScreen()
        if retryFlow.retryButtonDisplayed() {
            retryFlow.retryTapButton()
        }
        XCTAssertTrue(tasksFlow.isTitleTextFieldDisplayed(), "Tasks screen is not opened")
        tasksFlow.checkElementsExist(elementIdentifiers: checkListElements)
        XCTAssertTrue(tasksFlow.isCompleteAllButtonDisplayed(), "Complete All button is not displayed")
        XCTAssertTrue(tasksFlow.isSortByNameButtonDisplayed(), "Sort By Name button is not displayed")
        
        tasksFlow.checkBoxNotSelected()
        XCTAssertTrue(tasksFlow.isIconMoreInfoDisplayed(), "Icon More Info is not displayed")
        XCTAssertTrue(logoutFlow.isLogoutButtonDisplayed(), "Logout button is not displayed")
        
        logoutFlow.tapLogoutButton()
        XCTAssertTrue(logoutFlow.isTitlePopupLogoutTextDisplayed(), "Logout title is not displayed")
        XCTAssertTrue(logoutFlow.checkExpectedLogoutText(), "Logout header is not correct")
        XCTAssertTrue(logoutFlow.isCancelPopupButtonDisplayed(), "Cancel button is not dispalyed")
        logoutFlow.tapCancelPopupButton()
        XCTAssertFalse(logoutFlow.isCancelPopupButtonDisplayed(), "Cancel button is dispalyed")
        
    }
    
    /**
     ### Tasks Page
     * [TestCase] Check the visibility of the Complete All button.
     * [TestCase] Check the visibility of the Sort By Name button.
     * [TestCase] Check that checkboxes status is not selected.
     * [TestCase] Check that checkboxes are selected after clicking the Complete All button.
     */
    public func testCompleteAllFunctionality() throws {
        let actualCountElements = 5
    
        XCTAssert(loginFlow.isLoginScreenOpened(), "Login screen is not opened")
        loginFlow.loginVerificationScreen()
        if retryFlow.retryButtonDisplayed() {
            retryFlow.retryTapButton()
        }
        XCTAssertTrue(tasksFlow.isTitleTextFieldDisplayed(), "Tasks screen is not opened")

        XCTAssertTrue(tasksFlow.isCompleteAllButtonDisplayed(), "Complete All button is not displayed")
        tasksFlow.checkBoxNotSelected()
        XCTAssertEqual(tasksFlow.expectedImageElements(), actualCountElements, "There are no '\(actualCountElements)' checklist items on this page ")
        tasksFlow.tapCompleteAllButton()
        tasksFlow.checkBoxIsSelected()
        
    }
    
    /**
     ### Tasks Page
     * [TestCase] Check the visibility of the Cancel All button.
     * [TestCase] Check that checkboxes status is not selected.
     * [TestCase] Check that checkboxes are not selected after clicking the Cancell All button.
     */
    public func testCancelAllDisplayed() throws {
        
        XCTAssert(loginFlow.isLoginScreenOpened(), "Login screen is not opened")
        loginFlow.loginVerificationScreen()
        if retryFlow.retryButtonDisplayed() {
            retryFlow.retryTapButton()
        }
        XCTAssertTrue(tasksFlow.isTitleTextFieldDisplayed(), "Tasks screen is not opened")
        tasksFlow.checkBoxNotSelected()

        XCTAssertTrue(tasksFlow.isCompleteAllButtonDisplayed(), "Complete All button is not displayed")
    
        tasksFlow.tapCompleteAllButton()
        tasksFlow.checkBoxIsSelected()
        
        XCTAssertTrue(tasksFlow.isCancelAllButtonDisplayed(), "Complete All button is not displayed")
        tasksFlow.tapCancelAllButton()
        tasksFlow.checkBoxNotSelected()
        
    }
    
    /**
     ### Tasks Page
     *  [TestCase] Check the visibility of the Sort By Name button.
     * [TestCase] Sort By Name button functionality.
     */
    public func testSortByNameFunctionality() throws {
        let actualConsistencyElements = ["Buy milk", "Pay rent", "Change tires", "Sleep", "Dance"]
        let resultSortingByName = ["Buy milk", "Change tires", "Dance", "Pay rent", "Sleep"]
        
        XCTAssert(loginFlow.isLoginScreenOpened(), "Login screen is not opened")
        loginFlow.loginVerificationScreen()
        if retryFlow.retryButtonDisplayed() {
            retryFlow.retryTapButton()
        }
        XCTAssertTrue(tasksFlow.isTitleTextFieldDisplayed(), "Tasks screen is not opened")
        tasksFlow.checkBoxNotSelected()

        XCTAssertTrue(tasksFlow.isCompleteAllButtonDisplayed(), "Complete All button is not displayed")
    
        tasksFlow.tapCompleteAllButton()
        tasksFlow.checkBoxIsSelected()
        
        tasksFlow.tapSortByNameButton()
        tasksFlow.checkElementsExistInOrderAfterSorting(actualСonsistencytElements: actualConsistencyElements, resultSortingByName: resultSortingByName)
        tasksFlow.tapCancelAllButton()
        XCTAssertFalse(tasksFlow.isCancelAllButtonDisplayed(), "Cancel All button is not displayed")
        tasksFlow.checkBoxNotSelected()
        
    }
    
    /**
     ### Tasks Page
     *  [TestCase] First checkBox and verify selected.
     */
    public func testFirstCheckBoxAndVerifySelected() throws {
        
        XCTAssert(loginFlow.isLoginScreenOpened(), "Login screen is not opened")
        loginFlow.loginVerificationScreen()
        if retryFlow.retryButtonDisplayed() {
            retryFlow.retryTapButton()
        }
        XCTAssertTrue(tasksFlow.isTitleTextFieldDisplayed(), "Tasks screen is not opened")
        tasksFlow.checkBoxNotSelected()
        
        tasksFlow.tapFirstCheckBoxAndVerifySelected()

    }
    
    /**
     ### Tasks Page
     * [TestCase] Back button functionality.
     */
    public func testCheckIconMoreInfo() throws {
        
        XCTAssert(loginFlow.isLoginScreenOpened(), "Login screen is not opened")
        loginFlow.loginVerificationScreen()
        if retryFlow.retryButtonDisplayed() {
            retryFlow.retryTapButton()
        }
        XCTAssertTrue(tasksFlow.isTitleTextFieldDisplayed(), "Tasks screen is not opened")
        XCTAssertTrue(tasksFlow.isIconMoreInfoDisplayed(), "Icon More Info is not displayed")
        tasksFlow.tapIconMoreInfo()
        

    }

}
