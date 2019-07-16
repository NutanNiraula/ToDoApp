//
//  ButtonExtension.swift
//  ToDoApp
//
//  Created by Nutan Niraula on 7/16/19.
//  Copyright © 2019 Nutan Niraula. All rights reserved.
//

import UIKit

extension UIButton {
    
    func setEnabled(state: Bool) {
        alpha = state ? 1 : 0.5
        isUserInteractionEnabled = state
    }
    
}

