//
//  Extension_UITableView.swift
//  StyleClick
//
//  Created by Yagnik Suthar on 18/06/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    
    func scrollToBottom(){
        self.reloadData()
        DispatchQueue.main.async {
            let indexPath = IndexPath(
                row: self.numberOfRows(inSection:  self.numberOfSections - 1) - 1,
                section: self.numberOfSections - 1)
            self.scrollToRow(at: indexPath, at: .bottom, animated: false)
        }
    }
    
    func scrollToTop() {
        
        DispatchQueue.main.async {
            let indexPath = IndexPath(row: 0, section: 0)
            self.scrollToRow(at: indexPath, at: .top, animated: false)
        }
    }
}
