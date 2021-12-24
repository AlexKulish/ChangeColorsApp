//
//  MainViewController.swift
//  ChangeColorsApp
//
//  Created by Alex Kulish on 24.12.2021.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet var settingsButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .init(red: 1, green: 1, blue: 1, alpha: 1)
        
        

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let settingsVC = segue.destination as! SettingsViewController

        settingsVC.color = view.backgroundColor
        
    }
    
    @IBAction func settingsButtonAction() {
        
    }
    
}
