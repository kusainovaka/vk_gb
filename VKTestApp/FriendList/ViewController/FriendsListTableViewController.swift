//
//  FriendsListTableViewController.swift
//  VKTestApp
//
//  Created by Kamila on 17.01.2022.
//

import UIKit

class FriendsListTableViewController: UITableViewController {
    
    private var sectionList = ["First", "Second"]
    private var contactList: [FriendsListCellModel] = [.init(name: "Pavel", surnname: "Durov", imageName: "pavel"),
                                               .init(name: "Pavel", surnname: "Durov", imageName: "pavel")
    ]
    private let width = UIScreen.main.bounds.width
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerTableViewCells()
        createTableHeaderView()
        createTableFooterView()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sectionList.count
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
    
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return sectionList[section] + "header"
//    }
//
//    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
//        return sectionList[section] + "footer"
//    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let headerView = UIView(frame: .init(x: 0, y: 0, width: 375, height: 100))
//        headerView.backgroundColor = .yellow
//        return headerView
        let headerView = FriendHeaderView(frame: .init(x: 0, y: 0, width: width, height: 100))
        headerView.backgroundColor = .blue
        let text = sectionList[section]
        headerView.setText(text)
        return headerView
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
    
    func createTableHeaderView() {
        let headerView = FriendHeaderView(frame: .init(x: 0, y: 0, width: width, height: 100))
        headerView.setText("Table Header View 🤡🤡🤡🤡🤡")
        headerView.backgroundColor = .yellow
        tableView.tableHeaderView = headerView
    }
    
    func createTableFooterView() {
        let headerView = FriendHeaderView(frame: .init(x: 0, y: 0, width: width, height: 100))
        headerView.setText("Table Footer View")
        headerView.backgroundColor = .magenta
        tableView.tableFooterView = headerView
    }
}
