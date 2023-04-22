//
//  ProductShowcaseRepository.swift
//  UIKit Homeworks
//
//  Created by nastasya on 23.04.2023.
//

import Foundation

final class ProductShowcaseRepository: ProductShowcaseRepositoryDelegate {
    
    private let iPad = Product(
        name: "iPad Air",
        price: "AED 2,499",
        imagesNames: [
            "iPad Air_1",
            "iPad Air_2",
            "iPad Air_3"
        ],
        URL: "https://www.apple.com/ae/shop/buy-ipad/ipad-air"
    )
    
    private let iPhoneLeather = Product(
        name: "iPhone Leather Wallet with MagSafe",
        price: "AED 269.00",
        imagesNames: [
            "iPhone Leather Wallet with MagSafe_1",
            "iPhone Leather Wallet with MagSafe_2",
            "iPhone Leather Wallet with MagSafe_3",
            "iPhone Leather Wallet with MagSafe_4",
            "iPhone Leather Wallet with MagSafe_5"
        ],
        URL: "https://www.apple.com/ae/shop/product/MPPY3ZE/A/iphone-leather-wallet-with-magsafe-orange"
    )
    
    private let airPods = Product(
        name: "AirPods (3rd generation) with Lightning Charging Case",
        price: "AED 719.00",
        imagesNames: [
            "AirPods (3rd generation)_1",
            "AirPods (3rd generation)_2",
            "AirPods (3rd generation)_3",
            "AirPods (3rd generation)_4"
        ],
        URL: "https://www.apple.com/ae/shop/product/MPNY3ZE/A/airpods-3rd-generation-with-lightning-charging-case"
    )
    
    private let airPodsMax = Product(
        name: "AirPods Max",
        price: "AED 2,099.00",
        imagesNames: [
            "AirPods Max_1",
            "AirPods Max_2",
            "AirPods Max_3",
            "AirPods Max_4"
        ],
        URL: "https://www.apple.com/ae/shop/buy-airpods/airpods-max/green"
    )
    
    func fetchProducts() -> [Product] {
        [iPad, airPods, airPodsMax, iPhoneLeather]
    }
}
