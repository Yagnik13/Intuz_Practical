//
//  Extension_UIViewController.swift
//  HeyU
//
//  Created by viral shah on 31/12/17.
//  Copyright © 2017 viral shah. All rights reserved.
//

import UIKit
//import SlideMenuControllerSwift

extension UIViewController {
    func setNavigationWithBack(_ tintColor: UIColor = UIColor.clear) {
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.isExclusiveTouch = true
//        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key(rawValue: NSAttributedString.Key.foregroundColor.rawValue) : UIColor.white,
//                                                                        NSAttributedString.Key(rawValue: NSAttributedString.Key.font.rawValue) : UIFont.sta(fontSize: 17)]
        self.navigationController?.navigationBar.tintColor = UIColor.clear
        self.navigationController?.navigationBar.barTintColor = UIColor.clear
        //self.navigationController?.navigationBar.backgroundColor = UIColor.clear
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        
        let btn1 = UIButton(type: .custom)
        btn1.setImage(UIImage(named: "ic_leftArrow"), for: .normal)
        btn1.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        btn1.addTarget(self, action: #selector(self.buttonActionMethodName), for: .touchUpInside)
        
        let backBtn:UIBarButtonItem = UIBarButtonItem(customView: btn1)
        self.navigationController?.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationItem.leftBarButtonItem = backBtn
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.view.backgroundColor = UIColor.clear
    }
    
    func setNavigationWithBackAndTitle(_ tintColor: UIColor = UIColor.appBlack) {
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.isExclusiveTouch = true
        self.navigationController?.navigationBar.tintColor = UIColor.appBlack
        self.navigationController?.navigationBar.barTintColor = UIColor.appBlack
        //self.navigationController?.navigationBar.backgroundColor = UIColor.appBlack
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
//        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key(rawValue: NSAttributedString.Key.foregroundColor.rawValue) : UIColor.white,
//                                                                        NSAttributedString.Key(rawValue: NSAttributedString.Key.font.rawValue) : UIFont.appFont_CircularStdBook(fontSize: 17)]
        let btn1 = UIButton(type: .custom)
        btn1.setImage(UIImage(named: "ic_leftArrow"), for: .normal)
        btn1.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        btn1.addTarget(self, action: #selector(self.buttonActionMethodName), for: .touchUpInside)
        
        let backBtn:UIBarButtonItem = UIBarButtonItem(customView: btn1)
        self.navigationController?.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationItem.leftBarButtonItem = backBtn
    }
    
    func setNavigationwithBackGroundColor(_ tintColor: UIColor = UIColor.appBlack) {
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.isExclusiveTouch = true
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.barTintColor = UIColor.appBlack
        //self.navigationController?.navigationBar.backgroundColor = UIColor.appBlack
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
//        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key(rawValue: NSAttributedString.Key.foregroundColor.rawValue) : UIColor.white,
//                                                                        NSAttributedString.Key(rawValue: NSAttributedString.Key.font.rawValue) : UIFont.appFont_CircularStdBook(fontSize: 17)]
    }
    
    func setNavigationBarWithoutTitleImage(_ tintColor: UIColor = .white) {
        self.navigationController?.navigationBar.barTintColor = UIColor.clear
        self.navigationController?.navigationBar.shadowImage = UIImage()
        let backButton = UIBarButtonItem(image: UIImage(named: "ic_leftArrow"), style: .plain, target: self, action: nil)
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
//        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key(rawValue: NSAttributedString.Key.foregroundColor.rawValue) : UIColor.white,
//                                                                        NSAttributedString.Key(rawValue: NSAttributedString.Key.font.rawValue) : UIFont.appFont_CircularStdBook(fontSize: 18)]
        
        let searchImage:UIImage = UIImage(named: "ic_leftArrow")!
        let backBtn:UIBarButtonItem = UIBarButtonItem(image: searchImage,  style: UIBarButtonItem.Style.plain, target: self, action: #selector(self.buttonActionMethodName))
        
        self.navigationItem.leftBarButtonItem = backBtn
    }
    
    @objc func buttonActionMethodName(){
        self.navigationController!.popViewController(animated: true)
    }
    
    func setNavigationBar(_ tintColor: UIColor = .white) {
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.isExclusiveTouch = true
        self.navigationController?.navigationBar.tintColor = tintColor
        self.navigationController?.navigationBar.barTintColor = UIColor.black
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        //self.navigationController?.view.backgroundColor = APP_PRIMARY_COLOR
        self.navigationController?.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage() , for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
//        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key(rawValue: NSAttributedString.Key.foregroundColor.rawValue) : UIColor.white,
//                                                                        NSAttributedString.Key(rawValue: NSAttributedString.Key.font.rawValue) : UIFont.appFont_CircularStdBook(fontSize: 22)]
//        let imageView = UIImageView()
////        imageView.image = #imageLiteral(resourceName: "logo_small")
//        self.navigationController?.navigationBar.topItem?.titleView = imageView
        //        self.navigationController?.navigationBar.backIndicatorImage = UIImage(named: "ic_back_txt")
        //        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "ic_back_txt")
    }
    
    func setNavigationTitleImage(_ tintColor: UIColor = .white) {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "logo_small")
        self.navigationController?.navigationBar.topItem?.titleView = imageView
    }
    
    func setNavigationClearColor(){
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.barStyle = .blackOpaque
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = UIColor.clear
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.barTintColor = UIColor.clear
//        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font : UIFont.appFont_CircularStdBook(fontSize: 22),NSAttributedString.Key.foregroundColor : UIColor.white]
    }
    
    var previousViewController:UIViewController?{
        if let controllersOnNavStack = self.navigationController?.viewControllers{
            let n = controllersOnNavStack.count
            //if self is still on Navigation stack
            if controllersOnNavStack.last === self, n > 1{
                return controllersOnNavStack[n - 2]
            }else if n > 0{
                return controllersOnNavStack[n - 1]
            }
        }
        return nil
    }
    
}


extension UIApplication {
    
    var statusBarView: UIView? {
        if responds(to: Selector(("statusBar"))) {
            return value(forKey: "statusBar") as? UIView
        }
        return nil
    }
    
    class func topViewController(_ viewController: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = viewController as? UINavigationController {
            return topViewController(nav.visibleViewController)
        }
        if let tab = viewController as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(selected)
            }
        }
        if let presented = viewController?.presentedViewController {
            return topViewController(presented)
        }
        
        //        if let slide = viewController as? SideMenuController{
        //            return topViewController(slide.menuViewController)
        //        }
        return viewController
    }
}

extension UIViewController {
    func topMostViewController() -> UIViewController {
        
        if let presented = self.presentedViewController {
            return presented.topMostViewController()
        }
        
        if let navigation = self as? UINavigationController {
            return navigation.visibleViewController?.topMostViewController() ?? navigation
        }
        
        if let tab = self as? UITabBarController {
            return tab.selectedViewController?.topMostViewController() ?? tab
        }
        
        return self
    }
}

extension UIApplication {
    func topMostViewController() -> UIViewController? {
        return self.keyWindow?.rootViewController?.topMostViewController()
    }
}

extension UINavigationBar {
    
    func showBorderLine() {
        findBorderLine()?.isHidden = false
    }
    
    func hideBorderLine() {
        findBorderLine()?.isHidden = true
    }
    
    private func findBorderLine() -> UIImageView! {
        return self.subviews
            .flatMap { $0.subviews }
            .compactMap { $0 as? UIImageView }
            .filter { $0.bounds.size.width == self.bounds.size.width }
            .filter { $0.bounds.size.height <= 2 }
            .first
    }
}
