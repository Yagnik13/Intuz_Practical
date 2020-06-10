//
//  Globals.swift
//  uClinic
//
//  Created by Viral Shah on 26/04/18.
//  Copyright © 2018 Viral Shah. All rights reserved.
//

import Foundation
import UIKit

let appDelegate = UIApplication.shared.delegate as! AppDelegate
let managedObjectContext = appDelegate.persistentContainer.viewContext
let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
let USER_DEFAULT = UserDefaults.standard

//MARK:- *********** INTERNET CHECK *************

//func IS_INTERNET_AVAILABLE() -> Bool {
//    return BTReachabilityManager.shared.isInternetAvailableForAllNetworks()
//}


var INTERNET_MESSAGE:String = ""

func SHOW_INTERNET_ALERT() {
    INTERNET_MESSAGE = "Your internet connection appears to be offline. Please check connection and try again."
    showAlertWithTitleFromVC(vc: (appDelegate.window?.rootViewController)!, title:"", andMessage: INTERNET_MESSAGE, buttons: ["Dismiss"]) { (index) in
    } 
}

//MARK: - ******** PROPOTIONAL FUNCTIONS **********

let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
let SCREEN_WIDTH = UIScreen.main.bounds.size.width

let PROPOTIONAL_WIDTH : CGFloat = 34

func GET_PROPORTIONAL_WIDTH (width:CGFloat) -> CGFloat {
    return ((SCREEN_WIDTH * width)/750)
}
func GET_PROPORTIONAL_HEIGHT (height:CGFloat) -> CGFloat {
    return ((SCREEN_HEIGHT * height)/1334)
}


func getValidImageURL(with rowUrl: String) -> URL? {
    if let stringUrl = rowUrl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
        if let url = URL(string: stringUrl) {
            return url
        }
    }
    return nil
}

func verifyUrl(urlString: String?) -> Bool {
    //Check for nil
    if let urlString = urlString {
        // create NSURL instance
        if let url = NSURL(string: urlString) {
            // check if your application can open the NSURL instance
            return UIApplication.shared.canOpenURL(url as URL)
        }
    }
    return false
}

extension UIApplication {
    /// Dismiss keyboard from key window.
    public static func endEditing(_ force: Bool = false) {
        shared.keyWindow?.endEditing(force)
    }
}

extension CALayer {
    func addBorder(edge: UIRectEdge, color: UIColor, thickness: CGFloat) {
        let border = CALayer();
        
        switch edge {
        case UIRectEdge.top:
            border.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: thickness)
            break
        case UIRectEdge.bottom:
            border.frame = CGRect(x:0, y:self.frame.height - thickness, width:self.frame.width, height:thickness)
            break
        case UIRectEdge.left:
            border.frame = CGRect(x:0, y:0, width: thickness, height: self.frame.height)
            break
        case UIRectEdge.right:
            border.frame = CGRect(x:self.frame.width - thickness, y: 0, width: thickness, height:self.frame.height)
            break
        default:
            break
        }
        
        border.backgroundColor = color.cgColor;
        
        self.addSublayer(border)
    }
    
}

extension UIBarButtonItem {
    static var flexibleSpaceBarButton: UIBarButtonItem {
        return UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
    }
    
}

