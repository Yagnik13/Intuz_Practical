//
//  Extension_UITextField.swift
//  GoRate
//
//  Created by Bhavin Mistry on 11/09/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit

extension UITextField {
    func setupUIForTextField(font: UIFont, textColor: UIColor, placeHolderString: String) {
        self.placeholder = placeHolderString
        self.font = font
        self.textColor = textColor
    }
    
    func setIconRightSide(_ image: UIImage) {
        let arrow = UIImageView(image: image)
        arrow.frame = CGRect(x: 0.0, y: 0.0, width: 30, height: 30)
        arrow.contentMode = .center
        rightView = arrow
        rightViewMode = .always
    }
    
    func setIconLeftSide(_ image: UIImage) {
        let arrow = UIImageView(image: image)
        if let size = arrow.image?.size {
            arrow.frame = CGRect(x: 0.0, y: 0.0, width: size.width + 10.0, height: size.height + 10.0)
        }
        arrow.contentMode = .center
        leftView = arrow
        leftViewMode = .always
    }
}
