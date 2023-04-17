//
//  StopwatchViewController.swift
//  UIKit Homeworks
//
//  Created by nastasya on 03.04.2023.
//

import UIKit

class StopwatchViewController: UIViewController {

    let stopwatchStartButton = UIButton()
    let stopwatchCancelButton = UIButton()
    let stopwatchTimeLabel = UILabel()
    var timer = Timer()
    var time = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tabBarItem.image = UIImage(systemName: "stopwatch.fill")
        
        
        
        stopwatchTimeLabel.frame = CGRectMake(0, 50, 400, 300)
        stopwatchTimeLabel.center.x = view.center.x
        stopwatchTimeLabel.text = "00:00,00"
        stopwatchTimeLabel.font = UIFont.systemFont(ofSize: 90, weight: .thin)
        stopwatchTimeLabel.textAlignment = .center
        stopwatchTimeLabel.textColor = .white
        view.addSubview(stopwatchTimeLabel)
        
        stopwatchStartButton.frame = CGRectMake(260, 330, 100, 100)
        stopwatchStartButton.layer.borderWidth = 2.5
        stopwatchStartButton.layer.borderColor = UIColor.systemGreen.withAlphaComponent(0.2).cgColor
        stopwatchStartButton.layer.cornerRadius = 50
        stopwatchStartButton.clipsToBounds = true
        
        stopwatchStartButton.setBackgroundImage(UIImage(systemName: "circle.fill")?.withTintColor(.systemGreen.withAlphaComponent(0.2), renderingMode: .alwaysOriginal), for: .normal)
        stopwatchStartButton.imageView?.contentMode = .scaleAspectFit
        stopwatchStartButton.setTitle("Старт", for: .normal)
        stopwatchStartButton.setTitleColor(.systemGreen, for: .normal)
        
//        stopwatchStartButton.setBackgroundImage(UIImage(systemName: "circle.fill")?.withTintColor(.systemGreen.withAlphaComponent(0.1), renderingMode: .alwaysOriginal), for: .highlighted)
//        stopwatchStartButton.setTitle("", for: .highlighted)
        
        stopwatchStartButton.setBackgroundImage(UIImage(systemName: "circle.fill")?.withTintColor(.systemRed.withAlphaComponent(0.2), renderingMode: .alwaysOriginal), for: .selected)
        stopwatchStartButton.setTitle("Стоп", for: .selected)
        stopwatchStartButton.setTitleColor(.systemRed, for: .selected)
        stopwatchStartButton.addTarget(self, action: #selector(stopwatchStart), for: .touchUpInside)
        view.addSubview(stopwatchStartButton)
        
        stopwatchCancelButton.frame = CGRectMake(35, 330, 100, 100)
        stopwatchCancelButton.layer.borderWidth = 2.5
        stopwatchCancelButton.layer.borderColor = UIColor.systemGray.withAlphaComponent(0.2).cgColor
        stopwatchCancelButton.layer.cornerRadius = 50
        stopwatchCancelButton.clipsToBounds = true
    
        stopwatchCancelButton.setBackgroundImage(UIImage(systemName: "circle.fill")?.withTintColor(.systemGray.withAlphaComponent(0.2), renderingMode: .alwaysOriginal), for: .disabled)
        stopwatchCancelButton.imageView?.contentMode = .scaleAspectFit
        stopwatchCancelButton.setTitle("Отмена", for: .disabled)
        stopwatchCancelButton.setTitleColor(.systemGray.withAlphaComponent(0.8), for: .disabled)
        
        stopwatchCancelButton.setBackgroundImage(UIImage(systemName: "circle.fill")?.withTintColor(.systemGray.withAlphaComponent(0.2), renderingMode: .alwaysOriginal), for: .normal)
        stopwatchCancelButton.imageView?.contentMode = .scaleAspectFit
        stopwatchCancelButton.setTitle("Отмена", for: .normal)
        stopwatchCancelButton.setTitleColor(.white.withAlphaComponent(0.8), for: .normal)
        stopwatchCancelButton.isEnabled = false
        stopwatchCancelButton.addTarget(self, action: #selector(stopwatchStop), for: .touchUpInside)
        view.addSubview(stopwatchCancelButton)
    }

    @objc func stopwatchStart() {
        if stopwatchStartButton.isSelected == false {
            stopwatchStartButton.isSelected = true
            stopwatchStartButton.layer.borderColor = UIColor.systemRed.withAlphaComponent(0.2).cgColor
            stopwatchCancelButton.isEnabled = true
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        } else {
            stopwatchStartButton.isSelected = false
            stopwatchStartButton.setTitle("Дальше", for: .normal)
            stopwatchStartButton.layer.borderColor = UIColor.systemGreen.withAlphaComponent(0.2).cgColor
            timer.invalidate()
        }
    }
    
    @objc func stopwatchStop() {
        stopwatchCancelButton.isEnabled = false
        stopwatchStartButton.isSelected = false
        stopwatchStartButton.layer.borderColor = UIColor.systemGreen.withAlphaComponent(0.2).cgColor
        stopwatchStartButton.setTitle("Старт", for: .normal)
        timer.invalidate()
        time = 0
        stopwatchTimeLabel.text = "00:00,00"
    }
    
    @objc func updateTimer() {
        time += 1
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        stopwatchTimeLabel.text = String(format:"%02i:%02i,%02i", hours, minutes, seconds)
    }

}
