//
//  ViewController.swift
//  ChangeColorsApp
//
//  Created by Alex Kulish on 10.12.2021.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var valueRedLabel: UILabel!
    @IBOutlet var valueGreenLabel: UILabel!
    @IBOutlet var valueBlueLabel: UILabel!
    
    @IBOutlet var redTextField: UITextField!
    @IBOutlet var greenTextField: UITextField!
    @IBOutlet var blueTextField: UITextField!
    
    var delegate: SettingsViewControllerDelegate!
    var color: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = 20
        colorView.backgroundColor = color
        
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        blueSlider.minimumTrackTintColor = .blue
        
        redTextField.delegate = self
        greenTextField.delegate = self
        blueTextField.delegate = self
        
        setValueForSliders()
        setValueForLabels()
        setValueForTextFields()
    }
    
    @IBAction func slidersAction(_ sender: UISlider) {
        switch sender.tag {
        case 0:
            valueRedLabel.text = string(from: sender)
            redTextField.text = string(from: sender)
        case 1:
            valueGreenLabel.text = string(from: sender)
            greenTextField.text = string(from: sender)
        case 2:
            valueBlueLabel.text = string(from: sender)
            blueTextField.text = string(from: sender)
        default:
            break
        }
        
        setViewColor()
    }
    
    @IBAction func doneButtonAction() {
        delegate.setNewViewColor(from: colorView.backgroundColor ?? .red)
        dismiss(animated: true)
    }
    
}

// MARK: - Private metods

extension SettingsViewController {
    
    private func setValueForSliders() {
        let newColor = CIColor(color: color)
        
        redSlider.value = Float(newColor.red)
        greenSlider.value = Float(newColor.green)
        blueSlider.value = Float(newColor.blue)
    }
    
    private func setViewColor() {
        colorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1)
    }
    
    private func setValueForLabels() {
        valueRedLabel.text = string(from: redSlider)
        valueGreenLabel.text = string(from: greenSlider)
        valueBlueLabel.text = string(from: blueSlider)
    }
    
    private func setValueForTextFields() {
        redTextField.text = string(from: redSlider)
        greenTextField.text = string(from: greenSlider)
        blueTextField.text = string(from: blueSlider)
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
}

//MARK: Setup alert

extension SettingsViewController {
    private func showAlert(title: String, message: String, textField: UITextField) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK",
                                     style: .default) { [self]_ in
            redTextField.text = string(from: redSlider)
            greenTextField.text = string(from: greenSlider)
            blueTextField.text = string(from: blueSlider)
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

// MARK: Signing UITextFieldDelegate

extension SettingsViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        guard let text = textField.text else { return }
        guard let currentValue = Float(text) else { return
            showAlert(title: "Wrong format!",
                      message: "Enter correct number from 0 to 1",
                      textField: textField)
        }
        
        if currentValue >= 0 && currentValue <= 1 {
            switch textField.tag {
            case 0: redSlider.value = currentValue
            case 1: greenSlider.value = currentValue
            case 2: blueSlider.value = currentValue
            default: break
            }
            
            setViewColor()
            setValueForLabels()
            setValueForTextFields()
        } else {
            showAlert(title: "Wrong format!",
                      message: "Enter correct number from 0 to 1",
                      textField: textField)
        }
        
        /* Вариант с извлечением опционала через if и проверку внутри, решил что через guard будет красивее
        if let currentValue = Float(text) {
            if currentValue >= 0 && currentValue <= 1 {
                
                switch textField.tag {
                case 0: redSlider.value = currentValue
                case 1: greenSlider.value = currentValue
                case 2: blueSlider.value = currentValue
                default: break
                }
                
                setViewColor()
                setValueForLabels()
                setValueForTextFields()
            } else {
                showAlert(title: "Wrong format!",
                          message: "Enter correct number from 0 to 1",
                          textField: textField)
            }
        } else {
            showAlert(title: "Wrong format!",
                      message: "Enter correct number from 0 to 1",
                      textField: textField)
        } */
    }
    
}
