//
//  FriendsListTableViewController.swift
//  VKTestApp
//
//  Created by Kamila on 17.01.2022.
//

import UIKit

class FriendsListTableViewController: UITableViewController {
    
    var contactList: [FirendsListCellModel] = [.init(name: "Pavel", surnname: "Durov", imageName: "pavel")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerTableViewCells()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        MARK: example how to use different type cell
//        if indexPath.row == 0 {
//            let cell = tableView.dequeueReusableCell(withIdentifier: "testId", for: indexPath)
//            cell.textLabel?.text = name
//            cell.textLabel?.backgroundColor = .green
//            return cell
//        } else {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsListTableViewCellId", for: indexPath) as! FriendsListTableViewCell
        cell.setData(with: contactList[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Friend"
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath, "🍏🍏🍏🍏🍏")
    }
}

private extension FriendsListTableViewController {
    func registerTableViewCells() {
        // For nib
        tableView.register(FriendsListTableViewCell.nib(), forCellReuseIdentifier: "FriendsListTableViewCellId")
        // For default and custom(code) cell
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "testId")
    }
}
