//
//  LogoutFlowProtocol.swift
//  UITests
//
//  Created by Serhii_Sheliepov on 10.11.2023.
//  Copyright © 2023 Cultured Code. All rights reserved.
//

import Foundation

protocol LogoutFlowProtocol {
    
    func tapCancelPopupButton()
    func tapLogoutButton()

    func isTitlePopupLogoutTextDisplayed() -> Bool
    func checkExpectedLogoutText() -> Bool
    func isCancelPopupButtonDisplayed() -> Bool
    func isLogoutButtonDisplayed() -> Bool

}
