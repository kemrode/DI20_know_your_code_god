//
//  ListPersonsTableViewCell.swift
//  DI20
//
//  Created by Kevin Fichou on 28/09/2021.
//

import UIKit

class ListPersonsTableViewCell: UITableViewCell {

    @IBOutlet weak var peopleFirstnameLB: UILabel!
    var peopleFirstnameItem: People! {
        didSet{
            peopleFirstnameLB.text = peopleFirstnameItem.firstname
        }
    }
    

}
