//
//  MainViewController.swift
//  ChangeColorsApp
//
//  Created by Alex Kulish on 24.12.2021.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func setNewViewColor(from color: UIColor)
}

class MainViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        settingsVC.color = view.backgroundColor
        settingsVC.delegate = self
    }
}

extension MainViewController: SettingsViewControllerDelegate {
    func setNewViewColor(from color: UIColor) {
        view.backgroundColor = color
    }
}
