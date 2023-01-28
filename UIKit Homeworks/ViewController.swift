//
//  ViewController.swift
//  UIKit Homeworks
//
//  Created by nastasya on 28.01.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func startButton(_ sender: Any) {
        let startAlertController = UIAlertController(title: "", message: "Введите слово", preferredStyle: .alert)
        let action = UIAlertAction(title: "ОК", style: .default) { (action) in
            let text = startAlertController.textFields?.first
            if text?.text == "leohl" {
                self.resultLabel.text = "hello"
            } else {
                let errorAlertController = UIAlertController(title: "Ошибка", message: "Неккоректное значение", preferredStyle: .alert)
                let action = UIAlertAction(title: "Ок", style: .default)
                errorAlertController.addAction(action)
                self.present(errorAlertController, animated: true)
            }
        }
        
        startAlertController.addTextField { (textField) in
            textField.placeholder = "leohl"
        }
        startAlertController.addAction(action)
        present(startAlertController, animated: true)
    }
}


