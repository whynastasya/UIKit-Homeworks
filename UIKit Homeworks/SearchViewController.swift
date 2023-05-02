//
//  ViewController.swift
//  UIKit Homeworks
//
//  Created by nastasya on 28.01.2023.
//

import UIKit

final class SearchViewController: UIViewController {

    @IBOutlet private var productScroll: UIScrollView!
    @IBOutlet private var searchButtons: [UIButton]!
    
    private var currentViewOffset = CGFloat(10)
    private let repository: ProductShowcaseRepositoryDelegate
    private var products = [Product]()
    
    required init?(coder: NSCoder) {
        self.repository = ProductShowcaseRepository()
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tabBarController?.tabBar.backgroundColor = .black
        
        let contentSizeWidth = productScroll.bounds.width * 1.7
        let contentSizeHeight = productScroll.bounds.height
        productScroll.contentSize = CGSize(width: contentSizeWidth, height: contentSizeHeight)
        products = repository.fetchProducts()
        
        for index in 0...products.count - 1 {
            createProductScroll(products[index].name, index: index)
        }
    }
    
    private func createProductScroll(_ product: String, index: Int) {
        let productView = UIView()
        let productImageView = UIImageView()
        let productNameLabel = UILabel()
        let frame = CGRectMake(currentViewOffset, 0, 150, 190)
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(selectProduct))

        productView.frame = frame
        productView.layer.cornerRadius = 20
        productView.clipsToBounds = true
        productView.backgroundColor = .darkGray.withAlphaComponent(0.3)
        productView.tag = index
        productView.addGestureRecognizer(singleTap)
        
        productImageView.frame = CGRectMake(25, 20, 100, 100)
        productImageView.image = UIImage(named: product)
        productImageView.contentMode = .scaleAspectFit
        productView.addSubview(productImageView)
        
        productNameLabel.frame = CGRectMake(15, 100, 100, 100)
        productNameLabel.numberOfLines = 3
        productNameLabel.lineBreakMode = .byWordWrapping
        productNameLabel.text = product
        productNameLabel.textColor = .white
        productNameLabel.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        productView.addSubview(productNameLabel)
        
        productScroll.addSubview(productView)
        currentViewOffset += productView.frame.width + 15
    }
    
    @objc func selectProduct(_ sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            guard let nextViewController = storyboard.instantiateViewController(withIdentifier: "SelectedProductViewController") as? ProductViewController else { return }
            nextViewController.product = products[sender.view?.tag ?? 0]
            navigationController?.pushViewController(nextViewController, animated: true)
        }
    }
}
