//
//  ElementForSplashScreenViewController.swift
//  UIKit Homeworks
//
//  Created by nastasya on 02.05.2023.
//

import UIKit

final class ItemForSplashScreenViewController: UIViewController {

    private let itemImageView = UIImageView()
    private let itemTextLabel = UILabel()
    
    var item: ItemForSplashScreen
    
    init(item: ItemForSplashScreen) {
        self.item = item
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupItemImageView()
        setupItemTextLabel()
        animateItemViews()
    }
    
    private func setupItemImageView() {
        itemImageView.frame = CGRectMake(-300, view.center.y - 150, 150, 150)
        itemImageView.image = UIImage(named: item.image)
        itemImageView.contentMode = .scaleAspectFit
        itemImageView.isHidden = true
        view.addSubview(itemImageView)
    }
    
    private func setupItemTextLabel() {
        itemTextLabel.frame = CGRectMake(view.frame.maxX, itemImageView.frame.maxY + 10, 200, 100)
        itemTextLabel.textAlignment = .center
        itemTextLabel.textColor = .black
        itemTextLabel.numberOfLines = 3
        itemTextLabel.lineBreakMode = .byWordWrapping
        itemTextLabel.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        itemTextLabel.text = item.text
        itemTextLabel.isHidden = true
        view.addSubview(itemTextLabel)
    }
    
    private func animateItemViews() {
        itemImageView.isHidden = false
        UIView.animate(withDuration: 1.5,
                       delay: 0,
                       usingSpringWithDamping: 0.8,
                       initialSpringVelocity: 0.3,
                       options: .curveEaseInOut,
                       animations: {
            self.itemImageView.frame = CGRectMake(self.view.center.x - 75, self.view.center.y - 150, 150, 150)
        })
        
        itemTextLabel.isHidden = false
        UIView.animate(withDuration: 1.5,
                       delay: 0,
                       usingSpringWithDamping: 0.8,
                       initialSpringVelocity: 0.3,
                       options: .curveEaseInOut,
                       animations: {
            self.itemTextLabel.frame = CGRectMake(self.view.center.x - 100, self.itemImageView.frame.maxY + 10, 200, 100)
        })
    }
}
