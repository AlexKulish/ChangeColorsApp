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
    
    @IBOutlet var doneButton: UIButton!
    
    var color: UIColor!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        colorView.layer.cornerRadius = 20
        
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        blueSlider.minimumTrackTintColor = .blue
        
        changeViewColor()
        changeValueLabel(for: valueRedLabel, valueGreenLabel, valueBlueLabel)
    }
    
    @IBAction func slidersAction(_ sender: UISlider) {
        changeViewColor()
        
        switch sender {
        case redSlider: changeValueLabel(for: valueRedLabel)
        case greenSlider: changeValueLabel(for: valueGreenLabel)
        default: changeValueLabel(for: valueBlueLabel)
        }
    }
    
    @IBAction func doneButtonAction() {
        dismiss(animated: true)
    }
    
}

// MARK: - Private metods

extension SettingsViewController {
    private func changeViewColor() {
        
        //colorView.backgroundColor = color
        
        colorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1)
         
    }
    
    private func changeValueLabel(for labels: UILabel...) {
        for label in labels {
            switch label {
            case valueRedLabel:
                label.text = string(from: redSlider)
            case valueGreenLabel:
                label.text = string(from: greenSlider)
            default:
                label.text = string(from: blueSlider)
            }
        }
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
}


extension SettingsViewController: UITextFieldDelegate {
    
    
    
}
