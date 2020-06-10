//
//  ApplicationListViewController.swift
//  YagnikPractical_Intuz
//
//  Created by Yagnik Suthar on 10/06/20.
//  Copyright © 2020 Yagnik Suthar. All rights reserved.
//

import UIKit
import SDWebImage

class ApplicationListViewController: UIViewController {
    
    //MARK:- Outlets
    @IBOutlet weak var listTableView: UITableView!
    
    //MARK:- Properties
    let viewModel = ApplicationListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.listTableView.tableFooterView = UIView()
        
        viewModel.getDataFromWeb { (isFatched) in
            if isFatched {
                DispatchQueue.main.async {
                    self.listTableView.reloadData()
                }
            }
        }
    }
    
}
//MARK:- Data Source Delegate methods
extension ApplicationListViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return viewModel.arrApps.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "WebAppsTableCell", for: indexPath) as? WebAppsTableCell {
            let curr = viewModel.arrApps[indexPath.row]
            cell.titleLabel.text = curr.trackName
            if let url = getValidImageURL(with: curr.artworkUrl512 ?? "") {
                cell.appImageView.sd_setImage(with: url, placeholderImage: UIImage(named: "ic_img_placeholder"))
            }
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}
