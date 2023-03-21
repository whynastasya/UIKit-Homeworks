//
//  ViewController.swift
//  UIKit Homeworks
//
//  Created by nastasya on 28.01.2023.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var itemButton1: UIButton!
    @IBOutlet weak var itemButton2: UIButton!
    @IBOutlet weak var itemButton3: UIButton!
    @IBOutlet weak var itemButton4: UIButton!
    @IBOutlet weak var itemImageView1: UIImageView!
    @IBOutlet weak var itemImageView2: UIImageView!
    @IBOutlet weak var itemImageView3: UIImageView!
    @IBOutlet weak var itemImageView4: UIImageView!
    @IBOutlet weak var likeButton1: UIButton!
    @IBOutlet weak var likeButton2: UIButton!
    @IBOutlet weak var likeButton3: UIButton!
    @IBOutlet weak var likeButton4: UIButton!
    @IBOutlet weak var itemLabel1: UILabel!
    @IBOutlet weak var itemLabel2: UILabel!
    @IBOutlet weak var itemLabel3: UILabel!
    @IBOutlet weak var itemLabel4: UILabel!
    
    var likedItems = [false, false, false, false]
    let itemsName = ["SAMBA VEGAN SHOES", "NEW BALANCE 2002R", "NIKE BLAZER MID 77", "name4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let itemsButton = [itemButton1, itemButton2, itemButton3, itemButton4]
        for i in 0...3 {
            createItemButton(parametrSender: itemsButton[i]!, name: itemsName[i])
        }
        
        let itemsImageView = [itemImageView1, itemImageView2, itemImageView3, itemImageView4]
        for i in 0...3 {
            createImageView(parametrSender: itemsImageView[i]!, index: i)
        }
        
        let itemsLabel = [itemLabel1, itemLabel2, itemLabel3, itemLabel4]
        for i in 0...3 {
            itemsLabel[i]?.text = itemsName[i]
        }
        
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 25, weight: .heavy)]
        
        let likeButtons = [likeButton1, likeButton2, likeButton3, likeButton4]
        for i in 0...3 {
            likeButtons[i]?.titleLabel?.text = String(i)
            likeButtons[i]?.titleLabel?.textColor = .white
        }
    }
    
    func createItemButton(parametrSender: UIButton, name: String) {
        parametrSender.layer.borderWidth = 1.5
        parametrSender.layer.borderColor = UIColor.lightGray.cgColor
        parametrSender.layer.cornerRadius = 10
        parametrSender.clipsToBounds = true
        parametrSender.setTitle(name, for: .normal)
        parametrSender.setTitleColor(.white, for: .normal)
    }
    
    func createImageView(parametrSender: UIImageView, index: Int) {
        let itemImage = UIImage(named: itemsName[index])
        parametrSender.image = itemImage
    }
    
    @IBAction func likeItem(parametrSender: UIButton) {
        let index = Int((parametrSender.titleLabel?.text)!)!
        if likedItems[index] == false {
            let heartFillImage = UIImage(systemName: "heart.fill")
            parametrSender.setImage(heartFillImage, for: .normal)
            likedItems[index] = true
        } else {
            let heartImage = UIImage(systemName: "heart")
            parametrSender.setImage(heartImage, for: .normal)
            likedItems[index] = false
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? SelectedItemViewController else { return }
        let itemName = (sender as? UIButton)?.titleLabel?.text!
        var index = 0
        for i in 0...3 {
            if itemsName[i] == itemName {
                index = i
            }
        }
        destination.likedItem = likedItems[index]
        destination.itemName = itemName!
        destination.index = index
    }
    
    
}

