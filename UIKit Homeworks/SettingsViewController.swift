//
//  TextSettingsViewController.swift
//  UIKit Homeworks
//
//  Created by nastasya on 06.04.2023.
//

import UIKit

final class TextSettingsViewController: UIViewController {

    @IBOutlet weak var textColorBlackButton: UIButton!
    @IBOutlet weak var fontPicker: UIPickerView!
    
    weak var settingsDelegate: TextSettingsViewControllerDelegate?
    
    var fonts = [
        "Copperplate",
        "Thonburi",
        "GillSans",
        "HelveticaNeue",
        "Kailasa",
        "Farah",
        "Courier",
        "Verdana",
        "Didot"
    ]
    var size: CGFloat = 14
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fontPicker.delegate = self
        fontPicker.dataSource = self
    }

    @IBAction
    private func selectTextSize(_ sender: UISlider) {
        size = CGFloat(sender.value)
        settingsDelegate?.textSettingsViewController(self, didSelectSize: size)
    }
    
    @IBAction
    private func selectTextColor(_ sender: UIButton) {
        let color = sender.tintColor!
        settingsDelegate?.textSettingsViewController(self, didSelectColor: color)
    }
    

    @IBAction
    private func changeTheme(_ sender: UISegmentedControl) {
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
        settingsDelegate?.textSettingsViewController(self, didSelectDarkTheme: darkTheme)
    }
}

// MARK: - UIPickerViewDataSource

extension TextSettingsViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        fonts.count
    }
}

extension TextSettingsViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        fonts[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        settingsDelegate?.textSettingsViewController(self, didSelectFont: UIFont(name: fonts[row], size: size)!)
    }
}
