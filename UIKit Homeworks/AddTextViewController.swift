//
//  AddTextViewController.swift
//  UIKit Homeworks
//
//  Created by nastasya on 03.04.2023.
//

import UIKit

class AddTextViewController: UIViewController {

    var textLabel = UILabel()
    let borderLabel = UILabel()
    let textSizeSlider = UISlider()
    let textWraperSlider = UISlider()
    let textSizeSmallImageView = UIImageView()
    let textSizeBigImageView = UIImageView()
    let textWraperSmallImageView = UIImageView()
    let textWraperBigImageView = UIImageView()
    let colorPicker = UIPickerView()
    let fontPicker = UIPickerView()
    let shadowSwitch = UISwitch()
    let shadowLabel = UILabel()
    
    let colors = [("Black", UIColor.black), ("Blue", UIColor.blue), ("Pink", UIColor.systemPink), ("Yellow", UIColor.systemYellow), ("Green", UIColor.systemGreen), ("Purple", UIColor.purple), ("Orange", UIColor.systemOrange)]
    var size = 17
    let fonts = ["Copperplate", "Thonburi", "GillSans", "HelveticaNeue", "Kailasa", "Farah", "Courier", "Verdana", "Didot"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(addText))
        navigationItem.rightBarButtonItem?.tintColor = .black
        
        borderLabel.frame = CGRectMake(0, 100, 300, 300)
        borderLabel.center.x = view.center.x
        borderLabel.layer.borderWidth = 1
        borderLabel.layer.borderColor = UIColor.systemPink.cgColor
        borderLabel.layer.cornerRadius = 8
        borderLabel.clipsToBounds = true
        view.addSubview(borderLabel)
        
        textLabel.frame = CGRectMake(0, 100, 280, 280)
        textLabel.center.x = view.center.x
        textLabel.lineBreakMode = .byWordWrapping
        textLabel.shadowOffset = CGSize(width: 1, height: 1)
        view.addSubview(textLabel)
        
        textSizeSlider.frame = CGRectMake(0, 450, 300, 10)
        textSizeSlider.center.x = view.center.x
        textSizeSlider.minimumValue = 10
        textSizeSlider.maximumValue = 50
        textSizeSlider.value = 17
        textSizeSlider.tintColor = .systemPink
        textSizeSlider.addTarget(self, action: #selector(changeTextSize), for: .valueChanged)
        view.addSubview(textSizeSlider)
        
        let charImage = UIImage(systemName: "textformat.size.smaller")
        var charSmallImage = charImage?.scalePreservingAspectRatio(targetSize: CGSize(width: 25, height: 25))
        charSmallImage = charSmallImage?.withRenderingMode(.alwaysTemplate)
        var charBigImage = charImage?.scalePreservingAspectRatio(targetSize: CGSize(width: 35, height: 35))
        charBigImage = charBigImage?.withRenderingMode(.alwaysTemplate)
        
        textSizeSmallImageView.frame = CGRectMake(45, 420, 25, 25)
        textSizeSmallImageView.image = charSmallImage
        textSizeSmallImageView.tintColor = .gray
        view.addSubview(textSizeSmallImageView)
        
        textSizeBigImageView.frame = CGRectMake(315, 410, 35, 35)
        textSizeBigImageView.image = charBigImage
        textSizeBigImageView.tintColor = .gray
        view.addSubview(textSizeBigImageView)
        
        textWraperSlider.frame = CGRectMake(0, 500, 300, 10)
        textWraperSlider.center.x = view.center.x
        textWraperSlider.minimumValue = 1
        textWraperSlider.maximumValue = 10
        textWraperSlider.tintColor = .systemPink
        textWraperSlider.addTarget(self, action: #selector(moveText), for: .valueChanged)
        view.addSubview(textWraperSlider)
        
        var lineBigImage = UIImage(systemName: "arrow.up.and.down.text.horizontal")
        lineBigImage = lineBigImage?.scalePreservingAspectRatio(targetSize: CGSize(width: 25, height: 25))
        lineBigImage = lineBigImage?.withRenderingMode(.alwaysTemplate)
        var lineSmallImage = UIImage(systemName: "text.justify.leading")
        lineSmallImage = lineSmallImage?.scalePreservingAspectRatio(targetSize: CGSize(width: 25, height: 25))
        lineSmallImage = lineSmallImage?.withRenderingMode(.alwaysTemplate)
        
        textWraperSmallImageView.frame = CGRectMake(45, 470, 25, 25)
        textWraperSmallImageView.image = lineSmallImage
        textWraperSmallImageView.tintColor = .gray
        view.addSubview(textWraperSmallImageView)
        
        textWraperBigImageView.frame = CGRectMake(320, 465, 25, 25)
        textWraperBigImageView.image = lineBigImage
        textWraperBigImageView.tintColor = .gray
        view.addSubview(textWraperBigImageView)
        
        
        colorPicker.frame = CGRectMake(30, 520, 180, 150)
        colorPicker.delegate = self
        colorPicker.dataSource = self
        colorPicker.tag = 0
        view.addSubview(colorPicker)

        fontPicker.frame = CGRectMake(200, 520, 180, 150)
        fontPicker.delegate = self
        fontPicker.dataSource = self
        fontPicker.tag = 1
        view.addSubview(fontPicker)
        
        shadowLabel.frame = CGRectMake(40, 685, 200, 30)
        shadowLabel.text = "Text with shadows"
        shadowLabel.shadowOffset = CGSize(width: 2, height: 2)
        shadowLabel.shadowColor = .lightGray
        shadowLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        view.addSubview(shadowLabel)
        
        shadowSwitch.frame = CGRect(x: 300, y: 685, width: 0, height: 0)
        shadowSwitch.onTintColor = .systemPink
        shadowSwitch.addTarget(self, action: #selector(shadowText), for: .touchUpInside)
        view.addSubview(shadowSwitch)
    }
    
    @objc func addText() {
        let addTextAlertController = UIAlertController(title: "Add text", message: "", preferredStyle: .alert)
        addTextAlertController.addTextField()
        
        let addAction = UIAlertAction(title: "Add", style: .default) { _ in
            self.textLabel.text = addTextAlertController.textFields?.first?.text
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive)
        
        addTextAlertController.addAction(addAction)
        addTextAlertController.addAction(cancelAction)
        
        present(addTextAlertController, animated: true)
    }
    
    @objc func changeTextSize() {
        textLabel.font = textLabel.font.withSize(CGFloat(textSizeSlider.value))
        size = Int(textSizeSlider.value)
    }
    
    @objc func moveText() {
        textLabel.numberOfLines = Int(textWraperSlider.value)
    }
    
    @objc func shadowText() {
        if shadowSwitch.isOn {
            textLabel.shadowColor = .lightGray
        } else {
            textLabel.shadowColor = .white
        }
    }

}

extension AddTextViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        if pickerView.tag == 0 {
            return NSAttributedString(string: colors[row].0, attributes: [.foregroundColor: colors[row].1])
        } else {
            return NSAttributedString(string: fonts[row], attributes: [.font: UIFont(name: fonts[row], size: 15)!])
        }
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 0 {
            textLabel.textColor = colors[row].1
        } else {
            textLabel.font = UIFont(name: fonts[row], size: CGFloat(size))
        }
    }
}

extension AddTextViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 0 {
            return colors.count
        } else {
            return fonts.count
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

