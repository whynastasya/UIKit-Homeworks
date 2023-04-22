//
//  ProductViewController.swift
//  UIKit Homeworks
//
//  Created by nastasya on 20.04.2023.
//

import UIKit

final class ProductViewController: UIViewController {

    @IBOutlet private var productColorButton: UIButton!
    @IBOutlet private var productPriceLabel: UILabel!
    @IBOutlet private var productScrollView: UIScrollView!
    @IBOutlet private var productNameLabels: [UILabel]!

    var product = Product(name: "", price: "", imagesNames: [], URL: "")
    
    private var isFavorite = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationAppearance()
        setupProductView(using: product)
    }
    
    private func setupProductView(using product: Product) {
        
        let countImages = CGFloat(product.imagesNames.count)
        
        func setupScrollView() {
            let contentSizeHeight = productScrollView.bounds.height
            let contentSizeWidth = productScrollView.bounds.width * countImages
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(goToProductWebsite))
            productScrollView.contentSize = CGSize(width: contentSizeWidth, height: contentSizeHeight)
            productScrollView.addGestureRecognizer(tapGestureRecognizer)
        }
        
        func setupLabels() {
            productNameLabels[0].text = product.name
            productNameLabels[1].text = product.name
            productPriceLabel.text = product.price
        }
        
        func addImagesOnScrollView() {
            for i in 0..<Int(countImages) {
                let productImageView = UIImageView()
                let frame = CGRectMake(CGFloat(i) * productScrollView.frame.width, 0, productScrollView.frame.width, productScrollView.frame.height)
                productImageView.frame = frame
                productImageView.image = UIImage(named: product.imagesNames[i])
                productImageView.contentMode = .scaleAspectFit
                productScrollView.addSubview(productImageView)
            }
        }
        
        setupScrollView()
        setupLabels()
        addImagesOnScrollView()
    }
    
    private func setupNavigationAppearance() {
        navigationController?.navigationBar.tintColor  = .systemBlue
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: "heart"), style: .done, target: self, action: #selector(makeFavorite)),
            UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"), style: .done, target: self, action: #selector(shareProduct))
        ]
    }

    @objc func makeFavorite(heartButton sender: UIBarButtonItem) {
        sender.image = isFavorite ? UIImage(systemName: "heart") : UIImage(systemName: "heart.fill")
        isFavorite.toggle()
    }
    
    @objc func shareProduct(sender: UIBarButtonItem) {
        let activityViewController = UIActivityViewController(activityItems: [product as Any],
                                                              applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = view
        present(activityViewController, animated: true)
    }
    
    @IBAction func selectProductColor(_ sender: UIButton) {
        sender.layer.cornerRadius = 13
        sender.clipsToBounds = true
        if sender.tag == 0 {
            sender.layer.borderWidth = 1
            sender.layer.borderColor = UIColor.systemBlue.cgColor
            sender.tag = 1
        } else {
            sender.layer.borderWidth = 0
            sender.tag = 0
        }
    }
    
    @objc func goToProductWebsite(_ sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            let nextViewController = ProductWebViewController()
            nextViewController.productURL = product.URL
            nextViewController.modalPresentationStyle = .popover
            present(nextViewController, animated: true)
        }
    }
}
