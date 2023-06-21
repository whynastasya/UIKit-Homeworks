//
//  NotificationTableViewCell.swift
//  UIKit Homeworks
//
//  Created by nastasya on 21.05.2023.
//

import UIKit

final class LikeNotificationTableViewCell: UITableViewCell {
    
    private let userAvatar = UIImageView()
    private let notificationTextLabel = UILabel()
    private let likedPublicationImageView = UIImageView()
    private let text = " нравится ваша публикация. "

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUserAvatar()
        setupNotificationTextLabel()
        setupLikedPublicationImageView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUserAvatar() {
        contentView.addSubview(userAvatar)
        userAvatar.layer.cornerRadius = Constants.userAvatarDimension / 2
        userAvatar.clipsToBounds = true
        userAvatar.contentMode = .scaleAspectFit
        userAvatar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userAvatar.widthAnchor.constraint(equalToConstant: Constants.userAvatarDimension),
            userAvatar.heightAnchor.constraint(equalToConstant: Constants.userAvatarDimension),
            userAvatar.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            userAvatar.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    private func setupNotificationTextLabel() {
        contentView.addSubview(notificationTextLabel)
        notificationTextLabel.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        notificationTextLabel.numberOfLines = 2
        notificationTextLabel.lineBreakMode = .byWordWrapping
        notificationTextLabel.textColor = .white
        notificationTextLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            notificationTextLabel.widthAnchor.constraint(equalToConstant: Constants.notificationTextWidth),
            notificationTextLabel.heightAnchor.constraint(equalToConstant: Constants.notificationTextHeight),
            notificationTextLabel.leftAnchor.constraint(equalTo: userAvatar.rightAnchor, constant: 15),
            notificationTextLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    private func setupLikedPublicationImageView() {
        contentView.addSubview(likedPublicationImageView)
        likedPublicationImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            likedPublicationImageView.widthAnchor.constraint(equalToConstant: Constants.publicationDimension),
            likedPublicationImageView.heightAnchor.constraint(equalToConstant: Constants.publicationDimension),
            likedPublicationImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15),
            likedPublicationImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    func configure(_ notification: Notification) {
        userAvatar.image = UIImage(named: notification.user.avatar)
        let attributedString = NSMutableAttributedString(string: notification.user.userName + text + notification.date)
        attributedString.addAttributes(
            [.font: UIFont.systemFont(ofSize: 16, weight: .bold)],
            range: NSMakeRange(0, notification.user.userName.count)
        )
        attributedString.addAttributes(
            [.foregroundColor: UIColor.lightGray, .font: UIFont.systemFont(ofSize: 14, weight: .light)],
            range: NSMakeRange(notification.user.userName.count + text.count, notification.date.count)
        )
        notificationTextLabel.attributedText = attributedString
        likedPublicationImageView.image = UIImage(named: notification.publicationName)
    }
}
