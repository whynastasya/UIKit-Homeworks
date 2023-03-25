//
//  SelectedItemViewController.swift
//  UIKit Homeworks
//
//  Created by nastasya on 21.03.2023.
//

import UIKit

class SelectedItemViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var sizeTextField: UITextField!
    let sizePicker = UIPickerView()
    let size = ["7", "7.5", "8", "8.5", "9", "9.5", "10", "11"]
    var likedItem = false
    var itemName = ""
    var index = 0
    @IBOutlet weak var nameItemLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var colorSegmentedControl: UISegmentedControl!
    var colorImages = [UIImage]()
    let itemSegmentedControl1 = ["White", "Green", "Black"]
    let itemSegmentedControl2 = ["Olive", "Gray", "Brown"]
    let itemSegmentedControl3 = ["Red", "Blue", "Purple"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        sizeTextField.inputView = sizePicker
        sizePicker.dataSource = self
        sizePicker.delegate = self
        createSizePicker()
        
        navigationController?.navigationBar.tintColor = .black
        
        nameItemLabel.text = itemName
        
        if likedItem == true {
            var heartFillImage = UIImage(systemName: "heart.fill")
            heartFillImage = heartFillImage?.scalePreservingAspectRatio(targetSize: CGSize(width: 30, height: 30))
            likeButton.setImage(heartFillImage, for: .normal)
        }
        
        let itemImage = UIImage(named: itemName)
        itemImageView.image = itemImage
        
        
        
        switch index {
        case 0:
            createColorSegmentedControl(array: itemSegmentedControl1)
        case 1:
            createColorSegmentedControl(array: itemSegmentedControl2)
        case 2:
            createColorSegmentedControl(array: itemSegmentedControl3)
        default:
            return
        }
        
        colorSegmentedControl.addTarget(self, action: #selector(selectColor), for: .valueChanged)
    }
    
    func createSizePicker() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneAction))
        toolbar.setItems([doneButton], animated: true)
        
        sizeTextField.inputAccessoryView = toolbar
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return size.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return size[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        sizeTextField.text = size[row]
    }
    
    @objc func doneAction() {
         view.endEditing(true)
     }
    
    //переход в корзину
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if sizeTextField.hasText {
            return true
        } else {
            let errorAlertController = UIAlertController(title: "", message: "Enter the size", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .cancel)
            errorAlertController.addAction(action)
            present(errorAlertController, animated: true)
            return false
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? ShoppingBagViewController else { return }
        
        destination.nameItem = itemName
        destination.size = sizeTextField.text!
        destination.itemImage = itemImageView.image!
    }
    
    @IBAction func likeButton(parametrSender: UIButton) {
        if likedItem == false {
            var heartFillImage = UIImage(systemName: "heart.fill")
            heartFillImage = heartFillImage?.scalePreservingAspectRatio(targetSize: CGSize(width: 30, height: 30))
            parametrSender.setImage(heartFillImage, for: .normal)
            likedItem = true
        } else {
            var heartImage = UIImage(systemName: "heart")
            heartImage = heartImage?.scalePreservingAspectRatio(targetSize: CGSize(width: 30, height: 30))
            parametrSender.setImage(heartImage, for: .normal)
            likedItem = false
        }
    }
    
    func createColorSegmentedControl(array: [String]) {
        for i in 0...2 {
            colorSegmentedControl.setTitle(array[i], forSegmentAt: i)
            colorImages.append(UIImage(named: array[i])!)
        }
    }
    
    @objc func selectColor(parametrSender: UISegmentedControl) {
        itemImageView.image = colorImages[parametrSender.selectedSegmentIndex]
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
