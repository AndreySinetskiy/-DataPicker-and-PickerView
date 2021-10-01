//
//  ViewController.swift
//  DataPicker
//
//  Created by 1 on 29.09.2021.
//

import UIKit

class ViewController: UIViewController {
    let elements = [
        "UILabel",
        "UIDatePicker",
        "UITextField"
    ]
    
    private var selectedElement: String?
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var switchLabel: UILabel!
    
    private var firstColor = UIColor(red: 150/255, green: 200/255, blue: 150/255, alpha: 1)
    private var secondColor = UIColor(red: 120/255, green: 150/255, blue: 125/255, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker.preferredDatePickerStyle = .wheels
        choiseUIElement()
        view.addGradientColor(topColor: firstColor, buttomColor: secondColor)
        createToolBar()
    }
    
    @objc func dismissToolBar() {
        view.endEditing(true)
    }
    
    private func hideAllElements() {
        label.isHidden = true
        datePicker.isHidden = true
        switchLabel.isHidden = true
        textField.isHidden = true
    }
    
    @IBAction func dataPicker(_ sender: UIDatePicker) {
        let dataFormatter = DateFormatter()
        dataFormatter.dateStyle = .full
        dataFormatter.locale = Locale(identifier: "ru_RU")
        dataFormatter.dateFormat = "EEEE, MMM d, yyyy"
        
        let dataValue = dataFormatter.string(from: sender.date)
        let dateCapit = dataValue.capitalized
        label.text = dateCapit
    }
    private func choiseUIElement() {
        let pickerView = UIPickerView()
        pickerView.delegate = self
        
        textField.inputView = pickerView
        
    }
    
    @IBAction func switchAction(_ sender: UISwitch) {
        label.isHidden = !label.isHidden
        datePicker.isHidden = !datePicker.isHidden
        textField.isHidden = !textField.isHidden
        if sender.isOn {
        switchLabel.text = "Show all"
        } else {
            switchLabel.text = "Hide All"
        }
}

}
extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
func numberOfComponents(in pickerView: UIPickerView) -> Int {
    1
}

func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    elements.count
}
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        elements[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedElement = elements[row]
        textField.text = selectedElement
        
        switch row {
        case 0:
            hideAllElements()
            label.isHidden = false
        case 1:
            hideAllElements()
            datePicker.isHidden = false
            
        default:
            hideAllElements()
            switchLabel.isHidden = false
            textField.isHidden = false
        }
    }
        func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
            var pickerLabel = UILabel()
            
            if let currentLabel = view as? UILabel {
                pickerLabel = currentLabel
            } else {
                pickerLabel = UILabel()
            }
            
            pickerView.backgroundColor = .gray
            pickerLabel.textColor = .yellow
            pickerLabel.textAlignment = .center
            pickerLabel.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 25)
            pickerLabel.text = elements[row]
            
            return pickerLabel
        }
}
