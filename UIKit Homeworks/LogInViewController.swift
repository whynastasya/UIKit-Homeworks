//
//  LogInViewController.swift
//  UIKit Homeworks
//
//  Created by nastasya on 05.04.2023.
//

import UIKit

class LogInViewController: UIViewController {

    let phoneNumberLabel = UILabel()
    let phoneNumberTextField = UITextField()
    let passwordLabel = UILabel()
    let passwordTextField = UITextField()
    let signInButton = UIButton()
    let logInButton = UIButton()
    
    var userData = [User]()
    let user = User(name: "Настасья", phone: "892608119584", password: "Жопа")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        userData.append(user)
        
        phoneNumberLabel.frame = CGRectMake(50, 230, 300, 50)
        phoneNumberLabel.text = "Телефон"
        phoneNumberLabel.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        phoneNumberLabel.textColor = .systemOrange
        view.addSubview(phoneNumberLabel)
        
        phoneNumberTextField.frame = CGRectMake(50, 270, 290, 30)
        phoneNumberTextField.placeholder = " +7"
        phoneNumberTextField.layer.borderWidth = 1
        phoneNumberTextField.layer.borderColor = UIColor.systemOrange.withAlphaComponent(0.4).cgColor
        phoneNumberTextField.backgroundColor = .white
        phoneNumberTextField.layer.cornerRadius = 5
        phoneNumberTextField.clipsToBounds = true
        phoneNumberTextField.keyboardType = .phonePad
        phoneNumberTextField.clearButtonMode = .always
        view.addSubview(phoneNumberTextField)
        
        passwordLabel.frame = CGRectMake(50, 310, 300, 50)
        passwordLabel.text = "Пароль"
        passwordLabel.textColor = .systemOrange
        passwordLabel.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        view.addSubview(passwordLabel)
        
        passwordTextField.frame = CGRectMake(50, 350, 290, 30)
        passwordTextField.placeholder = " **************"
        passwordTextField.layer.borderWidth = 1
        passwordTextField.layer.borderColor = UIColor.systemOrange.withAlphaComponent(0.4).cgColor
        passwordTextField.backgroundColor = .white
        passwordTextField.layer.cornerRadius = 5
        passwordTextField.clipsToBounds = true
        passwordTextField.isSecureTextEntry = true
        passwordTextField.clearButtonMode = .always
        view.addSubview(passwordTextField)
        
        logInButton.frame = CGRectMake(0, 420, 230, 70)
        logInButton.center.x = view.center.x
        logInButton.layer.cornerRadius = 30
        logInButton.clipsToBounds = true
        logInButton.setTitle("Войти", for: .normal)
        logInButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        logInButton.setTitleColor(.white, for: .normal)
        logInButton.backgroundColor = .systemOrange
        logInButton.addTarget(self, action: #selector(logIn), for: .touchUpInside)
        view.addSubview(logInButton)
        
        signInButton.frame = CGRectMake(0, 490, 300, 50)
        signInButton.center.x = view.center.x
        signInButton.setTitle("Еще не зарегистрированы?", for: .normal)
        signInButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .heavy)
        signInButton.setTitleColor(.systemOrange, for: .normal)
        signInButton.addTarget(self, action: #selector(signIn), for: .touchUpInside)
        view.addSubview(signInButton)
    }
    

    @objc func signIn() {
        dismiss(animated: true)
    }
    
    @objc func logIn() {
        let nextViewController = CategoryProductViewController()
        if passwordTextField.hasText && phoneNumberTextField.hasText {
            for user in userData {
                if passwordTextField.text == user.password && phoneNumberTextField.text == user.phone {
                    navigationController?.pushViewController(nextViewController, animated: true)
                } else {
                    let errorAlertController = UIAlertController(title: "Ошибка", message: "Неверно введены данные", preferredStyle: .alert)
                    let action = UIAlertAction(title: "Ок", style: .destructive)
                    errorAlertController.addAction(action)
                    present(errorAlertController, animated: true)
                }
            }
        } else {
            let errorAlertController = UIAlertController(title: "", message: "Введите все необходимые данные", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .destructive)
            errorAlertController.addAction(action)
            present(errorAlertController, animated: true)
        }
    }

}
