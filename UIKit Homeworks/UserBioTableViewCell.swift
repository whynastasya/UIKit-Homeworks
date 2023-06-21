//
//  UserDataTableViewCell.swift
//  UIKit Homeworks
//
//  Created by nastasya on 22.05.2023.
//

import UIKit

class UserBioTableViewCell: UITableViewCell {

    private let userAvatarImageView = UIImageView()
    private let publicationCountLabel = UILabel()
    private let followersCountLabel = UILabel()
    private let followingCountLabel = UILabel()
    private let nameLabel = UILabel()
    private let signatureLabel = UILabel()
    private let commonSubscriptionsLabel = UILabel()
    
    private let texts = ["Публикации", "Подписчики", "Подписки", "Подписаны:"]
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUserAvatar()
        setupCountLabels()
        setupBioLabels()
        setupButtons()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUserAvatar() {
        contentView.addSubview(userAvatarImageView)
        userAvatarImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userAvatarImageView.widthAnchor.constraint(equalToConstant: 100),
            userAvatarImageView.heightAnchor.constraint(equalToConstant: 100),
            userAvatarImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            userAvatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15)
        ])
        userAvatarImageView.layer.cornerRadius = 50
        userAvatarImageView.clipsToBounds = true
    }
    
    private func setupCountLabels() {
        contentView.addSubview(publicationCountLabel)
        publicationCountLabel.frame = CGRectMake(130, 25, 80, 50)
        
        contentView.addSubview(followersCountLabel)
        followersCountLabel.frame = CGRectMake(220, 25, 80, 50)
        
        contentView.addSubview(followingCountLabel)
        followingCountLabel.frame = CGRectMake(305, 25, 80, 50)
        
        func setupCountLabelProperties(_ countLabel: UILabel) {
            countLabel.numberOfLines = 2
            countLabel.textAlignment = .center
            countLabel.lineBreakMode = .byWordWrapping
            countLabel.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        }
        
        let countLabels = [publicationCountLabel, followersCountLabel, followingCountLabel]
        for countLabel in countLabels {
            setupCountLabelProperties(countLabel)
        }
    }
    
    private func setupBioLabels() {
        setupNameLabel()
        setupSignatureLabel()
        setupCommonSubscriptionsLabel()
        
        func setupNameLabel() {
            contentView.addSubview(nameLabel)
            nameLabel.frame = CGRectMake(15, 125, 200, 20)
            nameLabel.font = UIFont.systemFont(ofSize: 16, weight: .heavy)
            nameLabel.textColor = .white
        }
        
        func setupSignatureLabel() {
            contentView.addSubview(signatureLabel)
            signatureLabel.frame = CGRectMake(15, 145, 400, 20)
            signatureLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
            signatureLabel.textColor = .white
            signatureLabel.numberOfLines = 2
        }
        
        func setupCommonSubscriptionsLabel() {
            contentView.addSubview(commonSubscriptionsLabel)
            commonSubscriptionsLabel.frame = CGRectMake(15, 165, 300, 20)
            commonSubscriptionsLabel.font = UIFont.systemFont(ofSize: 16, weight: .heavy)
            commonSubscriptionsLabel.textColor = .white
            commonSubscriptionsLabel.numberOfLines = 2
            commonSubscriptionsLabel.lineBreakMode = .byWordWrapping
        }
    }
    
    private func setupButtons() {
        setupSubscribeButton()
        setupMessageButton()
        setupInterestingUsersButton()

        func setupSubscribeButton() {
            let subscribeButton = UIButton()
            contentView.addSubview(subscribeButton)
            subscribeButton.setAttributedTitle(NSAttributedString(string: "Подписаться", attributes: [.font: UIFont.systemFont(ofSize: 15, weight: .bold), .foregroundColor: UIColor.white]), for: .normal)
            subscribeButton.frame = CGRectMake(15, 200, 160, 35)
            subscribeButton.backgroundColor = .systemBlue
            subscribeButton.layer.cornerRadius = 10
            subscribeButton.clipsToBounds = true
        }
        
        func setupMessageButton() {
            let messageButton = UIButton()
            contentView.addSubview(messageButton)
            messageButton.setAttributedTitle(NSAttributedString(string: "Написать", attributes: [.font: UIFont.systemFont(ofSize: 15, weight: .bold), .foregroundColor: UIColor.white]), for: .normal)
            messageButton.frame = CGRectMake(185, 200, 160, 35)
            messageButton.backgroundColor = .darkGray
            messageButton.layer.cornerRadius = 10
            messageButton.clipsToBounds = true
        }
        
        func setupInterestingUsersButton() {
            let interestingUsersButton = UIButton()
            contentView.addSubview(interestingUsersButton)
            interestingUsersButton.frame = CGRectMake(350, 200, 35, 35)
            interestingUsersButton.setImage(UIImage(systemName: "person.badge.plus"), for: .normal)
            interestingUsersButton.backgroundColor = .darkGray
            interestingUsersButton.tintColor = .white
            interestingUsersButton.layer.cornerRadius = 10
            interestingUsersButton.clipsToBounds = true
        }
    }
    
    func configure(user: User) {
        userAvatarImageView.image = UIImage(named: user.avatar)
        
        let countLabels = [publicationCountLabel, followersCountLabel, followingCountLabel]
        let informationForLabels = [String(user.publications.count), user.followersCount, user.followingCount]
        for index in 0...2 {
            let attributedString = NSMutableAttributedString(string: informationForLabels[index] + " " + texts[index])
            attributedString.addAttributes(
                [.font: UIFont.systemFont(ofSize: 19, weight: .bold)],
                range: NSMakeRange(0, informationForLabels[index].count))
            countLabels[index].attributedText = attributedString
        }
        nameLabel.text = user.name
        signatureLabel.text = user.signature
        
        let attributedString = NSMutableAttributedString(string: texts[3] + " " + user.commonFollowers)
        attributedString.addAttributes(
            [.font: UIFont.systemFont(ofSize: 16, weight: .medium)],
            range: NSMakeRange(0, texts[3].count))
        commonSubscriptionsLabel.attributedText = attributedString
        
    }
}
