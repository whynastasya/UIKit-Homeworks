//
//  ViewController.swift
//  UIKit Homeworks
//
//  Created by nastasya on 28.01.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var search: UITextField!
    @IBOutlet weak var productScroll: UIScrollView!
    @IBOutlet var searchButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        search.leftView = UIImageView(image: UIImage(systemName: "magnifyingglass")?.withTintColor(.lightGray, renderingMode: .alwaysOriginal))
        search.leftViewMode = .always
        search.attributedPlaceholder = NSAttributedString(string: "Поиск по продуктам и магазинам", attributes: [.foregroundColor: UIColor.lightGray, .font: UIFont.systemFont(ofSize: 17)])
        
//        for searchButton in searchButtons {
//            searchButton.layer.borderWidth = 0.5
//            searchButton.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.5).cgColor
//        }
        
        
    }
    
   


}

