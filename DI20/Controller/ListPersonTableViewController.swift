//
//  ListPersonTableViewController.swift
//  DI20
//
//  Created by Kevin Fichou on 28/09/2021.
//

import UIKit
import Foundation

class ListPersonTableViewController: UITableViewController {

    let arrayPeopleCD: [People] = People.all
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayPeopleCD.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ListPersonsTableViewCell()
        var configuration = cell.defaultContentConfiguration()
        let nameToShow = arrayPeopleCD[indexPath.row]
        configuration.text = nameToShow.firstname
        cell.contentConfiguration = configuration
        return cell
//        cell?.peopleFirstnameLB.text = nameToShow.firstname ?? "error : nobody to show"
//        cell?.contentConfiguration = configuration
//        return cell!
        
//        if let cell = tableView.dequeueReusableCell(withIdentifier: "ListPersonsTableViewCell") as? ListPersonsTableViewCell {
//            cell.peopleFirstnameLB.text = nameToShow.firstname
//            cell.contentConfiguration = configuration
//            return cell
//        } else {
//            let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
//            cell.textLabel?.text = "error : nobody to show, please add a new person"
//            return cell
//        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//        tableView.delegate = self
//        tableView.dataSource = self
//        tableView.reloadData()
    }
}
