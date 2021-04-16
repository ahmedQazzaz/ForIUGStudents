//
//  ContactListViewController.swift
//  FirstiOS2021
//
//  Created by Ahmed Qazzaz on 27/03/2021.
//

import UIKit

typealias Contact = (String, Bool)

class ContactListViewController : UIViewController{
    var contactsList = [("Ahmed", true), ("Mohammed", true), ("Ali", false), ("Ibrahem", false), ("Khalil", true)]
    var finalList : [[Contact]] = []
    
    @IBOutlet weak var myTableView : UITableView!
    
    override func viewDidLoad() {
        let onlineList = contactsList.filter({$0.1})
        let offlineList = contactsList.filter({$0.1 == false})
        finalList = [onlineList, offlineList]
        
        let cellNib = UINib(nibName: "UserTableViewCell", bundle: nil)
        myTableView.register(cellNib, forCellReuseIdentifier: "UserTableViewCell")
        
    }
}



//MARK:- Table View Data Source, and Table View Delegate
extension ContactListViewController : UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return finalList.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return finalList[section].count
    }
    //(section index, row index)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 1 {
            let cell =  tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell") as? UserTableViewCell
            return cell ?? UITableViewCell()
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell") as? ContactTableViewCell
        let object = finalList[indexPath.section][indexPath.row]
        cell?.delegate = self
        cell?.username.text = object.0
        cell?.indexPath = indexPath
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sectionHeader")
        
        return cell?.contentView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 42
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            print("This is cell number: \(indexPath.row)")
        }
    }
    

}


//MARK:-  Contact Cell Delegate

extension ContactListViewController : ContactTableViewCellDelegate {
    func chatNowActionClicked(_ index: IndexPath) {
        let dataModel = finalList[index.section][index.row]
        print("action happened inside \(dataModel.0) cell")
    }
    
}
