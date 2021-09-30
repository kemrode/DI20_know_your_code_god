//
//  ListPersonTableViewController.swift
//  DI20
//
//  Created by Kevin Fichou on 28/09/2021.
//

import UIKit
import Foundation
import CoreData
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            deletePerson(arrayPeopleCD[indexPath.row])
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        self.view.layer.backgroundColor = setBases.primaryBackgroundColor.cgColor
        tableView.delegate = self
        tableView.dataSource = self
        let arrayCheck: [People] = People.all
        (arrayCheck == []) ? showAlertMessage() : print("all is good")
        tableView.reloadData()
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
    private func deletePerson(_ sender: People) {
        AppDelegate.viewContext.delete(sender)
        guard ((try? AppDelegate.viewContext.save()) != nil) else {return}
    }
}
