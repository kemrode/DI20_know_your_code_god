//
//  NewPersonViewController.swift
//  DI20
//
//  Created by Kevin Fichou on 16/09/2021.
//

import UIKit
import Foundation

class NewPersonViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {

    var test = newPerson()
    let arrayHairsPicker = ["","Noir(aile de corbeau)","Brun","Auburn","Châtain","Roux","Bond vénitien","Blond","Blanc","Poivre&Sel"]
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(closeKeyboard))
        view.addGestureRecognizer(tap)
        nameTextfield.delegate = self
        eyesColorPicker.delegate = self
        hairsColorPicker.delegate = self
        eyesColorPicker.dataSource = self
        hairsColorPicker.dataSource = self
        self.navigationController?.isNavigationBarHidden = false
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
            closeKeyboard()
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        closeKeyboard()
        return true
    }
    @IBAction func nameDidEndEditingTxtfield(_ sender: UITextField) {
        test.firstname = (sender.text != "") ? sender.text! : "sans nom"
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
            test.eyesColor = selectedRow
        } else {
            let selectedRow = arrayHairsPicker[row]
            test.hairs = selectedRow
        }
    }
    @IBAction func glassesSwitchPressed(_ sender: UISwitch) {
        test.glasses = sender.isOn
    }
    @IBAction func beardSwitchPressed(_ sender: UISwitch) {
         test.beard = sender.isOn
    }
    @IBAction func bigSwitchPressed(_ sender: UISwitch) {
        test.strong = sender.isOn
    }
    @IBAction func smileSwitchPressed(_ sender: UISwitch) {
        test.smile = sender.isOn
    }
    @IBAction func sexSegmentedPressed(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 1: test.sex = true
        case 2: test.sex = false
        default: return
        }
    }
    @IBAction func voiceSegmentedPressed(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 1: test.voice = true
        case 2: test.voice = false
        default: return
        }
    }
    @IBAction func validateNewPerson(_ sender: UIButton) {
        registerNewPeople(newPerson: test)
    }
    @objc private func closeKeyboard() {
        view.endEditing(true)
    }
}
