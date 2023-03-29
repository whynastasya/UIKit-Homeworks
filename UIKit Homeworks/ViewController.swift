//
//  ViewController.swift
//  UIKit Homeworks
//
//  Created by nastasya on 28.01.2023.
//

import UIKit

class ViewController: UIViewController {

    let emailLabel = UILabel()
    let passwordLabel = UILabel()
    let emailTextField = UITextField()
    let passwordTextField = UITextField()
    let nameLabel = UILabel()
    let signInButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        nameLabel.frame = CGRectMake(0, 120, 200, 50)
        nameLabel.center.x = self.view.center.x
        nameLabel.text = "Delivery"
        nameLabel.textAlignment = .center
        nameLabel.font = UIFont.systemFont(ofSize: 27, weight: .heavy)
        view.addSubview(nameLabel)
        
        emailLabel.frame = CGRectMake(40, 300, 100, 50)
        emailLabel.text = "Email"
        emailLabel.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        emailLabel.textColor = .systemOrange
        view.addSubview(emailLabel)
        
        emailTextField.frame = CGRectMake(40, 350, 310, 30)
        emailTextField.layer.borderWidth = 1
        emailTextField.layer.borderColor = UIColor.lightGray.cgColor
        emailTextField.layer.cornerRadius = 5
        emailTextField.clipsToBounds = true
        emailTextField.placeholder = " example@mail.com"
        view.addSubview(emailTextField)
        
        passwordLabel.frame = CGRectMake(40, 380, 100, 50)
        passwordLabel.text = "Пароль"
        passwordLabel.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        passwordLabel.textColor = .systemOrange
        view.addSubview(passwordLabel)
        
        passwordTextField.frame = CGRectMake(40, 430, 310, 30)
        passwordTextField.placeholder = " ************"
        passwordTextField.layer.borderWidth = 1
        passwordTextField.layer.borderColor = UIColor.lightGray.cgColor
        passwordTextField.isSecureTextEntry = true
        passwordTextField.layer.cornerRadius = 5
        passwordTextField.clipsToBounds = true
        view.addSubview(passwordTextField)
        
        signInButton.frame = CGRectMake(0, 550, 250, 70)
        signInButton.center.x = self.view.center.x
        signInButton.layer.cornerRadius = 13
        signInButton.clipsToBounds = true
        signInButton.setTitle("Войти", for: .normal)
        signInButton.titleLabel?.font = UIFont.systemFont(ofSize: 25, weight: .heavy)
        signInButton.backgroundColor = .systemOrange
        signInButton.addTarget(self, action: #selector(signIn), for: .touchUpInside)
        view.addSubview(signInButton)
    }
    
    @objc func signIn() {
        let nextViewController = CategoryProductViewController()
        if emailTextField.hasText && passwordTextField.hasText {
            navigationController?.pushViewController(nextViewController, animated: true)
        } else {
            let errorAlertController = UIAlertController(title: "", message: "Логин или пароль введен неверно", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .destructive)
            errorAlertController.addAction(action)
            present(errorAlertController, animated: true)
        }
    }
                        

}

