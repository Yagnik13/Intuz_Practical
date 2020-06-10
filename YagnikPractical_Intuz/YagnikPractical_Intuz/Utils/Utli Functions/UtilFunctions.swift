//
//  UtilFunctions.swift
//  uClinic
//
//  Created by Viral Shah on 26/04/18.
//  Copyright © 2018 Viral Shah. All rights reserved.
//

import Foundation
import UIKit

//MARK:- ******** ALERT METHODS *********

func showAlertWithTitleFromVC(vc:UIViewController, andMessage message:String){
    showAlertWithTitleFromVC(vc: vc, title:"", andMessage: message, buttons: ["OK"]) { (index) in
    }
}


func showAlertWithTitleFromVC(vc:UIViewController, title:String, andMessage message:String, buttons:[String], completion:((_ index:Int) -> Void)!) -> Void {
    
    var newMessage = message
    if newMessage == "The Internet connection appears to be offline. Please check and try again" {
        newMessage = "The Internet connection appears to be offline. Please check and try again"
    }

    let alertController = UIAlertController(title: title, message: newMessage, preferredStyle: .alert)
    let subview = alertController.view.subviews.first! as UIView
    let alertContentView = subview.subviews.first! as UIView
    alertContentView.backgroundColor = UIColor.white
    alertContentView.applyCornerRadius(radius: 10)
    alertContentView.tintColor = UIColor.black
    
    let messageMutableString = NSMutableAttributedString(string: newMessage)
    let messageRange = NSRange(location: 0, length: messageMutableString.length)
//    messageMutableString.addAttribute(NSAttributedString.Key.font, value: UIFont.system (fontSize: 18), range: messageRange)
    messageMutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.appBlack, range: messageRange)
    alertController.setValue(messageMutableString, forKey: "attributedMessage")
    
    
    for index in 0..<buttons.count    { 
        let action = UIAlertAction(title: buttons[index], style: .default, handler: {
            (alert: UIAlertAction!) in
            if(completion != nil){
                completion(index)
            }
        })
        let attributedText = NSMutableAttributedString(string: buttons[index])
        
        let range = NSRange(location: 0, length: attributedText.length)
//        attributedText.addAttribute(NSAttributedString.Key.font, value: UIFont.appFont_CircularStdBook(fontSize: 17), range: range)
        alertController.addAction(action)
    }
    vc.present(alertController, animated: true, completion: nil)
}


//MARK:- ACTION SHEET
func showActionSheetWithTitleFromVC(vc:UIViewController, title:String, andMessage message:String, buttons:[String],canCancel:Bool, completion:((_ index:Int) -> Void)!) -> Void {
    
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
    
    
    
    for index in 0..<buttons.count    {
        
        let action = UIAlertAction(title: buttons[index], style: .default, handler: {
            (alert: UIAlertAction!) in
            if(completion != nil){
                completion(index)
            }
        })
        
        alertController.addAction(action)
    }
    
    if(canCancel){
        let action = UIAlertAction(title: "Cancel".localized, style: .cancel, handler: {
            (alert: UIAlertAction!) in
            if(completion != nil){
                completion(buttons.count)
            }
        })
        
        alertController.addAction(action)
    }
    
    vc.present(alertController, animated: true, completion: nil)
}

func resizeImage(_ image: UIImage, longEdge: CGFloat) -> UIImage {
    
    var newHeight = image.size.height
    var newWidth = image.size.width
    
    if newHeight < 1000 && newWidth < 1000{
        return image
    }
    
    var scale = longEdge / image.size.height
    
    if newHeight > newWidth{
        scale = longEdge / image.size.height
        newWidth = image.size.width * scale
        newHeight = longEdge
    }else{
        scale = longEdge / image.size.width
        newHeight = image.size.height * scale
        newWidth = longEdge
    }
    UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
    image.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
    let newImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    return newImage!
}

