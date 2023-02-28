//
//  AddViewController.swift
//  UIKit Homeworks
//
//  Created by nastasya on 26.02.2023.
//

import UIKit

class AddViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var instagramTextField: UITextField!
    @IBOutlet weak var genderTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    let datePicker = UIDatePicker()
    let genderPicker = UIPickerView()
    let gender = ["Male", "Female"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .date
        datePicker.locale = .init(identifier: "Russian")
        
        dateTextField.inputView = datePicker
        genderTextField.inputView = genderPicker
        
        genderPicker.dataSource = self
        genderPicker.delegate = self
        
        createGenderPicker()
        createDatePicker()
    }
    
    func createGenderPicker() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneAction))
        toolbar.setItems([doneButton], animated: true)

        genderTextField.inputAccessoryView = toolbar
    }
    
    func createDatePicker() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneDateAction))
        toolbar.setItems([doneButton], animated: true)
        
        dateTextField.inputAccessoryView = toolbar
    }
    
    @objc func doneDateAction() {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        
        dateTextField.text = formatter.string(from: datePicker.date)

        view.endEditing(true)
    }
    

    @objc func doneAction() {
        view.endEditing(true)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return gender.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return gender[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        genderTextField.text = gender[row]
    }
    
    @IBAction func instagramAlert(_ sender: Any) {
        let alertController = UIAlertController(title: "Enter your instagram", message: "", preferredStyle: .alert)
        alertController.addTextField()
        alertController.textFields?.first?.placeholder = "@example"
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive)
        let addAction = UIAlertAction(title: "Ok", style: .default) {_ in
            if alertController.textFields?.first?.text != "" {
                self.instagramTextField.text = alertController.textFields?.first?.text
            } else {
                let errorAlertController = UIAlertController(title: "Error", message: "", preferredStyle: .alert)
                let action = UIAlertAction(title: "Ok", style: .default)
                errorAlertController.addAction(action)
                self.present(errorAlertController, animated: true)
            }
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(addAction)
        
        present(alertController, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as? BirthdayViewController
        destination?.date = datePicker.date 
        destination?.name = nameTextField.text!
    }
}
