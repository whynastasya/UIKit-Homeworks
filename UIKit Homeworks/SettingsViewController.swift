//
//  SettingsViewController.swift
//  UIKit Homeworks
//
//  Created by nastasya on 06.04.2023.
//

import UIKit

class SettingsViewController: UIViewController {


    @IBOutlet weak var textColorBlackButton: UIButton!
    @IBOutlet weak var fontPicker: UIPickerView!
    
    weak var settingsDelegate: SettingsViewControllerDelegate?
    
    var fonts = ["Copperplate", "Thonburi", "GillSans", "HelveticaNeue", "Kailasa", "Farah", "Courier", "Verdana", "Didot"]
    var size: CGFloat = 14
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fontPicker.delegate = self
        fontPicker.dataSource = self
        
        
    }

    @IBAction func changeTextSize(_ sender: UISlider) {
        size = CGFloat(sender.value)
        settingsDelegate?.settingsViewController(self, didChangeTextSize: size)
    }
    
    @IBAction func changeTextColor(_ sender: UIButton) {
        let color = sender.tintColor!
        settingsDelegate?.settingsViewController(self, didChangeTextColor: color)
    }
    

    @IBAction func changeTheme(_ sender: UISegmentedControl) {
        var darkTheme = false
        if sender.selectedSegmentIndex == 1 {
            darkTheme = true
            textColorBlackButton.tintColor = .white
            textColorBlackButton.imageView?.tintColor = .white
        } else {
            darkTheme = false
            textColorBlackButton.tintColor = .black
            textColorBlackButton.imageView?.tintColor = .black
        }
        settingsDelegate?.settingsViewController(self, didChangeTheme: darkTheme)
    }
    

}

protocol SettingsViewControllerDelegate: AnyObject {
    func settingsViewController(_ settingsViewController: SettingsViewController, didChangeTextSize textSize: CGFloat)
    func settingsViewController(_ settingsViewController: SettingsViewController, didChangeTextColor textColor: UIColor)
    func settingsViewController(_ settingsViewController: SettingsViewController, didChangeTheme darkTheme: Bool)
    func settingsViewController(_ settingsViewController: SettingsViewController, didChangeTextFont textFont: UIFont)
}

extension SettingsViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        fonts.count
    }
    
    
}

extension SettingsViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        fonts[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        settingsDelegate?.settingsViewController(self, didChangeTextFont: UIFont(name: fonts[row], size: size)!)
    }
}
