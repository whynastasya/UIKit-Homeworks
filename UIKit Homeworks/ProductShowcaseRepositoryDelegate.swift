//
//  ProductShowcaseRepositoryDelegate.swift
//  UIKit Homeworks
//
//  Created by nastasya on 23.04.2023.
//

import Foundation

protocol ProductShowcaseRepositoryDelegate {
    func fetchProducts() -> [Product]
}
