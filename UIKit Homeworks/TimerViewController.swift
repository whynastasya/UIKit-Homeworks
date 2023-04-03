//
//  TimerViewController.swift
//  UIKit Homeworks
//
//  Created by nastasya on 01.04.2023.
//

import UIKit

class TimerViewController: UIViewController {
    
    @IBOutlet weak var cancelButton2: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var timerPicker: UIPickerView!
    @IBOutlet weak var timerSoundButton: UIButton!
    @IBOutlet weak var startButton2: UIButton!
    @IBOutlet weak var startLabel: UILabel!
    @IBOutlet weak var cancelLabel: UILabel!
    
    var timerWork = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tabBarItem.image = UIImage(systemName: "timer")
        
        timerPicker.delegate = self
        timerPicker.dataSource = self
        
        var circleImage = UIImage(systemName: "circle")
        circleImage = circleImage?.scalePreservingAspectRatio(targetSize: CGSize(width: 120, height: 120))
        circleImage = circleImage?.withRenderingMode(.alwaysTemplate)
        
        var circleImageFill = UIImage(systemName: "circle.fill")
        circleImageFill = circleImageFill?.scalePreservingAspectRatio(targetSize: CGSize(width: 90, height: 90))
        circleImageFill = circleImageFill?.withRenderingMode(.alwaysTemplate)
        
        startButton.setImage(circleImage, for: .normal)
        startButton.tintColor = .systemGreen
        startButton.layer.borderWidth = 13
        startButton.layer.borderColor = UIColor.black.cgColor
        startButton.layer.cornerRadius = startButton.frame.width / 2
        startButton.clipsToBounds = true
        startButton.alpha = 0.2
        
        startButton2.setImage(circleImageFill, for: .normal)
        startButton2.tintColor = .systemGreen
        startButton2.alpha = 0.2
        startButton2.addTarget(self, action: #selector(start), for: .touchUpInside)
        
        cancelButton.setImage(circleImage, for: .normal)
        cancelButton.tintColor = .darkGray
        cancelButton.alpha = 0.4
        cancelButton.layer.borderWidth = 13
        cancelButton.layer.borderColor = UIColor.black.cgColor
        cancelButton.layer.cornerRadius = cancelButton.frame.width / 2
        cancelButton.clipsToBounds = true
        
        cancelButton2.setImage(circleImageFill, for: .normal)
        cancelButton2.tintColor = .darkGray
        cancelButton2.alpha = 0.4
        cancelButton2.addTarget(self, action: #selector(cancel), for: .touchUpInside)
        
        timerSoundButton.layer.cornerRadius = 10
        timerSoundButton.clipsToBounds = true
    }
    
    @objc func start() {
        if timerWork == false {
            cancelLabel.textColor = .white
            startButton.tintColor = .systemYellow
            startButton2.tintColor = .systemYellow
            startLabel.text = "Пауза"
            startLabel.textColor = .yellow
            timerWork = true
        } else {
            startButton.tintColor = .systemGreen
            startButton2.tintColor = .systemGreen
            startLabel.text = "Дальше"
            startLabel.textColor = .systemGreen
            timerWork = false
        }
    }
    
    @objc func cancel() {
        cancelLabel.text = "Отмена"
        cancelLabel.textColor = .gray
        startLabel.text = "Старт"
        startLabel.textColor = .systemGreen
        startButton.tintColor = .systemGreen
        startButton2.tintColor = .systemGreen
    }
}

extension TimerViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
            case 0:
                return "\(row) c"
            case 1:
                return "\(row) мин"
            case 2:
                return "\(row) ч"
            default:
                return ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        NSAttributedString(string: "\(row)", attributes: [.foregroundColor: UIColor.white])
    }


}

extension TimerViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
            case 0:
                return 60
            case 1:
                return 60
            case 2:
                return 24
            default:
                return 0
        }
    }
}

extension UIImage {
    func scalePreservingAspectRatio(targetSize: CGSize) -> UIImage {
        // Determine the scale factor that preserves aspect ratio
        let widthRatio = targetSize.width / size.width
        let heightRatio = targetSize.height / size.height
        
        let scaleFactor = min(widthRatio, heightRatio)
        
        // Compute the new image size that preserves aspect ratio
        let scaledImageSize = CGSize(
            width: size.width * scaleFactor,
            height: size.height * scaleFactor
        )

        // Draw and return the resized UIImage
        let renderer = UIGraphicsImageRenderer(
            size: scaledImageSize
        )

        let scaledImage = renderer.image { _ in
            self.draw(in: CGRect(
                origin: .zero,
                size: scaledImageSize
            ))
        }
        
        return scaledImage
    }
}
