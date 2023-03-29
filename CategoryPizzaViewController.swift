//
//  CategoryPizzaViewController.swift
//  UIKit Homeworks
//
//  Created by nastasya on 28.03.2023.
//

import UIKit

class CategoryPizzaViewController: UIViewController {

    let pizzas = ["Маргарита", "Пепперони", "Четыре сыра"]
    let pizzaPrice = ["Маргарита": 389, "Пепперони": 439, "Четыре сыра": 489]
    let pizzaComposition = ["Маргарита": "Увеличенная порция моцареллы, томаты, итальянские травы, фирменный томатный соус", "Пепперони": "Пикантная пепперони, увеличенная порция моцареллы, томаты, фирменный томатный соус",  "Четыре сыра": "Сыр блю чиз, смесь сыров чеддер и пармезан, моцарелла, фирменный соус альфредо"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 25, weight: .heavy)]
        navigationController?.title = "PIZZA"
        
        for pizza in pizzas {
            createPizzaButton(pizzaName: pizza)
        }
    }
    
    func createPizzaButton(pizzaName: String) {
        let pizzaButton = UIButton()
        let pizzaNameLabel = UILabel()
        let pizzaCompositionLabel = UILabel()
        let pizzaImageView = UIImageView()
        let buyLabel = UILabel()
        
        switch pizzaName {
        case "Пепперони":
            pizzaButton.frame = CGRectMake(0, 100, 400, 200)
            pizzaImageView.frame = CGRectMake(1, 125, 170, 140)
            pizzaNameLabel.frame = CGRectMake(180, 115, 200, 40)
            pizzaCompositionLabel.frame = CGRectMake(180, 150, 200, 100)
            buyLabel.frame = CGRectMake(180, 255, 100, 30)
        case "Маргарита":
            pizzaButton.frame = CGRectMake(0, 300, 400, 200)
            pizzaImageView.frame = CGRectMake(1, 325, 170, 140)
            pizzaNameLabel.frame = CGRectMake(180, 315, 200, 40)
            pizzaCompositionLabel.frame = CGRectMake(180, 350, 200, 100)
            buyLabel.frame = CGRectMake(180, 455, 100, 30)
        case "Четыре сыра":
            pizzaButton.frame = CGRectMake(0, 500, 400, 200)
            pizzaImageView.frame = CGRectMake(1, 525, 170, 140)
            pizzaNameLabel.frame = CGRectMake(180, 515, 200, 40)
            pizzaCompositionLabel.frame = CGRectMake(180, 550, 200, 100)
            buyLabel.frame = CGRectMake(180, 655, 100, 30)
        default:
            return
        }
        
        pizzaButton.center.x = view.center.x
        pizzaButton.setTitle(pizzaName, for: .normal)
        pizzaButton.tintColor = .black
//        pizzaButton.layer.borderWidth = 1
//        pizzaButton.layer.borderColor = UIColor.systemOrange.cgColor
        pizzaButton.addTarget(self, action: #selector(selectPizza), for: .touchUpInside)
        view.addSubview(pizzaButton)
        
        let pizzaImage = UIImage(named: pizzaName)
        pizzaImageView.image = pizzaImage
        view.addSubview(pizzaImageView)
        
        pizzaNameLabel.text = pizzaName
        pizzaNameLabel.font = UIFont.systemFont(ofSize: 27, weight: .bold)
        view.addSubview(pizzaNameLabel)
        
        pizzaCompositionLabel.text = pizzaComposition[pizzaName]
        pizzaCompositionLabel.lineBreakMode = .byWordWrapping
        pizzaCompositionLabel.numberOfLines = 5
        pizzaCompositionLabel.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        pizzaCompositionLabel.textColor = .lightGray
        view.addSubview(pizzaCompositionLabel)
    
        buyLabel.text = "Oт \(pizzaPrice[pizzaName] ?? 0) ₽"
        buyLabel.textColor = .systemOrange
        buyLabel.textAlignment = .center
        buyLabel.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        buyLabel.backgroundColor = .systemOrange.withAlphaComponent(0.1)
        buyLabel.layer.cornerRadius = 10
        buyLabel.clipsToBounds = true
        view.addSubview(buyLabel)
    }
    
    @objc func selectPizza(paramtrSender: UIButton) {
        let nextViewController = PizzaIngredientsViewController()
        nextViewController.pizzaName = (paramtrSender.titleLabel?.text)!
        present(nextViewController, animated: true)
    }

}
