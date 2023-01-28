//
//  ViewController.swift
//  less3_app1
//
//  Created by nastasya on 27.01.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var hiLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func startButton(_ sender: Any) {
        let alertController = UIAlertController(title: "Старт", message: "Введите имя", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ок", style: .default) { (action) in
            let text = alertController.textFields?.first
            if text!.hasText {
                self.hiLabel.text! = "Привет, " + (text?.text)! + "!"
            } else {
                let errorAlertController = UIAlertController(title: "Ошибка", message: "Некорректное имя", preferredStyle: .alert)
                let action = UIAlertAction(title: "Ок", style: .default)
                errorAlertController.addAction(action)
                self.present(errorAlertController, animated: true, completion: nil)
            }
        }
        alertController.addTextField()
        alertController.addAction(action)
        present(alertController, animated: true)
    }
    
    @IBAction func summaryButton(_ sender: Any) {
        summary(title: "Сумма", message: "Введите 2 числа", preferredStyle: .alert, summaryLabel: summaryLabel)
    }
    
    func summary(title: String, message: String, preferredStyle: UIAlertController.Style, summaryLabel: UILabel) {
        let summaryAlertController = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
        let sum = UIAlertAction(title: "Результат", style: .default) { (sum) in
            let valueOne = summaryAlertController.textFields?.first
            let valueTwo = summaryAlertController.textFields?[1]
            let summary = Int(valueOne?.text ?? "0" )! + Int(valueTwo?.text ?? "0")!
            self.summaryLabel.text! = "Результат  =  \(summary)"
        }
        
        summaryAlertController.addTextField { (textField) in
            textField.placeholder = "Первое число"
        }
        summaryAlertController.addTextField{ (textField) in
            textField.placeholder = "Второе число"
        }
        summaryAlertController.addAction(sum)
        present(summaryAlertController, animated: true)
    }
    
    @IBAction func gameButton(_ sender: Any) {
        let number = Int.random(in: 1..<11)
        let gameAlertController = UIAlertController(title: "Игра", message: "Угадайте число от 1 до 10", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Угадать", style: .default) { (acton) in
            let value = gameAlertController.textFields?.first
            if Int(value?.text ?? "0") == number {
                showAlertController(title: "Победа", message: "Число равно \(number)")
            } else {
                showAlertController(title: "Проигрыш", message: "Число равно \(number)")
            }
        }
        
        gameAlertController.addTextField()
        gameAlertController.addAction(action)
        present(gameAlertController, animated: true)
        
        func showAlertController(title: String, message: String) {
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let action = UIAlertAction(title: "Ок", style: .default)
            alertController.addAction(action)
            present(alertController, animated: true)
        }
    }
}

