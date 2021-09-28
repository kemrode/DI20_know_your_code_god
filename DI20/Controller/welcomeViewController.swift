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
    @IBOutlet weak var listPersonBtn: UIButton!
    @IBOutlet weak var titleLb: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.navigationController?.isNavigationBarHidden = true
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        settingsButton(button: newGameBtn)
        settingsButton(button: newPersonBtn)
        settingsButton(button: listPersonBtn)
    }
    private func settingsButton(button: UIButton){
        button.layer.cornerRadius = 35
    }
    @IBAction func unwindToWelcome(segue:UIStoryboardSegue) {}
}
