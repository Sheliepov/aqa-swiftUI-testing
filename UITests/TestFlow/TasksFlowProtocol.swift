//
//  TasksFlowProtocol.swift
//  UITests
//
//  Created by Serhii_Sheliepov on 08.11.2023.
//  Copyright © 2023 Cultured Code. All rights reserved.
//

import Foundation

protocol TasksFlowProtocol {

    func tapFirstCheckBoxAndVerifySelected()
    func checkBoxNotSelected()
    func expectedImageElements() -> Int
    func checkBoxIsSelected()

    func tapCompleteAllButton()
    func tapSortByNameButton()
    func tapCancelAllButton()
    func tapIconMoreInfo()

    func isTitleTextFieldDisplayed() -> Bool
    func isIconMoreInfoDisplayed() -> Bool
    func isCompleteAllButtonDisplayed() -> Bool
    func isCancelAllButtonDisplayed() -> Bool
    func isSortByNameButtonDisplayed() -> Bool
}


