//
//  ButtonFragment.swift
//  UITests
//
//  Created by Serhii_Sheliepov on 08.11.2023.
//  Copyright © 2023 Cultured Code. All rights reserved.
//

import Foundation

class ButtonFragment: BaseFragment {
    
    func tap() {
        getRootElement().tap()
    }
    
    var present: Bool {
        return getRootElement().isPresent
    }
    
    var visible: Bool {
        return getRootElement().isVisible
    }
    
    var enabled: Bool {
        return getRootElement().isEnabled
    }
    
    var selected: Bool {
        return getRootElement().isSelected
    }
    
    var text: String {
        return getRootElement().label
    }
}
