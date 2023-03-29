//
//  ViewController.swift
//  UIKit Homeworks
//
//  Created by nastasya on 28.01.2023.
//

import UIKit

class ViewController: UIViewController {

    let userNameLabel = UILabel()
    let phoneNumberLabel = UILabel()
    let userNameTextField = UITextField()
    let phoneNumberTextField = UITextField()
    let nameLabel = UILabel()
    let signInButton = UIButton()
    let passwordLabel = UILabel()
    let passwordTextField = UITextField()
    let logInButton = UIButton()
    
    var userData = [User]()
    let user = User(name: "Настасья", phone: "89260819584", password: "Жопа")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        userData.append(user)
        
        nameLabel.frame = CGRectMake(0, 120, 200, 50)
        nameLabel.center.x = self.view.center.x
        nameLabel.text = "DeliveryFood"
        nameLabel.textAlignment = .center
        nameLabel.font = UIFont.systemFont(ofSize: 30, weight: .heavy)
        nameLabel.textColor = .black
        view.addSubview(nameLabel)
        
        userNameLabel.frame = CGRectMake(50, 250, 300, 50)
        userNameLabel.text = "Как вас зовут?"
        userNameLabel.font = UIFont.systemFont(ofSize: 21, weight: .heavy)
        userNameLabel.textColor = .systemOrange
        view.addSubview(userNameLabel)
        
        userNameTextField.frame = CGRectMake(50, 290, 290, 30)
        userNameTextField.layer.borderWidth = 1
        userNameTextField.layer.borderColor = UIColor.systemOrange.withAlphaComponent(0.4).cgColor
        userNameTextField.backgroundColor = .white
        userNameTextField.layer.cornerRadius = 5
        userNameTextField.clipsToBounds = true
        userNameTextField.placeholder = " Настасья"
        userNameTextField.keyboardType = .default
        userNameTextField.clearButtonMode = .always
        userNameTextField.delegate = self
        userNameTextField.tag = 1
        view.addSubview(userNameTextField)
        
        phoneNumberLabel.frame = CGRectMake(50, 330, 300, 50)
        phoneNumberLabel.text = "Укажите ваш телефон"
        phoneNumberLabel.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        phoneNumberLabel.textColor = .systemOrange
        view.addSubview(phoneNumberLabel)
        
        phoneNumberTextField.frame = CGRectMake(50, 370, 290, 30)
        phoneNumberTextField.placeholder = " +7"
        phoneNumberTextField.layer.borderWidth = 1
        phoneNumberTextField.layer.borderColor = UIColor.systemOrange.withAlphaComponent(0.4).cgColor
        phoneNumberTextField.backgroundColor = .white
        phoneNumberTextField.layer.cornerRadius = 5
        phoneNumberTextField.clipsToBounds = true
        phoneNumberTextField.keyboardType = .phonePad
        phoneNumberTextField.clearButtonMode = .always
        view.addSubview(phoneNumberTextField)
        
        passwordLabel.frame = CGRectMake(50, 410, 300, 50)
        passwordLabel.text = "Придумайте пароль"
        passwordLabel.textColor = .systemOrange
        passwordLabel.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        view.addSubview(passwordLabel)
        
        passwordTextField.frame = CGRectMake(50, 450, 290, 30)
        passwordTextField.placeholder = " **************"
        passwordTextField.layer.borderWidth = 1
        passwordTextField.layer.borderColor = UIColor.systemOrange.withAlphaComponent(0.4).cgColor
        passwordTextField.backgroundColor = .white
        passwordTextField.layer.cornerRadius = 5
        passwordTextField.clipsToBounds = true
        passwordTextField.isSecureTextEntry = true
        passwordTextField.clearButtonMode = .always
        passwordTextField.delegate = self
        passwordTextField.tag = 3
        view.addSubview(passwordTextField)
        
        signInButton.frame = CGRectMake(0, 520, 280, 70)
        signInButton.center.x = view.center.x
        signInButton.layer.cornerRadius = 30
        signInButton.clipsToBounds = true
        signInButton.setTitle("Зарегистрироваться", for: .normal)
        signInButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        signInButton.setTitleColor(.white, for: .normal)
        signInButton.backgroundColor = .systemOrange
        signInButton.addTarget(self, action: #selector(signIn), for: .touchUpInside)
        view.addSubview(signInButton)
        
        logInButton.frame = CGRectMake(0, 590, 200, 50)
        logInButton.center.x = view.center.x
        logInButton.setTitle("Уже зарегистрированы?", for: .normal)
        logInButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .heavy)
        logInButton.setTitleColor(.systemOrange, for: .normal)
        logInButton.addTarget(self, action: #selector(logIn), for: .touchUpInside)
        view.addSubview(logInButton)
    }
    
    @objc func signIn() {
        let nextViewController = CategoryProductViewController()
        if userNameTextField.hasText && phoneNumberTextField.hasText && passwordTextField.hasText {
            for user in userData {
                if phoneNumberTextField.text == user.phone {
                    let errorAlertController = UIAlertController(title: "Ошибка", message: "Пользователь с таким номером уже существует", preferredStyle: .alert)
                    let action = UIAlertAction(title: "Ок", style: .destructive)
                    errorAlertController.addAction(action)
                    present(errorAlertController, animated: true)
                }
            }
            let user = User(name: userNameTextField.text!, phone: phoneNumberTextField.text!, password: passwordTextField.text!)
            userData.append(user)
            navigationController?.pushViewController(nextViewController, animated: true)
        } else {
            let errorAlertController = UIAlertController(title: "", message: "Введите все необходимые данные", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .destructive)
            errorAlertController.addAction(action)
            present(errorAlertController, animated: true)
        }
    }
    
    @objc func logIn() {
        present(LogInViewController(), animated: true)
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.tag == 1 {
            phoneNumberTextField.becomeFirstResponder()
        } else if textField.tag == 3 {
            return textField.resignFirstResponder()
        }
        return true
    }
}

struct User {
    let name: String
    let phone: String
    let password: String
    
    init(name: String, phone: String, password: String) {
        self.name = name
        self.phone = phone
        self.password = password
    }
}
