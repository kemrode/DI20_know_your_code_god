//
//  NewPersonViewController.swift
//  DI20
//
//  Created by Kevin Fichou on 16/09/2021.
//

import UIKit
import Foundation

class NewPersonViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {

    var newPersonRegistered = newPerson()
    let arrayHairsPicker = ["","Noir(aile de corbeau)","Brun","Auburn","Châtain","Roux","Blond vénitien","Blond","Blanc","Poivre & Sel"]
    let arrayEyesColorPicker = ["","Bleus","Marron","Verts","Gris","Rouge"]
    
    @IBOutlet weak var nameTextfield: UITextField!
    @IBOutlet weak var nameLb: UILabel!
    @IBOutlet weak var glassesSwitch: UISwitch!
    @IBOutlet weak var beardSwitch: UISwitch!
    @IBOutlet weak var beardLb: UILabel!
    @IBOutlet weak var glassesLb: UILabel!
    @IBOutlet weak var bigSwitch: UISwitch!
    @IBOutlet weak var bigLb: UILabel!
    @IBOutlet weak var smileLb: UILabel!
    @IBOutlet weak var smileSwitch: UISwitch!
    @IBOutlet weak var sexSegmented: UISegmentedControl!
    @IBOutlet weak var voiceSegmented: UISegmentedControl!
    @IBOutlet weak var voiceLb: UILabel!
    @IBOutlet weak var validateBtn: UIButton!
    @IBOutlet weak var eyesColorPicker: UIPickerView!
    @IBOutlet weak var eyesColorLb: UILabel!
    @IBOutlet weak var hairsColorPicker: UIPickerView!
    @IBOutlet weak var hairsColorLb: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var heigtLb: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.layer.backgroundColor = setBases.primaryBackgroundColor.cgColor
        validateBtn.backgroundColor = setBases.secondColor
        validateBtn.layer.cornerRadius = 25
        let tap = UITapGestureRecognizer(target: self, action: #selector(closeKeyboard))
        view.addGestureRecognizer(tap)
        nameTextfield.delegate = self
        eyesColorPicker.delegate = self
        hairsColorPicker.delegate = self
        eyesColorPicker.dataSource = self
        hairsColorPicker.dataSource = self
        self.navigationController?.isNavigationBarHidden = false
        sliderLabel(value: heightSlider.value)
        initialValues()
        
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
            closeKeyboard()
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        closeKeyboard()
        return true
    }
    @IBAction func nameDidEndEditingTxtfield(_ sender: UITextField) {
        newPersonRegistered.firstname = (sender.text != "") ? sender.text! : "sans nom"
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        let countInt: Int = (pickerView.tag == 1) ? arrayEyesColorPicker.count : arrayHairsPicker.count
        return countInt
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let stringRow: String = (pickerView.tag == 1) ? arrayEyesColorPicker[row] : arrayHairsPicker[row]
        return stringRow
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 1 {
            let selectedRow = arrayEyesColorPicker[row]
            newPersonRegistered.eyesColor = selectedRow
        } else {
            let selectedRow = arrayHairsPicker[row]
            newPersonRegistered.hairs = selectedRow
        }
    }
    @IBAction func glassesSwitchPressed(_ sender: UISwitch) {
        newPersonRegistered.glasses = (sender.isOn) ? "oui" : "non"
    }
    @IBAction func beardSwitchPressed(_ sender: UISwitch) {
        newPersonRegistered.beard = (sender.isOn) ? "oui" : "non"
    }
    @IBAction func bigSwitchPressed(_ sender: UISwitch) {
        newPersonRegistered.strong = (sender.isOn) ? "oui" : "non"
    }
    @IBAction func smileSwitchPressed(_ sender: UISwitch) {
        newPersonRegistered.smile = (sender.isOn) ? "oui" : "non"
    }
    @IBAction func sexSegmentedPressed(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 1: newPersonRegistered.sex = "homme"
        case 2: newPersonRegistered.sex = "femme"
        default: return
        }
    }
    @IBAction func voiceSegmentedPressed(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 1: newPersonRegistered.voice = "grave"
        case 2: newPersonRegistered.voice = "aigüe"
        default: return
        }
    }
    @IBAction func validateNewPerson(_ sender: UIButton) {
        newPerson().registerNewPeople(newPerson: newPersonRegistered)
    }
    @objc private func closeKeyboard() {
        view.endEditing(true)
    }
    private func sliderLabel(value: Float){
        heigtLb.text = "\(Int(value)) cm"
    }
    
    @IBAction func actionOnSlider(_ sender: UISlider) {
        sliderLabel(value: sender.value)
        let tall: Int = Int(sender.value)
        newPersonRegistered.tall = String(tall)
    }
    private func initialValues() {
        newPersonRegistered.sex = "homme"
        newPersonRegistered.glasses = "non"
        newPersonRegistered.beard = "non"
        newPersonRegistered.strong = "non"
        newPersonRegistered.smile = "non"
        newPersonRegistered.voice = "grave"
    }
    
}
