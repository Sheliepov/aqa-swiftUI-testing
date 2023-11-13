//
//  SleepFlowProtocol.swift
//  UITests
//
//  Created by Serhii_Sheliepov on 08.11.2023.
//  Copyright © 2023 Cultured Code. All rights reserved.
//

import Foundation

protocol SleepFlowProtocol {
    
    func isTitleTextDisplayed() -> Bool
    func tapFirstCheckBoxAndVerifySelected()
    func checkBoxNotSelected()
    func expectedImageElements() -> Int
    func checkBoxIsSelected()

    func tapCompleteAllButton()
    func tapSortByNameButton()
    func tapCancelAllButton()
   
    func isTitleTextFieldDisplayed() -> Bool
    func isCompleteAllButtonDisplayed() -> Bool
    func isCancelAllButtonDisplayed() -> Bool
    func isSortByNameButtonDisplayed() -> Bool
}
