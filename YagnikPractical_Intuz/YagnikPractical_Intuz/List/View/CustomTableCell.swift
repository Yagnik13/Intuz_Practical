//
//  CustomTableCell.swift
//  YagnikPractical_Intuz
//
//  Created by Yagnik Suthar on 10/06/20.
//  Copyright © 2020 Yagnik Suthar. All rights reserved.
//

import UIKit

class CustomTableCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
