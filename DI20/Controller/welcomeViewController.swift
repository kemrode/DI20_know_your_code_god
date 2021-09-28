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
    @IBOutlet weak var titleLb: UILabel!
    @IBOutlet weak var trashBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.navigationController?.isNavigationBarHidden = true
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        settingsButton(button: newGameBtn)
        settingsButton(button: newPersonBtn)
        settingTrashButton()
    }
    private func settingsButton(button: UIButton){
        button.layer.cornerRadius = 35
    }
    private func settingTrashButton(){
        trashBtn.layer.backgroundColor = UIColor.red.cgColor
        trashBtn.tintColor = UIColor.white
        trashBtn.layer.cornerRadius = trashBtn.frame.height/2
        
    }
    @IBAction func unwindToWelcome(segue:UIStoryboardSegue) {}
    @IBAction func cleanCoreData(_ sender: UIButton) {
        //fonction pour remettre à zéro les core data
        deleteAllData()
    }
}
