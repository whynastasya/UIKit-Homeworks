//
//  AlarmViewController.swift
//  UIKit Homeworks
//
//  Created by nastasya on 30.03.2023.
//

import UIKit

class AlarmViewController: UIViewController {
    
    @IBOutlet var alarmButtons: [UIButton]!

    @IBOutlet weak var alarmTimeLabel1: UILabel!
    @IBOutlet weak var alarmTimeLabel2: UILabel!
    @IBOutlet weak var alarmTimeLabel3: UILabel!
    @IBOutlet weak var alarmTimeLabel4: UILabel!
    
    @IBOutlet weak var alarmNameLabel4: UILabel!
    @IBOutlet weak var alarmNameLabel3: UILabel!
    @IBOutlet weak var alarmNameLabel2: UILabel!
    @IBOutlet weak var alarmNameLabel1: UILabel!
    
    
    @IBOutlet weak var alarmSwitch4: UISwitch!
    @IBOutlet weak var alarmSwitch3: UISwitch!
    @IBOutlet weak var alarmSwitch2: UISwitch!
    @IBOutlet weak var alarmSwitch1: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        tabBarItem.image = UIImage(systemName: "alarm.fill")
        
        let alarmSwitches = [alarmSwitch1, alarmSwitch2, alarmSwitch3, alarmSwitch4]
        
        for alarmButton in alarmButtons {
            alarmButton.layer.borderWidth = 0.5
            alarmButton.layer.borderColor = UIColor.darkGray.cgColor
        }
        
        for i in 0...3 {
            alarmSwitches[i]!.layer.cornerRadius = alarmSwitches[i]!.frame.height / 2
            alarmSwitches[i]!.backgroundColor = .darkGray
            alarmSwitches[i]!.clipsToBounds = true
            alarmSwitches[i]?.addTarget(self, action: #selector(onSwitch), for: .touchUpInside)
        }
        
    }
    
    @objc func onSwitch(sender: UISwitch) {
        
        let alarmSwitches = [alarmSwitch1, alarmSwitch2, alarmSwitch3, alarmSwitch4]
        let alarmTimeLabeles = [alarmTimeLabel1,alarmTimeLabel2, alarmTimeLabel3,alarmTimeLabel4]
        let alarmNameLabeles = [alarmNameLabel1, alarmNameLabel2, alarmNameLabel3, alarmNameLabel4]
        
        var index = 0
        for i in 0...3 {
            if sender == alarmSwitches[i] {
                index = i
            }
        }
        
        if sender.isOn {
            alarmTimeLabeles[index]!.textColor = .white
            alarmNameLabeles[index]?.textColor = .white
        } else {
            alarmTimeLabeles[index]!.textColor = .gray
            alarmNameLabeles[index]?.textColor = .gray
        }
    }

}
