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
    @IBOutlet weak var welcomeImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.layer.backgroundColor = setBases.primaryBackgroundColor.cgColor
        welcomeImg.image = UIImage(named: "welcomeImage.jpg")
        welcomeImg.clipsToBounds = true
        welcomeImg.layer.cornerRadius = 15
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
        settingsButton(button: newGameBtn, color: setBases.thirdColor)
        settingsButton(button: newPersonBtn, color: setBases.secondColor)
        settingsButton(button: listPersonBtn, color: setBases.fourthColor)
    }
    private func settingsButton(button: UIButton, color: UIColor){
        button.layer.cornerRadius = 35
        button.backgroundColor = color
    }
    @IBAction func unwindToWelcome(segue:UIStoryboardSegue) {}
}
