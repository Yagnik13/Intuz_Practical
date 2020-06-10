//
//  ViewController.swift
//  YagnikPractical_Intuz
//
//  Created by Yagnik Suthar on 10/06/20.
//  Copyright © 2020 Yagnik Suthar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK:- Outlets
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var isRemeber: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    var isChecked : Bool = false
    //MARK:- UIView Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.emailTextField.text = ""
        self.passwordTextField.text = ""
    }
    
    //MARK:- Validation Action
    func isValid() -> Bool {
        var msg = ""
        if emailTextField.text == ""{
            msg = "Please enter email address"
            passwordTextField.becomeFirstResponder()
        }else if passwordTextField.text?.count ?? 0 <= 0 {
            msg = "Please enter password."
            passwordTextField.resignFirstResponder()
        }
        
        if emailTextField.text != "test@gmail.com" {
            msg = "Please enter valid email address"
        }else if passwordTextField.text != "test123" {
            msg = "Please enter valid password"
        }
        
        if msg.count > 0 {
             showAlertWithTitleFromVC(vc: self, andMessage: msg)
            return false
        }
        return true
    }

    //MARK:- Button Action
    @IBAction func loginButtonAction(_ sender: Any) {
        if isValid() {
            presentToListVC()
        }
    }
    
    @IBAction func onSelectClicked(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        self.isChecked = sender.isSelected
        UserDefaults.standard.set(self.isChecked, forKey: "isRemeber")
        UserDefaults.standard.synchronize()
    }
    
    func presentToListVC(){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "AppListViewController") as! AppListViewController
        let navVC = UINavigationController(rootViewController: vc)
        navVC.modalPresentationStyle = .fullScreen
//        navVC.navigationBar.tintColor = .black
//        navVC.navigationBar.backgroundColor = .black
//        navVC.navigationController?.navigationBar.isTranslucent = true
        self.present(navVC, animated: true, completion: nil)
    }
}

