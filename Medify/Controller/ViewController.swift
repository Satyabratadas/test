//
//  ViewController.swift
//  Medify
//
//  Created by Satyabrata Das on 18/05/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    enum userType : Int {
        case user = 0
        case admin = 1
        case staff = 2

    }
    
    @IBOutlet weak var selectUserType: UITextField!
    @IBOutlet weak var ExpandBtn: UIButton!
    @IBOutlet weak var UserTypeList: UITableView!
    var users = ["user", "admin", "staff"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.UserTypeList.delegate = self
        self.UserTypeList.dataSource = self
        self.UserTypeList.clipsToBounds = false;
        self.UserTypeList.layer.masksToBounds = false;
        self.UserTypeList.isHidden = true
       
    }
    
    @IBAction func ExpandPress(_ sender: UIButton) {
        UIView.animate(withDuration: 0.1) {
            self.UserTypeList.isHidden = !self.UserTypeList.isHidden
           }
        }
    
    @IBAction func nextBtnPressed(_ sender: UIButton) {
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: UserListCell.identifier, for: indexPath) as? UserListCell {
            cell.userListlabel.text = users[indexPath.row]
            cell.tag = indexPath.row
            print(cell.tag)
            return cell
        }
    fatalError()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectUserType.text = users[indexPath.row]
        self.UserTypeList.isHidden = true
    }
    
    

}

