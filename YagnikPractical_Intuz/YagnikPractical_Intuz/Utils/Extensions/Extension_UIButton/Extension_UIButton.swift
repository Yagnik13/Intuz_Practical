//
//  Extension_UIButton.swift
//  GoRate
//
//  Created by Bhavin Mistry on 11/09/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit

extension UIButton {
    func setupUIForButton(font: UIFont, textColor: UIColor, text: String) {
        self.setTitle(text, for: .normal)
        self.setTitleColor(textColor, for: .normal)
        self.titleLabel?.font = font
    }
}
