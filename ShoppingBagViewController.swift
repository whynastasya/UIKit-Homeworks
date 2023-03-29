//
//  ShoppingBagViewController.swift
//  UIKit Homeworks
//
//  Created by nastasya on 29.03.2023.
//

import UIKit

class ShoppingBagViewController: UIViewController {

    var pizzaName = ""
    var price = 0
    var selectedIngredients = [String]()
    var selectingBool = [String: Bool]()
    var pizzaImage = UIImage()
    var pizzaSize = ""
    let ingredientPrices = ["Сливочная моцарелла": 59, "Острый халапеньо": 59, "Шампиньоны": 59]
    var index = 1
    
    let shoppingBagLabel = UILabel()
    let pizzaImageView = UIImageView()
    let pizzaNameLabel = UILabel()
    let priceLabel = UILabel()
    let pizzaSizeLabel = UILabel()
    let buyButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        for (key, value) in selectingBool {
            if value == true {
                selectedIngredients.append(key)
            }
        }
        
        shoppingBagLabel.frame = CGRectMake(20, 30, 200, 30)
        shoppingBagLabel.text = "Корзина"
        shoppingBagLabel.font = UIFont.systemFont(ofSize: 27, weight: .heavy)
        view.addSubview(shoppingBagLabel)
        
        pizzaImageView.frame = CGRectMake(10, 80, 120, 120)
        pizzaImageView.image = pizzaImage
        pizzaImageView.contentMode = .scaleAspectFit
        view.addSubview(pizzaImageView)
        
        pizzaNameLabel.frame = CGRectMake(130, 100, 300, 30)
        pizzaNameLabel.text = pizzaName
        pizzaNameLabel.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        view.addSubview(pizzaNameLabel)
        
        pizzaSizeLabel.frame = CGRectMake(130, 120, 220, 50)
        pizzaSizeLabel.text = pizzaSize
        pizzaSizeLabel.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        pizzaSizeLabel.numberOfLines = 2
        pizzaSizeLabel.lineBreakMode = .byWordWrapping
        pizzaSizeLabel.textColor = .lightGray
        view.addSubview(pizzaSizeLabel)
        
        priceLabel.frame = CGRectMake(320, 100, 200, 30)
        priceLabel.text = "\(price) ₽"
        priceLabel.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        priceLabel.textColor = .darkGray
        view.addSubview(priceLabel)
        
        for selectedIngredient in selectedIngredients {
            createIngredientButton(ingredientName: selectedIngredient)
        }
        
        buyButton.frame = CGRectMake(0, 690, 300, 50)
        buyButton.center.x = view.center.x
        buyButton.titleLabel?.textAlignment = .center
        buyButton.setTitle("Оформить заказ на \(price) ₽", for: .normal)
        buyButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        buyButton.layer.cornerRadius = 20
        buyButton.clipsToBounds = true
        buyButton.backgroundColor = .systemOrange
        buyButton.addTarget(self, action: #selector(buy), for: .touchUpInside)
        view.addSubview(buyButton)
        
        index = 1
    }
    
    
    
    func createIngredientButton(ingredientName: String) {
        let ingredientImageView = UIImageView()
        let ingredientNameLabel = UILabel()
        let ingredientsLabel = UILabel()
        let ingredientPriceLabel = UILabel()
        
        switch index {
        case 1:
            ingredientImageView.frame = CGRectMake(30, 230, 60, 60)
            ingredientNameLabel.frame = CGRectMake(100, 230, 200, 30)
            ingredientPriceLabel.frame = CGRectMake(100, 250, 300, 30)
        case 2:
            ingredientImageView.frame = CGRectMake(30, 290, 60, 60)
            ingredientNameLabel.frame = CGRectMake(100, 290, 200, 30)
            ingredientPriceLabel.frame = CGRectMake(100, 310, 300, 30)
        case 3:
            ingredientImageView.frame = CGRectMake(30, 350, 60, 60)
            ingredientNameLabel.frame = CGRectMake(100, 350, 200, 30)
            ingredientPriceLabel.frame = CGRectMake(100, 370, 300, 30)
        default:
            return
        }
        
        ingredientsLabel.frame = CGRectMake(30, 195, 200, 30)
        ingredientsLabel.text = "Добавить к заказу:"
        ingredientsLabel.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        view.addSubview(ingredientsLabel)
       
        let ingredientImage = UIImage(named: ingredientName)
        ingredientImageView.image = ingredientImage
        ingredientImageView.contentMode = .scaleAspectFit
        view.addSubview(ingredientImageView)
        
        ingredientNameLabel.text = ingredientName
        ingredientNameLabel.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        view.addSubview(ingredientNameLabel)
        
        ingredientPriceLabel.text = "\(ingredientPrices[ingredientName] ?? 0) ₽"
        ingredientPriceLabel.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        ingredientPriceLabel.textColor = .darkGray
        view.addSubview(ingredientPriceLabel)
        
        index += 1
    }
    
    @objc func buy() {
        let alertController = UIAlertController(title: "Заказ оплачен!", message: "Ваш заказ доставят в течение 15 минут. Приятного аппетита!", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ок", style: .cancel) { (action) in
            let nextViewController = CategoryProductViewController()
            self.navigationController?.pushViewController(nextViewController, animated: true)
        }
        
        alertController.addAction(action)
        present(alertController, animated: true)
        
    }
    
}
