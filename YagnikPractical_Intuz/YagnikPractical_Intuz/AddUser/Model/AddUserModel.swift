//
//  AddUserModel.swift
//  YagnikPractical_Intuz
//
//  Created by Yagnik Suthar on 10/06/20.
//  Copyright © 2020 Yagnik Suthar. All rights reserved.
//

import Foundation

struct AddUserModel {
    let firstname: String
    let lastname: String
    let email: String
    let phone: String
    let address: String
    
    init(firstname: String, lastname: String, email: String, phone: String, address: String) {
        self.firstname = firstname
        self.lastname = lastname
        self.email = email
        self.phone = phone
        self.address = address
    }
}
