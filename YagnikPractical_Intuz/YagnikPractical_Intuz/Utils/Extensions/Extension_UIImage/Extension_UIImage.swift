//
//  Extension_UIImage.swift
//  StyleClick
//
//  Created by Yagnik Suthar on 06/03/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    
    func resizeImage(longEdge: CGFloat = 1000) -> UIImage {
        var newHeight = self.size.height
        var newWidth = self.size.width
        if newHeight < longEdge && newWidth < longEdge{
            return self
        }
        var scale = longEdge / self.size.height
        if newHeight > newWidth{
            scale = longEdge / self.size.height
            newWidth = self.size.width * scale
            newHeight = longEdge
        }else{
            scale = longEdge / self.size.width
            newHeight = self.size.height * scale
            newWidth = longEdge
        }
        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
        self.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
}
