//
//  SleepTests.swift
//  UITests
//
//  Created by Serhii_Sheliepov on 08.11.2023.
//  Copyright © 2023 Cultured Code. All rights reserved.
//

import Foundation
import XCTest

public class SleepTests: BaseUITest {
    
    /**
     ### Sleep Page
     * [TestCase] Check Sleep page is open.
     * [TestCase] Check Sleep title field is displayed.
     * [TestCase] Check the names of items in the checklist.
     * [TestCase] Check the number of items on the checklist.
     * [TestCase] Check the visibility of the Complete All button.
     * [TestCase] Check the visibility of the Sort By Name button.
     * [TestCase] Check that Logout button is displayed.
     * [TestCase] Check that Logout popup is open.
     * [TestCase] Logout title is displayed.
     * [TestCase] Logout title is correct.
     * [TestCase] Cansel button functionality
     */
    public func testPageSleepElementsIsDisplayed() throws {
        let checkListElements = ["Find a bed", "Lie down", "Close eyes", "Wait"]
        
        XCTAssert(loginFlow.isLoginScreenOpened(), "Login screen is not opened")
        loginFlow.loginVerificationScreen()
        if retryFlow.retryButtonDisplayed() {
            retryFlow.getErrorDiscriptionText()
            retryFlow.retryTapButton()
        }
        XCTAssertTrue(tasksFlow.isTitleTextFieldDisplayed(), "Tasks screen is not opened")
        XCTAssertTrue(tasksFlow.isIconMoreInfoDisplayed(), "Icon More Info is not displayed")
        tasksFlow.tapIconMoreInfo()
        XCTAssertTrue(sleepFlow.isTitleTextFieldDisplayed(), "Sleep screen is not opened")
        
        sleepFlow.checkElementsExist(elementIdentifiers: checkListElements)
        XCTAssertTrue(sleepFlow.isCompleteAllButtonDisplayed(), "Complete All button is not displayed")
        XCTAssertTrue(sleepFlow.isSortByNameButtonDisplayed(), "Sort By Name button is not displayed")
        
        sleepFlow.checkBoxNotSelected()
        XCTAssertTrue(logoutFlow.isLogoutButtonDisplayed(), "Logout button is not displayed")
        
        logoutFlow.tapLogoutButton()
        XCTAssertTrue(logoutFlow.isTitlePopupLogoutTextDisplayed(), "Logout title is not displayed")
        XCTAssertTrue(logoutFlow.checkExpectedLogoutText(), "Logout header is not correct")
        XCTAssertTrue(logoutFlow.isCancelPopupButtonDisplayed(), "Cancel button is not dispalyed")
        logoutFlow.tapCancelPopupButton()
        XCTAssertFalse(logoutFlow.isCancelPopupButtonDisplayed(), "Cancel button is dispalyed")
        
    }
    
    /**
     ### Sleep Page
     * [TestCase] Check the visibility of the Complete All button.
     * [TestCase] Check the visibility of the Sort By Name button.
     * [TestCase] Check that checkboxes status is not selected.
     * [TestCase] Check that checkboxes are selected after clicking the Complete All button.
     */
    public func testCompleteAllFunctionality() throws {
        let actualCountElements = 4
    
        XCTAssert(loginFlow.isLoginScreenOpened(), "Login screen is not opened")
        loginFlow.loginVerificationScreen()
        if retryFlow.retryButtonDisplayed() {
            retryFlow.retryTapButton()
        }
        XCTAssertTrue(tasksFlow.isTitleTextFieldDisplayed(), "Tasks screen is not opened")

        XCTAssertTrue(tasksFlow.isIconMoreInfoDisplayed(), "Icon More Info is not displayed")
        tasksFlow.tapIconMoreInfo()
        XCTAssertTrue(sleepFlow.isTitleTextFieldDisplayed(), "Sleep screen is not opened")
        
        XCTAssertTrue(sleepFlow.isCompleteAllButtonDisplayed(), "Complete All button is not displayed")
        sleepFlow.checkBoxNotSelected()
        XCTAssertEqual(sleepFlow.expectedImageElements(), actualCountElements, "There are no '\(actualCountElements)' checklist items on this page ")
        sleepFlow.tapCompleteAllButton()
        sleepFlow.checkBoxIsSelected()
        
    }
    
    /**
     ### Sleep Page
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
        
        XCTAssertTrue(tasksFlow.isIconMoreInfoDisplayed(), "Icon More Info is not displayed")
        tasksFlow.tapIconMoreInfo()
        XCTAssertTrue(sleepFlow.isTitleTextFieldDisplayed(), "Sleep screen is not opened")
        
        XCTAssertTrue(sleepFlow.isCompleteAllButtonDisplayed(), "Complete All button is not displayed")
        sleepFlow.tapCompleteAllButton()
        sleepFlow.checkBoxIsSelected()
        
        XCTAssertTrue(sleepFlow.isCancelAllButtonDisplayed(), "Cancel All button is not displayed")
        sleepFlow.tapCancelAllButton()
        sleepFlow.checkBoxNotSelected()
        
    }
    
    /**
     ### Sleep Page
     *  [TestCase] Check the visibility of the Sort By Name button.
     * [TestCase] Sort By Name button functionality.
     */
    public func testSortByNameFunctionality() throws {
        let actualConsistencyElements = ["Find a bed", "Lie down", "Close eyes", "Wait"]
        let resultSortingByName = ["Close eyes", "Find a bed", "Lie down", "Wait"]
        
        XCTAssert(loginFlow.isLoginScreenOpened(), "Login screen is not opened")
        loginFlow.loginVerificationScreen()
        if retryFlow.retryButtonDisplayed() {
            retryFlow.retryTapButton()
        }
        XCTAssertTrue(tasksFlow.isTitleTextFieldDisplayed(), "Tasks screen is not opened")
        
        XCTAssertTrue(tasksFlow.isIconMoreInfoDisplayed(), "Icon More Info is not displayed")
        tasksFlow.tapIconMoreInfo()
        XCTAssertTrue(sleepFlow.isTitleTextFieldDisplayed(), "Sleep screen is not opened")
        
        sleepFlow.checkBoxNotSelected()

        XCTAssertTrue(sleepFlow.isCompleteAllButtonDisplayed(), "Complete All button is not displayed")
    
        sleepFlow.tapCompleteAllButton()
        sleepFlow.checkBoxIsSelected()
        
        sleepFlow.tapSortByNameButton()
        sleepFlow.checkElementsExistInOrderAfterSorting(actualСonsistencytElements: actualConsistencyElements, resultSortingByName: resultSortingByName)
        sleepFlow.tapCancelAllButton()
        XCTAssertFalse(sleepFlow.isCancelAllButtonDisplayed(), "Cancel All button is not displayed")
        tasksFlow.checkBoxNotSelected()
        
    }
    
    /**
     ### Sleep Page
     *  [TestCase] Check the visibility of the Sort By Name button.
     * [TestCase] Sort By Name button functionality.
     */
    public func testFirstCheckBoxAndVerifySelected() throws {
        
        XCTAssert(loginFlow.isLoginScreenOpened(), "Login screen is not opened")
        loginFlow.loginVerificationScreen()
        if retryFlow.retryButtonDisplayed() {
            retryFlow.retryTapButton()
        }
        XCTAssertTrue(tasksFlow.isTitleTextFieldDisplayed(), "Tasks screen is not opened")
        
        XCTAssertTrue(tasksFlow.isIconMoreInfoDisplayed(), "Icon More Info is not displayed")
        tasksFlow.tapIconMoreInfo()
        XCTAssertTrue(sleepFlow.isTitleTextFieldDisplayed(), "Sleep screen is not opened")
        
        sleepFlow.checkBoxNotSelected()
        sleepFlow.tapFirstCheckBoxAndVerifySelected()

    }
    
    /**
     ### Sleep Page
     *  [TestCase] Check the visibility of the Sort By Name button.
     * [TestCase] Sort By Name button functionality.
     */
    public func testBackButton() throws {
        
        XCTAssert(loginFlow.isLoginScreenOpened(), "Login screen is not opened")
        loginFlow.loginVerificationScreen()
        if retryFlow.retryButtonDisplayed() {
            retryFlow.retryTapButton()
        }
        XCTAssertTrue(tasksFlow.isTitleTextFieldDisplayed(), "Tasks screen is not opened")
        XCTAssertTrue(tasksFlow.isIconMoreInfoDisplayed(), "Icon More Info is not displayed")
        tasksFlow.tapIconMoreInfo()
        XCTAssertTrue(sleepFlow.isTitleTextFieldDisplayed(), "Sleep screen is not opened")
        
        sleepFlow.tapBackButton()
        XCTAssertTrue(tasksFlow.isTitleTextFieldDisplayed(), "Tasks screen is not opened")
        
    }
}
