//
//  ShoppingBagViewController.swift
//  UIKit Homeworks
//
//  Created by nastasya on 25.03.2023.
//

import UIKit

class ShoppingBagViewController: UIViewController {

    @IBOutlet weak var nameItemLabel: UILabel!
    @IBOutlet weak var sizeItemLabel: UILabel!
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemButton: UIButton!
    var nameItem = ""
    var size = ""
    var itemImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        itemButton.layer.borderWidth = 1.5
        itemButton.layer.borderColor = UIColor.lightGray.cgColor
        nameItemLabel.text = nameItem
        sizeItemLabel.text = size
        itemImageView.image = itemImage
    }
    

    

}
