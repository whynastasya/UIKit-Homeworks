//
//  ThirdViewController.swift
//  UIKit Homeworks
//
//  Created by nastasya on 07.02.2023.
//

import UIKit

class ThirdViewController: UIViewController {

    let firstDishLabel = UILabel()
    let firstDishPriceLabel = UILabel()
    let secondDishLabel = UILabel()
    let secondDishPriceLabel = UILabel()
    let payButton = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Чек"
        view.backgroundColor = .white
        
        firstDishLabel.frame = CGRect(x: 35, y: 250, width: 250, height: 60)
        firstDishLabel.text = "1. Облепиховый чай"
        firstDishLabel.textColor = .black
        firstDishLabel.font = UIFont.systemFont(ofSize: 23)
        view.addSubview(firstDishLabel)
        
        firstDishPriceLabel.frame = CGRect(x: 280, y: 250, width: 220, height: 60)
        firstDishPriceLabel.text = "320 руб."
        firstDishPriceLabel.textColor = .gray
        view.addSubview(firstDishPriceLabel)

        secondDishLabel.frame = CGRect(x: 35, y: 330, width: 250, height: 60)
        secondDishLabel.text = "2. Пицца Маргарита"
        secondDishLabel.textColor = .black
        secondDishLabel.font = UIFont.systemFont(ofSize: 22)
        view.addSubview(secondDishLabel)
        
        secondDishPriceLabel.frame = CGRect(x: 280, y: 330, width: 220, height: 60)
        secondDishPriceLabel.text = "440 руб."
        secondDishPriceLabel.textColor = .gray
        view.addSubview(secondDishPriceLabel)
        
        payButton.frame = CGRect(x: 85, y: 650, width: 220, height: 60)
        payButton.backgroundColor = .systemRed
        payButton.setTitle("Оплатить", for: .normal)
        payButton.layer.cornerRadius = 10
        payButton.clipsToBounds = true
        payButton.addTarget(self, action: #selector(pay), for: .touchUpInside)
        view.addSubview(payButton)
    }
                            
    @objc func pay() {
        let checkAlertController = UIAlertController(title: "Оплата", message: "Итого 760 рублей", preferredStyle: .alert)
        let payAction = UIAlertAction(title: "Да", style: .default)
        let cancelAction = UIAlertAction(title: "Нет", style: .destructive)
        checkAlertController.addAction(payAction)
        checkAlertController.addAction(cancelAction)
        present(checkAlertController, animated: true)
    }

}
