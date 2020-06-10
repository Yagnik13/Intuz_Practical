//
//  AddUserViewController.swift
//  YagnikPractical_Intuz
//
//  Created by Yagnik Suthar on 10/06/20.
//  Copyright © 2020 Yagnik Suthar. All rights reserved.
//

import UIKit
import CoreData

class AddUserViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var addressTextView: UITextView!
    @IBOutlet weak var saveButton: UIButton!
    
     //MARK:- UIView Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //MARK:- Validation Action
    func isValid() -> Bool {
        var msg = ""
        if firstNameTextField.text == ""{
            msg = "Please enter first name."
            lastNameTextField.becomeFirstResponder()
        }else if lastNameTextField.text == ""{
            msg = "Please enter last name."
            emailTextField.becomeFirstResponder()
        }else if emailTextField.text == ""{
            msg = "Please enter email address."
            phoneNumberTextField.becomeFirstResponder()
        }else if phoneNumberTextField.text == ""{
            msg = "Please enter phone number."
            addressTextView.becomeFirstResponder()
        }else if addressTextView.text?.count ?? 0 <= 0 {
            msg = "Please enter address."
            addressTextView.resignFirstResponder()
        }
        
        if msg.count > 0 {
             showAlertWithTitleFromVC(vc: self, andMessage: msg)
            return false
        }
        return true
    }

    //MARK:- Button Action
    @IBAction func saveButtonAction(_ sender: Any) {
        if isValid() {
            self.saveInCoreData(firstname: firstNameTextField.text ?? "", lastname: lastNameTextField.text ?? "", email: emailTextField.text ?? "", phone: phoneNumberTextField.text ?? "", address: addressTextView.text ?? "")
        }
    }
}

//MARK:- Core Data Save Method
extension AddUserViewController {
    
    func saveInCoreData(firstname: String, lastname: String, email: String, phone: String, address: String) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "UserDetails", in: managedContext)!
        
        let objLocationDetail = NSManagedObject(entity: entity,insertInto: managedContext)
        objLocationDetail.setValue(firstname, forKey: "firstname")
        objLocationDetail.setValue(lastname, forKey: "lastname")
        objLocationDetail.setValue(email, forKey: "email")
        objLocationDetail.setValue(phone, forKey: "phone")
        objLocationDetail.setValue(address, forKey: "address")
        
        do {
            try context.save()
            print("saved successfully")
            self.navigationController?.popViewController(animated: true)
        } catch {
            print("Failed saving")
        }
    }
    
}
