//
//  ViewController.swift
//  ChangeColorsApp
//
//  Created by Alex Kulish on 10.12.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var valueRedLabel: UILabel!
    @IBOutlet var valueGreenLabel: UILabel!
    @IBOutlet var valueBlueLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redSlider.value = 0.25
        redSlider.minimumValue = 0
        redSlider.maximumValue = 1
        redSlider.minimumTrackTintColor = .red
        let valueRedColor = CGFloat(redSlider.value)
        
        greenSlider.value = 0.75
        greenSlider.minimumValue = 0
        greenSlider.maximumValue = 1
        greenSlider.minimumTrackTintColor = .green
        let valueGreenColor = CGFloat(greenSlider.value)
        
        blueSlider.value = 0.35
        blueSlider.minimumValue = 0
        blueSlider.maximumValue = 1
        blueSlider.minimumTrackTintColor = .blue
        let valueBLueColor = CGFloat(blueSlider.value)
        
        valueRedLabel.text = String(redSlider.value)
        valueGreenLabel.text = String(greenSlider.value)
        valueBlueLabel.text = String(blueSlider.value)
        
        colorView.layer.cornerRadius = 20
        colorView.backgroundColor = UIColor(red: valueRedColor, green: valueGreenColor, blue: valueBLueColor, alpha: 1)
        
    }
    
    @IBAction func slidersAction() {
        valueRedLabel.text = String(format: "%.2f", redSlider.value)
        let valueRedColor = CGFloat(redSlider.value)
        
        valueGreenLabel.text = String(format: "%.2f", greenSlider.value)
        let valueGreenColor = CGFloat(greenSlider.value)
        
        valueBlueLabel.text = String(format: "%.2f", blueSlider.value)
        let valueBLueColor = CGFloat(blueSlider.value)
        
        colorView.backgroundColor = UIColor(red: valueRedColor, green: valueGreenColor, blue: valueBLueColor, alpha: 1)
    }
    
}


