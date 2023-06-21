//
//  StoriesTableViewCell.swift
//  UIKit Homeworks
//
//  Created by nastasya on 11.05.2023.
//

import UIKit

final class StoriesForNewsFeedTableViewCell: StoriesTableViewCell {
    
    override func createStoriesView() -> UIView {
        let storiesView =  super.createStoriesView()
        let gradient = createGradientLayer()
        storiesView.layer.addSublayer(gradient)
        return storiesView
    }
    
    private func createGradientLayer() -> CAGradientLayer {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(
            x: 0,
            y: 0,
            width: Constants.storiesDimensions,
            height: Constants.storiesDimensions
        )
        gradientLayer.colors = [
            UIColor.systemYellow.cgColor,
            UIColor.systemOrange.cgColor,
            UIColor.systemRed.cgColor,
            UIColor.systemPink.cgColor,
            UIColor.systemPurple.cgColor
        ]
        gradientLayer.startPoint = CGPointMake(0.1, 1)
        gradientLayer.endPoint = CGPointMake(1, 0.5)
        gradientLayer.cornerRadius = Constants.storiesDimensions / 2
        return gradientLayer
    }
    
    private func createPlusImageView() -> UIImageView {
        let plusImageView = UIImageView()
        plusImageView.image = UIImage(systemName: "plus.circle.fill")
        plusImageView.tintColor = .systemBlue
        plusImageView.backgroundColor = .white
        plusImageView.frame = CGRect(x: 50, y: 50, width: 30, height: 30)
        plusImageView.layer.cornerRadius = plusImageView.frame.width / 2
        plusImageView.layer.borderWidth = 3
        plusImageView.layer.borderColor = UIColor.black.cgColor
        return plusImageView
    }
    
    override func configure(with stories: [Story]) {
        super.configure(with: stories)
        storiesPreviewImageViews[0].image = UIImage(named: "userAvatar")
        storiesNameLabels[0].text = "Ваша история"
    }
}
