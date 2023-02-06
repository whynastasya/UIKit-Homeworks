//
//  ViewController.swift
//  UIKit Homeworks
//
//  Created by nastasya on 28.01.2023.
//

import UIKit

class ViewController: UIViewController {

    var signInButton = UIButton(type: .system)
    let emaiLabel = UILabel()
    let passwordLabel = UILabel()
    let emailTextField = UITextField()
    let passwordTextField = UITextField()
    let logoImage = UIImage(named: "logo forneria.png")
    let logoImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //title = "Forneria"
        view.backgroundColor = .white
        signInButton.frame = CGRect(x: 95, y: 500, width: 200, height: 60)
        signInButton.setTitle("Войти", for: .normal)
        signInButton.setTitleColor(.white, for: .normal)
        signInButton.backgroundColor = UIColor.systemRed
        signInButton.layer.cornerRadius = 10
        signInButton.clipsToBounds = true
        signInButton.addTarget(self, action: #selector(performSecondViewController(parametrSender:)), for: .touchUpInside)
        view.addSubview(signInButton)
        
        emaiLabel.frame = CGRect(x: 100, y: 320, width: 220, height: 60)
        emaiLabel.text = "Почта"
        emaiLabel.textColor = .black
        view.addSubview(emaiLabel)
        
        passwordLabel.frame = CGRect(x: 100, y: 400, width: 200, height: 60)
        passwordLabel.text = "Пароль"
        passwordLabel.textColor = .black
        view.addSubview(passwordLabel)
        
        emailTextField.frame = CGRect(x: 100, y: 350, width: 200, height: 60)
        emailTextField.placeholder = "example@email.com"
        view.addSubview(emailTextField)
        
        passwordTextField.frame = CGRect(x: 100, y: 430, width: 200, height: 60)
        passwordTextField.isSecureTextEntry = true
        passwordTextField.placeholder = "********"
        view.addSubview(passwordTextField)
        
        logoImageView.frame = CGRect(x: 45, y: 200, width: 300, height: 100)
        logoImageView.image = logoImage
        logoImageView.contentMode = .scaleAspectFill
        view.addSubview(logoImageView)
    }
    
    @objc func performSecondViewController(parametrSender: UIViewController) {
        let secondViewController = SecondViewController()
        if passwordTextField.hasText && emailTextField.hasText {
            navigationController?.pushViewController(secondViewController, animated: true)
        } else {
            let errorAlertController = UIAlertController(title: "Ошибка", message: "Неверно введен почта или пароль", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ок", style: .default)
            errorAlertController.addAction(action)
            present(errorAlertController, animated: true)
        }
    }
    
}

