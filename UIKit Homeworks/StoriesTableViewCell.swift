//
//  StoriesTableViewCell.swift
//  UIKit Homeworks
//
//  Created by nastasya on 11.05.2023.
//

import UIKit

final class StoriesTableViewCell: UITableViewCell {
    
    private enum Constants {
        static let storiesDimensions: CGFloat = 80
        static let storiesXOffset: CGFloat = 15
    }

    private let storiesScrollView = UIScrollView()
    private var usersWithStoriesCount = 50
    private var userAvatarImageViews = [UIImageView]()
    private var userNameLabels = [UILabel]()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupStoriesScrollView()
        setupUserStoriesView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        updateStoriesScrollViewDimensions()
    }
    
    private func updateStoriesScrollViewDimensions() {
        storiesScrollView.frame = contentView.bounds
        let widthPerStory = Constants.storiesDimensions + Constants.storiesXOffset
        storiesScrollView.contentSize = CGSize(
            width: widthPerStory * CGFloat(usersWithStoriesCount + 1),
            height: contentView.bounds.height
        )
    }
    
    private func setupStoriesScrollView() {
        storiesScrollView.backgroundColor = .black
        storiesScrollView.showsHorizontalScrollIndicator = false
        storiesScrollView.showsVerticalScrollIndicator = false
        contentView.addSubview(storiesScrollView)
    }
    
    private func setupUserStoriesView() {
        for index in 0...usersWithStoriesCount {
            let storiesView = UIView()
            let precedingStoriesWidths = CGFloat(index) * Constants.storiesDimensions
            let precedingStoriesOffsets = CGFloat(index + 1) * Constants.storiesXOffset
            let currentViewOffset =  precedingStoriesWidths + precedingStoriesOffsets
            
            storiesView.frame = CGRectMake(
                currentViewOffset,
                10,
                Constants.storiesDimensions,
                Constants.storiesDimensions
            )
            storiesView.layer.cornerRadius = Constants.storiesDimensions / 2
            
            let userAvatarImageView = createUserAvatarImageView()
            storiesView.addSubview(userAvatarImageView)
            
            let userNameLabel = createUserNameLabelImageView()
            storiesView.addSubview(userNameLabel)
            userNameLabel.topAnchor.constraint(equalTo: storiesView.bottomAnchor, constant: 1).isActive = true
            userNameLabel.centerXAnchor.constraint(equalTo: storiesView.centerXAnchor, constant: 1).isActive = true
            
            if index == 0 {
                userAvatarImageView.image = UIImage(named: "userAvatar")
                let plusImageView = createPlusImageView()
                storiesView.addSubview(plusImageView)
                userNameLabel.text = "Ваша история"
            } else {
                let gradientLayer = createGradientLayer()
                storiesView.layer.insertSublayer(gradientLayer, at: 0)
                userAvatarImageViews.append(userAvatarImageView)
                userNameLabels.append(userNameLabel)
            }
            storiesScrollView.addSubview(storiesView)
        }
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
    
    private func createUserAvatarImageView() -> UIImageView {
        let userAvatarImageView = UIImageView()
        let userAvatarDimmension = Constants.storiesDimensions - 5
        userAvatarImageView.frame = CGRectMake(2, 2, userAvatarDimmension, userAvatarDimmension)
        userAvatarImageView.layer.cornerRadius = userAvatarDimmension / 2
        userAvatarImageView.layer.borderWidth = 3
        userAvatarImageView.layer.borderColor = UIColor.black.cgColor
        userAvatarImageView.clipsToBounds = true
        userAvatarImageView.contentMode = .scaleAspectFit
        return userAvatarImageView
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
    
    private func createUserNameLabelImageView() -> UILabel {
        let userNameLabel = UILabel()
        userNameLabel.textColor = .white
        userNameLabel.font = UIFont.systemFont(ofSize: 13)
        userNameLabel.textAlignment = .center
        storiesScrollView.addSubview(userNameLabel)
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        userNameLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        userNameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        return userNameLabel
    }
    
    func configure(with usersWithStories: [User]) {
        usersWithStoriesCount = usersWithStories.count
        for index in 0..<usersWithStoriesCount {
            userAvatarImageViews[index].image = UIImage(named: usersWithStories[index].avatar)
            userNameLabels[index].text = usersWithStories[index].name
        }
    }
    
}
