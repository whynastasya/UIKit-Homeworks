//
//  ViewController.swift
//  UIKit Homeworks
//
//  Created by nastasya on 28.01.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
//        if passwordTextField.hasText && emailTextField.hasText {
//            return true
//        } else {
//            let errorAlertController = UIAlertController(title: "Ошибка", message: "Неверно введен почта или пароль", preferredStyle: .alert)
//            let action = UIAlertAction(title: "Ок", style: .default)
//            errorAlertController.addAction(action)
//            present(errorAlertController, animated: true)
//            return false
//        }
    true
    }
    
    func prepareSecondViewController(for segue: ViewController, sender: Any?) {
        
    }
    
    
//    @IBAction func signInButton(_ sender: UIButton) {
//        let secondViewController = BirthdayViewController()
//        if passwordTextField.hasText && emailTextField.hasText {
//            navigationController?.pushViewController(secondViewController, animated: true)
//        } else {
//            let errorAlertController = UIAlertController(title: "Ошибка", message: "Неверно введен почта или пароль", preferredStyle: .alert)
//            let action = UIAlertAction(title: "Ок", style: .default)
//            errorAlertController.addAction(action)
//            present(errorAlertController, animated: true)
//        }
//    }
}

