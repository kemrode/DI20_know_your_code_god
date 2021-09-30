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
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        let arrayCheck: [People] = People.all
        (arrayCheck == []) ? showAlertMessage() : print("all is good")
    }
    private func showAlertMessage() {
        let message = "Aucun personnage n'est enregistré. Veuillez entrer des personnages pour afficher la liste."
        let alertController = UIAlertController(title: "Erreur", message: message, preferredStyle: .alert)
        let actionQuit = UIAlertAction(title: "Quitter", style: .destructive) {(action) in
            self.navigationController?.popViewController(animated: true)
        }
        alertController.addAction(actionQuit)
        present(alertController, animated: true, completion: nil)
    }
}
