//
//  AppListViewController.swift
//  YagnikPractical_Intuz
//
//  Created by Yagnik Suthar on 10/06/20.
//  Copyright © 2020 Yagnik Suthar. All rights reserved.
//

import UIKit
import CoreData

class AppListViewController: UIViewController {
    
    //MARK:- Outlets
    @IBOutlet weak var listTableView: UITableView!
    
    //MARK:- Properties
    var arrUsers = [AddUserModel]()

    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.listTableView.tableFooterView = UIView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchDetailFromCoreData()
    }
    
    @IBAction func appsButtonAction(_ sender: Any) {
        pushToWebApplicationViewController()
    }
    
    func pushToWebApplicationViewController() {
        guard let controller = mainStoryboard.instantiateViewController(withIdentifier:String(describing:  ApplicationListViewController.self)) as? ApplicationListViewController else {
            return }
        self.navigationController?.pushViewController(controller, animated: false)
    }
    
}

//MARK:- Data Source Delegate methods
extension AppListViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrUsers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableCell", for: indexPath) as? CustomTableCell {
            cell.nameLabel.text = arrUsers[indexPath.row].firstname + arrUsers[indexPath.row].lastname
            return cell
        }
        return UITableViewCell()
    }
    
}

//MARK:- Core Data Fetching Method
extension AppListViewController {
    func fetchDetailFromCoreData() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "UserDetails")
        do {
            let people = try managedContext.fetch(fetchRequest)
            
            if people.count < 0 {
                return
            }
            
            if self.arrUsers.count > 0 {
                self.arrUsers.removeAll()
            }
            
            for obj in people {
                let fname = obj.value(forKey: "firstname") as! String
                let lname = obj.value(forKey: "lastname") as! String
                let email = obj.value(forKey: "email") as! String
                let phone = obj.value(forKey: "phone") as! String
                let address = obj.value(forKey: "address") as! String
                let objLocationModel = AddUserModel(firstname: fname, lastname: lname, email: email, phone: phone, address: address)
                self.arrUsers.append(objLocationModel)
            }
            print(people)
            
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
}
