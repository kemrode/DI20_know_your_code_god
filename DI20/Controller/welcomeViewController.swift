//
//  welcomeViewController.swift
//  DI20
//
//  Created by Kevin Fichou on 03/09/2021.
//

import UIKit

class welcomeViewController: UIViewController {
    @IBOutlet weak var newGameBtn: UIButton!
    @IBOutlet weak var newPersonBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingsButton(button: newGameBtn)
        settingsButton(button: newPersonBtn)
        self.view.backgroundColor = UIColor.lightGray
    }
    private func settingsButton(button: UIButton){
        button.layer.cornerRadius = 35
    }
    
    @IBAction func unwindToWelcome(segue:UIStoryboardSegue) {}

}
