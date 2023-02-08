//
//  SecondViewController.swift
//  UIKit Homeworks
//
//  Created by nastasya on 05.02.2023.
//

import UIKit

class SecondViewController: UIViewController {
    
    let fullNameLabel = UILabel()
    let fullNameTextField = UITextField()
    let numberOfGuestsLabel = UILabel()
    let numberOfGuestsTextField = UITextField()
    let tableNumberLabel = UILabel()
    let tableNumberTextField = UITextField()
    let invoiceButton = UIButton()
    let tableReservationSwitch = UISwitch()
    let tableReservationLabel = UILabel()
    let prepaymentSwitch = UISwitch()
    let prepaymentLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Forneria"
        view.backgroundColor = .white
        
        fullNameLabel.frame = CGRect(x: 85, y: 190, width: 220, height: 60)
        fullNameLabel.text = "Фамилия и имя"
        fullNameLabel.textColor = .black
        view.addSubview(fullNameLabel)
        
        fullNameTextField.frame = CGRect(x: 85, y: 220, width: 220, height: 60)
        fullNameTextField.placeholder = "Иванов Иван"
        view.addSubview(fullNameTextField)
        
        numberOfGuestsLabel.frame = CGRect(x: 85, y: 270, width: 220, height: 60)
        numberOfGuestsLabel.text = "Количество гостей"
        numberOfGuestsLabel.textColor = .black
        view.addSubview(numberOfGuestsLabel)
        
        numberOfGuestsTextField.frame = CGRect(x: 85, y: 300, width: 220, height: 60)
        numberOfGuestsTextField.placeholder = "Количество гостей"
        view.addSubview(numberOfGuestsTextField)
        
        tableNumberLabel.frame = CGRect(x: 85, y: 350, width: 220, height: 60)
        tableNumberLabel.text = "Номер стола"
        tableNumberLabel.textColor = .black
        view.addSubview(tableNumberLabel)
        
        tableNumberTextField.frame = CGRect(x: 85, y: 380, width: 220, height: 60)
        tableNumberTextField.placeholder = "Номер стола"
        view.addSubview(tableNumberTextField)
        
        invoiceButton.frame = CGRect(x: 85, y: 650, width: 220, height: 60)
        invoiceButton.setTitle("Счёт", for: .normal)
        invoiceButton.backgroundColor = .systemRed
        invoiceButton.layer.cornerRadius = 10
        invoiceButton.clipsToBounds = true
        invoiceButton.addTarget(self, action: #selector(performThirdViewController), for: .touchUpInside)
        view.addSubview(invoiceButton)
        
        tableReservationSwitch.frame = CGRect(x: 280, y: 485, width: 0, height: 0)
        view.addSubview(tableReservationSwitch)
        
        tableReservationLabel.frame = CGRect(x: 85, y: 470, width: 220, height: 60)
        tableReservationLabel.text = "Бронировали стол?"
        tableReservationLabel.textColor = .black
        view.addSubview(tableReservationLabel)
        
        prepaymentSwitch.frame = CGRect(x: 280, y: 535, width: 0, height: 0)
        view.addSubview(prepaymentSwitch)
        
        prepaymentLabel.frame = CGRect(x: 85, y: 520, width: 220, height: 60)
        prepaymentLabel.text = "Предоплата"
        prepaymentLabel.textColor = .black
        view.addSubview(prepaymentLabel)
        
    }
    @objc func performThirdViewController() {
        let thirdViewController = ThirdViewController()
        if fullNameTextField.hasText && numberOfGuestsTextField.hasText && tableNumberTextField.hasText {
            let invoiceAlertController = UIAlertController(title: "Выставить счет?", message: "", preferredStyle: .alert)
            let invoiceAction = UIAlertAction(title: "Да", style: .default) { (action) in
                self.navigationController?.pushViewController(thirdViewController, animated: true)
            }
            invoiceAlertController.addAction(invoiceAction)
            let cancelAction = UIAlertAction(title: "Нет", style: .destructive)
            invoiceAlertController.addAction(cancelAction)
            present(invoiceAlertController, animated: true)
        } else {
            let errorAlertController = UIAlertController(title: "Ошибка", message: "Неверно введены имя/номер стола/количество гостей", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ок", style: .default)
            errorAlertController.addAction(action)
            present(errorAlertController, animated: true)
        }
        
        
    }


}
