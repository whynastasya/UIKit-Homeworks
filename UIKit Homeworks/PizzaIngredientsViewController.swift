//
//  PizzaIngredientsViewController.swift
//  UIKit Homeworks
//
//  Created by nastasya on 28.03.2023.
//

import UIKit

class PizzaIngredientsViewController: UIViewController {

    var pizzaName = ""
    let pizzaComposition = ["Маргарита": "Увеличенная порция моцареллы, томаты, итальянские травы, фирменный томатный соус", "Пепперони": "Пикантная пепперони, увеличенная порция моцареллы, томаты, фирменный томатный соус",  "Четыре сыра": "Сыр блю чиз, смесь сыров чеддер и пармезан, моцарелла, фирменный соус альфредо"]
    
    let margheritaPrice = [389, 599, 729]
    let pepperoniPrice = [439, 669, 829]
    let cheesePrice = [489, 739, 889]
    
    let margheritaWeight = [410, 630, 850]
    let pepperoniWeight = [380, 580, 760]
    let cheeseWeight = [340, 510, 690]
    
    let sizes = ["Маленькая", "Средняя", "Большая"]
    let sizesInt = [25, 30, 35]
    let ingredients = ["Сливочная моцарелла", "Острый халапеньо", "Шампиньоны"]
    let ingredientPrices = ["Сливочная моцарелла": 59, "Острый халапеньо": 59, "Шампиньоны": 59]
    var selectingBool = ["Сливочная моцарелла": false, "Острый халапеньо": false, "Шампиньоны": false]
    var pizzaSizeImages = [UIImage]()
    var price = 0
    var ingredientPrice = 0
    var selectedIngredients = [String]()
    
    let pizzaNameLabel = UILabel()
    let pizzaCompositionLabel = UILabel()
    let pizzaSizeLabel = UILabel()
    var sizeSegmentedControl = UISegmentedControl()
    let cancelButton = UIButton()
    let pizzaImageView = UIImageView()
    let ingredientLabel = UILabel()
    let buyButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        selectedIngredients = []
        
        pizzaImageView.frame = CGRectMake(0, 25, 350, 300)
        pizzaImageView.center.x = view.center.x
        let pizzaImage = UIImage(named: pizzaName)
        pizzaImageView.image = pizzaImage
        view.addSubview(pizzaImageView)
        
        pizzaNameLabel.frame = CGRectMake(20, 325, 200, 30)
        pizzaNameLabel.text = pizzaName
        pizzaNameLabel.font = UIFont.systemFont(ofSize: 27, weight: .bold)
        view.addSubview(pizzaNameLabel)
        
        pizzaCompositionLabel.frame = CGRectMake(20, 370, 350, 50)
        pizzaCompositionLabel.text = pizzaComposition[pizzaName]
        pizzaCompositionLabel.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        pizzaCompositionLabel.textColor = .darkGray
        pizzaCompositionLabel.numberOfLines = 2
        pizzaCompositionLabel.lineBreakMode = .byWordWrapping
        view.addSubview(pizzaCompositionLabel)
        
        cancelButton.frame = CGRectMake(20, 40, 40, 20)
        let cancelImage = UIImage(systemName: "chevron.down")
        cancelButton.setBackgroundImage(cancelImage, for: .normal)
        cancelButton.tintColor = .lightGray
        cancelButton.addTarget(self, action: #selector(cancel), for: .touchUpInside)
        view.addSubview(cancelButton)
        
        ingredientLabel.frame = CGRectMake(20, 480, 300, 30)
        ingredientLabel.text = "Добавить по вкусу"
        ingredientLabel.font = UIFont.systemFont(ofSize: 19, weight: .bold)
        view.addSubview(ingredientLabel)
        
        for ingredient in ingredients {
            createIngredientButton(ingredientName: ingredient)
        }
        
        for i in 0...2 {
            pizzaSizeImages.append(UIImage(named: pizzaName + " " + sizes[i])!)
        }
        
        sizeSegmentedControl = UISegmentedControl(items: sizes)
        sizeSegmentedControl.frame = CGRectMake(20, 430, 350, 40)
        sizeSegmentedControl.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15, weight: .medium)], for: .normal)
        sizeSegmentedControl.selectedSegmentIndex = 1
        sizeSegmentedControl.addTarget(self, action: #selector(selectPizzaSize), for: .valueChanged)
        view.addSubview(sizeSegmentedControl)
        
        pizzaSizeLabel.frame = CGRectMake(20, 350, 400, 30)
        pizzaSizeLabel.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        pizzaSizeLabel.textColor = .lightGray
        view.addSubview(pizzaSizeLabel)
        
        buyButton.frame = CGRectMake(0, 690, 300, 50)
        buyButton.center.x = view.center.x
        buyButton.titleLabel?.textAlignment = .center
        buyButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        buyButton.layer.cornerRadius = 20
        buyButton.clipsToBounds = true
        buyButton.backgroundColor = .systemOrange
        buyButton.addTarget(self, action: #selector(goShoppingBag), for: .touchUpInside)
        view.addSubview(buyButton)
    
    switch pizzaName {
    case "Маргарита":
        price = margheritaPrice[sizeSegmentedControl.selectedSegmentIndex]
        pizzaSizeLabel.text = sizes[sizeSegmentedControl.selectedSegmentIndex] + " " + "\(sizesInt[sizeSegmentedControl.selectedSegmentIndex]) см, традиционное тесто, \(margheritaWeight[sizeSegmentedControl.selectedSegmentIndex]) г"
        buyButton.setTitle("В корзину за \(price) ₽", for: .normal)
    case "Пепперони":
        price = pepperoniPrice[sizeSegmentedControl.selectedSegmentIndex]
        pizzaSizeLabel.text = sizes[sizeSegmentedControl.selectedSegmentIndex] + " " +  "\(sizesInt[sizeSegmentedControl.selectedSegmentIndex]) см, традиционное тесто, \(pepperoniWeight[sizeSegmentedControl.selectedSegmentIndex]) г"
        buyButton.setTitle("В корзину за \(price) ₽", for: .normal)
    case "Четыре сыра":
        price = cheesePrice[sizeSegmentedControl.selectedSegmentIndex]
        pizzaSizeLabel.text = sizes[sizeSegmentedControl.selectedSegmentIndex] + " " + "\(sizesInt[sizeSegmentedControl.selectedSegmentIndex]) см, традиционное тесто, \(cheeseWeight[sizeSegmentedControl.selectedSegmentIndex]) г"
        buyButton.setTitle("В корзину за \(price) ₽", for: .normal)
    default:
        return
    }
        print(selectedIngredients)
    }
    
    @objc func cancel() {
        dismiss(animated: true)
    }
    
    func createIngredientButton(ingredientName: String) {
        let ingredientButton = UIButton()
        let ingredientNameLabel = UILabel()
        let ingredientImageView = UIImageView()
        let ingredientPriceLabel = UILabel()
        
        switch ingredientName {
        case "Сливочная моцарелла":
            ingredientButton.frame = CGRectMake(20, 520, 110, 150)
            ingredientNameLabel.frame = CGRectMake(25, 610, 100, 30)
            ingredientImageView.frame = CGRectMake(40, 530, 80, 80)
            ingredientPriceLabel.frame = CGRectMake(27, 637, 100, 30)
        case "Острый халапеньо":
            ingredientButton.frame = CGRectMake(140, 520, 110, 150)
            ingredientNameLabel.frame = CGRectMake(145, 610, 100, 30)
            ingredientImageView.frame = CGRectMake(150, 530, 80, 80)
            ingredientPriceLabel.frame = CGRectMake(147, 637, 100, 30)
        case "Шампиньоны":
            ingredientButton.frame = CGRectMake(260, 520, 110, 150)
            ingredientNameLabel.frame = CGRectMake(265, 610, 100, 30)
            ingredientImageView.frame = CGRectMake(270, 530, 80, 80)
            ingredientPriceLabel.frame = CGRectMake(267, 637, 100, 30)
        default:
            return
        }
        
        ingredientButton.setTitle(ingredientName, for: .normal)
        ingredientButton.tintColor = .white
        ingredientButton.layer.cornerRadius = 10
        ingredientButton.clipsToBounds = true
        ingredientButton.layer.borderWidth = 1
        ingredientButton.layer.borderColor = UIColor.lightGray.cgColor
        ingredientButton.addTarget(self, action: #selector(selectIngredient), for: .touchUpInside)
        view.addSubview(ingredientButton)
        
        ingredientNameLabel.text = ingredientName
        ingredientNameLabel.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        ingredientNameLabel.numberOfLines = 2
        ingredientNameLabel.lineBreakMode = .byWordWrapping
        ingredientNameLabel.textAlignment = .center
        view.addSubview(ingredientNameLabel)
        
        let ingredientImage = UIImage(named: ingredientName)
        ingredientImageView.image = ingredientImage
        view.addSubview(ingredientImageView)
        
        ingredientPriceLabel.text = "\(ingredientPrices[ingredientName] ?? 0) ₽"
        ingredientPriceLabel.textAlignment = .center
        ingredientPriceLabel.font = UIFont.systemFont(ofSize: 19, weight: .bold)
        view.addSubview(ingredientPriceLabel)
    }
    
    @objc func selectIngredient(parametrSender: UIButton) {
        let checkImage = UIImage(systemName: "checkmark.circle")
        let checkImageView = UIImageView()
        let ingredientName = parametrSender.titleLabel?.text
        switch ingredientName {
        case "Сливочная моцарелла":
            checkImageView.frame = CGRectMake(95, 525, 30, 30)
        case "Острый халапеньо":
            checkImageView.frame = CGRectMake(215, 525, 30, 30)
        case "Шампиньоны":
            checkImageView.frame = CGRectMake(335, 525, 30, 30)
        default:
            return
        }
        
        checkImageView.image = checkImage
        view.addSubview(checkImageView)
        
        if selectingBool[ingredientName!] == false {
            parametrSender.layer.borderWidth = 2
            parametrSender.layer.borderColor = UIColor.systemOrange.cgColor
            checkImageView.tintColor = .systemOrange
            ingredientPrice += ingredientPrices[ingredientName!]!
            price += ingredientPrices[ingredientName!]!
            buyButton.setTitle("В корзину за \(price) ₽", for: .normal)
            selectingBool[ingredientName!] = true
        } else {
            parametrSender.layer.borderWidth = 1
            parametrSender.layer.borderColor = UIColor.lightGray.cgColor
            checkImageView.tintColor = .white
            ingredientPrice -= ingredientPrices[ingredientName!]!
            price -= ingredientPrices[ingredientName!]!
            buyButton.setTitle("В корзину за \(price) ₽", for: .normal)
            selectingBool[ingredientName!] = false
        }
    }
    
    @objc func selectPizzaSize() {
        pizzaImageView.image = pizzaSizeImages[sizeSegmentedControl.selectedSegmentIndex]
        switch pizzaName {
        case "Маргарита":
            pizzaSizeLabel.text = sizes[sizeSegmentedControl.selectedSegmentIndex] + " " + "\(sizesInt[sizeSegmentedControl.selectedSegmentIndex]) см, традиционное тесто, \(price) г"
            price = margheritaWeight[sizeSegmentedControl.selectedSegmentIndex] + ingredientPrice
            buyButton.setTitle("В корзину за \(price) ₽", for: .normal)
        case "Пепперони":
            pizzaSizeLabel.text = sizes[sizeSegmentedControl.selectedSegmentIndex] + " " +  "\(sizesInt[sizeSegmentedControl.selectedSegmentIndex]) см, традиционное тесто, \(pepperoniWeight[sizeSegmentedControl.selectedSegmentIndex]) г"
            price = pepperoniPrice[sizeSegmentedControl.selectedSegmentIndex] + ingredientPrice
            buyButton.setTitle("В корзину за \(price) ₽", for: .normal)
        case "Четыре сыра":
            pizzaSizeLabel.text = sizes[sizeSegmentedControl.selectedSegmentIndex] + " " + "\(sizesInt[sizeSegmentedControl.selectedSegmentIndex]) см, традиционное тесто, \(cheeseWeight[sizeSegmentedControl.selectedSegmentIndex]) г"
            price = cheesePrice[sizeSegmentedControl.selectedSegmentIndex] + ingredientPrice
            buyButton.setTitle("В корзину за \(price) ₽", for: .normal)
        default:
            return
        }
    }
    
    @objc func goShoppingBag() {
        let nextViewController = ShoppingBagViewController()
        
        nextViewController.price = price
        nextViewController.pizzaName = pizzaName
        nextViewController.selectingBool = selectingBool
        nextViewController.pizzaImage = pizzaImageView.image!
        nextViewController.pizzaSize = pizzaSizeLabel.text!
        
        present(nextViewController, animated: true)
    }

}
