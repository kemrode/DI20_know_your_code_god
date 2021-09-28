//
//  quizzViewController.swift
//  DI20
//
//  Created by Kevin Fichou on 03/09/2021.
//

import UIKit
import Foundation
import CoreData

class quizzViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var peopleView: UIImageView!
    @IBOutlet weak var proposalLBOne: UILabel!
    @IBOutlet weak var proposalLBTwo: UILabel!
    @IBOutlet weak var proposalLBThree: UILabel!
    @IBOutlet weak var proposalLBFour: UILabel!
    @IBOutlet weak var firstnamePicker: UIPickerView!
    @IBOutlet weak var validateBtn: UIButton!
    @IBOutlet weak var firstClue: UILabel!
    
    var testPredicate: NSPredicate?
    var arrayLable: Array<UILabel> = []
    var dictSelectedPerson: Dictionary<String,String> = [:]
    var arrayName: [String] = []
    var gamerAnswer: String?
    var answer: String?
    var score: Int = 5
    override func viewDidLoad() {
        super.viewDidLoad()
        firstnamePicker.delegate = self
        firstnamePicker.dataSource = self
        validateBtn.layer.cornerRadius = 35
        self.navigationController?.isNavigationBarHidden = false
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        firstnamePicker.delegate = self
        firstnamePicker.dataSource = self
        dictSelectedPerson = [:]
        score = 5
        let message = "Attention, aucune donnée n'est présente dans la BDD, veuillez créer au moins un personnage, svp"
        (arrayName == []) ? showAlertNoPerson(message: message) : creationGame()
//        let firstname = (arrayName != []) ? randomInPeople() : showAlertNoPerson(message: message)
    }
    private func creationGame() {
        let firstname = randomInPeople()
        let data = self.requestDataFromFirstname(nameToFind: firstname)[0]
        personStructConstruction(peopleModel: data)
        indicationSettting(peopleModel: data)
        gamerAnswer = arrayName.first
        self.settingFirstClue(firstClue: firstClue)
        
    }
    private func randomInPeople() -> String {
        arrayName = self.creatingArrayName()
        let name = arrayName.randomElement()
        return name!
    }
    private func creatingArrayName() -> Array<String> {
            var arrayName: [String] = []
            People.all.forEach{(person) in
                arrayName.append(person.firstname!)
            }
        return arrayName
    }
    private func requestDataFromFirstname(nameToFind: String) -> [People] {
        let request: NSFetchRequest<People> = People.fetchRequest()
        request.predicate = NSPredicate(format: "firstname == %@", nameToFind)
        let result = try? AppDelegate.viewContext.fetch(request)
    return result!
    }
    private func personStructConstruction(peopleModel: People){
//        dictSelectedPerson["big"] = (peopleModel.big) ? "j'ai un peu d'embompoint" : "je suis légèrement maigrichon"
        dictSelectedPerson["eyesColor"] = "J'ai des yeux \(peopleModel.eyesColor ?? "colorés, n'est-ce pas ?")"
        dictSelectedPerson["glasses"] = (peopleModel.glasses) ? "je porte des lunettes" : "j'suis pas bigleux, moi"
        dictSelectedPerson["hairs"] = "mes cheveux sont \(peopleModel.hairs ?? "d'une certaine couleur")"
        dictSelectedPerson["sex"] = (peopleModel.sex) ? "Je suis un mec" : "je suis une femme"
        dictSelectedPerson["smile"] = (peopleModel.smile) ? "Je suis souriant" : "qu'est-ce qu'un sourire ?"
        dictSelectedPerson["strong"] = (peopleModel.strong) ? "Je suis du genre musclé" : "tendance Nutella !"
//        dictSelectedPerson["tall"] = (peopleModel.tall) ? "je suis plutôt grand" : "je ne suis pas des plus grands"
        dictSelectedPerson["tall"] = "Je mesure \(peopleModel.tall)cm"
        dictSelectedPerson["voice"] = (peopleModel.voice) ? "j'ai une voix grave" : "ma voix est plutôt aiguë"
    }
    private func addArrayLable() {
        arrayLable.append(proposalLBOne)
        arrayLable.append(proposalLBTwo)
        arrayLable.append(proposalLBThree)
        arrayLable.append(proposalLBFour)
    }
    private func indicationSettting(peopleModel: People) {
        addArrayLable()
        arrayLable.forEach{(element) in
            settingProposal(labelToSet: element)
        }
        answer = peopleModel.firstname
    }
    private func settingFirstClue(firstClue: UILabel){
        firstClue.isUserInteractionEnabled = false
        let element = dictSelectedPerson.randomElement()
        firstClue.text = element?.value
        dictSelectedPerson.removeValue(forKey: element!.key)
    }
    private func settingProposal(labelToSet: UILabel) {
        labelToSet.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.tapLabel(_:)))
        labelToSet.addGestureRecognizer(tap)
    }
    @objc private func tapLabel(_ sender: UITapGestureRecognizer) {
        let element = dictSelectedPerson.randomElement()
        dictSelectedPerson.removeValue(forKey: element!.key)
        guard (((sender.view as? UILabel)?.text = element?.value) != nil) else {return}
        guard ((sender.view?.isUserInteractionEnabled = false) != nil) else {return}
        score -= 1
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrayName.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return arrayName[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        gamerAnswer = arrayName[row]
    }
    @IBAction func validAnswerSelected(_ sender: Any) {
        let message = (gamerAnswer == answer) ? "Bravo, vous avez trouvé la bonne personne : \(String(describing: answer)).\nVotre score est de \(score)points" : "Dommage, il fallait trouver: \(String(describing: answer))\nVotre score est de 0 point"
        (gamerAnswer == answer) ? showAlert(message: message) : showAlert(message: message)
    }
    private func showAlert(message: String){
        let alertController = UIAlertController(title: "Fin de partie !", message: message, preferredStyle: .alert)
        let actionNewGame = UIAlertAction(title: "Rejouer !", style: .default) {(action) in
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(identifier: "quizzVC")
            var quizzVC = self.navigationController?.viewControllers
            quizzVC?.removeLast()
            quizzVC?.append(vc)
            self.navigationController?.setViewControllers(quizzVC!, animated: false)
        }
        let actionDismiss = UIAlertAction(title: "Quitter", style: .cancel) {(action) in
            self.navigationController?.popViewController(animated: true)
        }
        alertController.addAction(actionNewGame)
        alertController.addAction(actionDismiss)
        present(alertController, animated: true, completion: nil)
    }
    private func showAlertNoPerson(message: String){
        let alertController = UIAlertController(title: "Erreur", message: message, preferredStyle: .alert)
        let actionQuit = UIAlertAction(title: "Quitter", style: .destructive) {(action) in
            self.navigationController?.popViewController(animated: true)
        }
        alertController.addAction(actionQuit)
        present(alertController, animated: true, completion: nil)
    }
}
