//
//  CategoryProductViewController.swift
//  UIKit Homeworks
//
//  Created by nastasya on 28.03.2023.
//

import UIKit

class CategoryProductViewController: UIViewController {
    
    let categoryPizzaButton = UIButton()
    let categorySushiButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        navigationItem.setHidesBackButton(true, animated: true)
        navigationItem.title = "Food"
        navigationController?.navigationBar.titleTextAttributes = [.font: UIFont.systemFont(ofSize: 30, weight: .heavy)]
        
        categoryPizzaButton.frame = CGRectMake(0, 100, 400, 130)
        categoryPizzaButton.center.x = self.view.center.x
        categoryPizzaButton.setTitle("PIZZA", for: .normal)
        categoryPizzaButton.setTitleColor(.black, for: .normal)
        categoryPizzaButton.titleLabel?.font = UIFont.systemFont(ofSize: 25, weight: .medium)
        let pizzaImage = UIImage(named: "pizza")
        categoryPizzaButton.setBackgroundImage(pizzaImage, for: .normal)
        categoryPizzaButton.layer.cornerRadius = 5
        categoryPizzaButton.clipsToBounds = true
        categoryPizzaButton.layer.borderWidth = 1
        categoryPizzaButton.layer.borderColor = UIColor.systemOrange.cgColor
        categoryPizzaButton.addTarget(self, action: #selector(selectCategory), for: .touchUpInside)
        view.addSubview(categoryPizzaButton)
        
        categorySushiButton.frame = CGRectMake(0, 230, 400, 130)
        categorySushiButton.center.x = self.view.center.x
        categorySushiButton.setTitle("SUSHI", for: .normal)
        categorySushiButton.setTitleColor(.black, for: .normal)
        categorySushiButton.titleLabel?.font = UIFont.systemFont(ofSize: 25, weight: .medium)
        let sushiImage = UIImage(named: "sushi")
        categorySushiButton.setBackgroundImage(sushiImage, for: .normal)
        categorySushiButton.layer.cornerRadius = 5
        categorySushiButton.clipsToBounds = true
        categorySushiButton.layer.borderWidth = 1
        categorySushiButton.layer.borderColor = UIColor.systemOrange.cgColor
        categorySushiButton.addTarget(self, action: #selector(selectCategory), for: .touchUpInside)
        view.addSubview(categorySushiButton)
        
    }
    
    @objc func selectCategory(parametrSender: UIButton) {
        if parametrSender.titleLabel?.text == "PIZZA" {
            let nextViewController = CategoryPizzaViewController()
            navigationController?.pushViewController(nextViewController, animated: true)
        } else {
            let alertController = UIAlertController(title: "", message: "Категория недоступна", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .destructive)
            alertController.addAction(action)
            present(alertController, animated: true)
        }
    }

}
