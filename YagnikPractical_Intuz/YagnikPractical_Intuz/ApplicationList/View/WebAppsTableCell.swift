//
//  WebAppsTableCell.swift
//  YagnikPractical_Intuz
//
//  Created by Yagnik Suthar on 10/06/20.
//  Copyright © 2020 Yagnik Suthar. All rights reserved.
//

import UIKit
import SDWebImage

class WebAppsTableCell: UITableViewCell {
    
    @IBOutlet weak var appImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var freeButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
