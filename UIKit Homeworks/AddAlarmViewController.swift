//
//  AddAlarmViewController.swift
//  UIKit Homeworks
//
//  Created by nastasya on 31.03.2023.
//

import UIKit

class AddAlarmViewController: UIViewController {

    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet var notificationButtons: [UIButton]!
    @IBOutlet weak var alarmTimePicker: UIDatePicker!
    @IBOutlet weak var nameAlarmTextField: UITextField!
    @IBOutlet weak var repeatSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        alarmTimePicker.setValue(UIColor.white, forKey: "textColor")
        
        for notificationButton in notificationButtons {
            notificationButton.layer.cornerRadius = 15
            notificationButton.clipsToBounds = true
           
        }
        
        nameAlarmTextField.layer.borderWidth = 1
        nameAlarmTextField.layer.borderColor = UIColor.darkGray.cgColor
        
        repeatSwitch.layer.cornerRadius = repeatSwitch.frame.height / 2
        repeatSwitch.clipsToBounds = true
        repeatSwitch.backgroundColor = .gray
        
        cancelButton.addTarget(self, action: #selector(cancel), for: .touchUpInside)
    }
    
    @objc func cancel() {
        dismiss(animated: true)
    }

}
