//
//  Extension_UIColor.swift
//  uClinic
//
//  Created by Viral Shah on 26/04/18.
//  Copyright © 2018 Viral Shah. All rights reserved.
//

import UIKit

extension UIColor {
    static var appBlack = UIColor(red: 11/255, green: 11/255, blue: 9/255, alpha: 1)
    static var appPlaceHolderGray = UIColor(red: 229/255, green: 229/255, blue: 229/255, alpha: 1)
    static var appGray = UIColor(red: 142/255, green: 142/255, blue: 143/255, alpha: 1)
    static var appBlue = UIColor(red: 59/255, green: 89/255, blue: 153/255, alpha: 1)
    static var appRed = UIColor(red: 221/255, green: 75/255, blue: 57/255, alpha: 1)
    static var appWhite10Opacity = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.1)
    static var appWhite50Opacity = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.5)
    static var appWhite80Opacity = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.8)
    static var appDashedBorder = UIColor(red: 74/255, green: 74/255, blue: 74/255, alpha: 1)
    static var appSeparatorGray = UIColor(red: 221/255, green: 221/255, blue: 221/255, alpha: 1)
    static var appTabGray = UIColor(red: 142/255, green: 142/255, blue: 143/255, alpha: 1)
    static var appTextViewBackground = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1)
    static var appPurple = UIColor(red: 87/255, green: 88/255, blue: 237/255, alpha: 1)
    
    static var appGreen = UIColor(red: 73/255, green: 165/255, blue: 73/255, alpha: 1)
    static var appLightGreen = UIColor(red: 73/255, green: 165/255, blue: 73/255, alpha: 0.1)
    static var appRedStatus = UIColor(red: 255/255, green: 71/255, blue: 93/255, alpha: 1)
    static var appLightRed = UIColor(red: 255/255, green: 71/255, blue: 93/255, alpha: 0.1)
    static var appYellow = UIColor(red: 255/255, green: 255/255, blue: 153/255, alpha: 0.1)
    static var appYellowStatus = UIColor(red: 255/255, green: 255/255, blue: 51/255, alpha: 0.1)
    
    static var appLightGray = UIColor(red: 229/255, green: 229/255, blue: 229/255, alpha: 1)
    static var appLightGrayForView = UIColor(red: 239/255, green: 239/255, blue: 239/255, alpha: 1)
    
//    static var gradiantYellow = UIColor(red: 1.00, green: 0.90, blue: 0.06, alpha: 1)
//    static var gradiantGold = UIColor(red: 0.99, green: 0.79, blue: 0.07, alpha: 1)
    static var appConfirmGreen = UIColor(red: 126/255, green: 211/255, blue: 33/255, alpha:1)
    static var appDescGray = UIColor(red: 29/255, green: 29/255, blue: 29/255, alpha:1)
    static var appTextFieldGray = UIColor(red: 93/255, green: 93/255, blue: 93/255, alpha:1)
    
      static var appDarkBlue =  UIColor(red: 83/255, green: 181/255, blue: 249/255, alpha: 1)
      static var appLightBlue =  UIColor(red: 83/255, green: 181/255, blue: 249/255, alpha: 0.1)
    
    static var appPurpleBorder =  UIColor(red: 87/255, green: 88/255, blue: 237/255, alpha: 0.1)
    static var appSkyBlueBorder =  UIColor(red: 83/255, green: 181/255, blue: 249/255, alpha: 0.1)
    static var appYellowBorder =  UIColor(red: 253/255, green: 202/255, blue: 17/255, alpha: 0.1)
    static var appGreenBorder =  UIColor(red: 73/255, green: 165/255, blue: 73/255, alpha: 0.1)
    static var appRedBorder =  UIColor(red: 255/255, green: 71/255, blue: 93/255, alpha: 0.1)
    
    static var appTextFieldBGGray = UIColor(red: 239/255, green: 239/255, blue: 239/255, alpha:1)
    static var appTextFieldPlaceholderGray = UIColor(red: 160/255, green: 160/255, blue: 161/255, alpha:1)
    
    //subsctiption color
    static var appOrange = UIColor(red: 253/255, green: 202/255, blue: 17/255, alpha:1)
    static var appSky = UIColor(red: 83/255, green: 181/255, blue: 249/255, alpha:1)
    static var appDarkGreen = UIColor(red: 73/255, green: 165/255, blue: 73/255, alpha:1)
    static var appChatBorder = UIColor(red: 226/255, green: 226/255, blue: 226/255, alpha:1)
    
    static var appBlackWithAlpha20 = UIColor(red: 11/255, green: 11/255, blue: 9/255, alpha: 0.2)
    
}

extension UIColor {
    
    convenience init(hexString: String, alpha: CGFloat = 1.0) {
        let hexString: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        if (hexString.hasPrefix("#")) {
            scanner.scanLocation = 1
        }
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
    func toHexString() -> String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        getRed(&r, green: &g, blue: &b, alpha: &a)
        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
        return String(format:"#%06x", rgb)
    }
}
