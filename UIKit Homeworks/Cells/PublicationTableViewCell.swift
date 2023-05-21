//
//  PostTableViewCell.swift
//  UIKit Homeworks
//
//  Created by nastasya on 14.05.2023.
//

import UIKit

final class PublicationTableViewCell: UITableViewCell {
    
    private let userNameLabel = UILabel()
    private let userAvatarImageView = UIImageView()
    private let likesCountLabel = UILabel()
    private let signatureLabel = UILabel()
    private let publicationScrollView = UIScrollView()
    private let pageControl = UIPageControl()
    private let commentTextField = UITextField()
    private let dateLabel = UILabel()
    
    private var photosImageViews = [UIImageView]()
    private var photosCount = 10

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUserNameLabel()
        setupUserAvatarImageView()
        setupPublicationScrollView()
        setupButtons()
        setupLikesCountLabel()
        setupSignatureLabel()
        addCommentTextField()
        setupDateLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        updatePublicationScrollViewDimensions()
    }
    
    private func setupUserNameLabel() {
        userNameLabel.frame = CGRectMake(55, 18, 100, 20)
        userNameLabel.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        userNameLabel.textColor = .white
        contentView.addSubview(userNameLabel)
    }
    
    private func setupUserAvatarImageView() {
        userAvatarImageView.frame = CGRectMake(10, 10, 35, 35)
        userAvatarImageView.layer.cornerRadius = userAvatarImageView.frame.width / 2
        userAvatarImageView.clipsToBounds = true
        contentView.addSubview(userAvatarImageView)
    }
    
    private func updatePublicationScrollViewDimensions() {
        publicationScrollView.frame = CGRectMake(0, 55, contentView.bounds.width, contentView.bounds.width)
        let dimensionPerPhotoInPublication = contentView.bounds.width
        publicationScrollView.contentSize = CGSize(
            width: dimensionPerPhotoInPublication * CGFloat(photosCount),
            height: dimensionPerPhotoInPublication
        )
        for index in 0...photosCount {
            let imageViewWidth = publicationScrollView.contentSize.width / CGFloat(photosCount)
            photosImageViews[index].frame = CGRect(
                x: CGFloat(index) * imageViewWidth,
                y: 0,
                width: imageViewWidth,
                height: publicationScrollView.bounds.height
            )
        }
        
        pageControl.numberOfPages = photosCount
        if photosCount > 1 {
            setupPageControl()
            if photosCount > 5 {
                pageControl.numberOfPages = 5
            }
        }
    }
    
    private func setupPublicationScrollView() {
        publicationScrollView.isPagingEnabled = true
        publicationScrollView.showsHorizontalScrollIndicator = false
        publicationScrollView.delegate = self
        contentView.addSubview(publicationScrollView)

        for _ in 0...photosCount {
            let photoImageView = UIImageView()
            photoImageView.frame = CGRect(
                x: 0,
                y: 0,
                width: publicationScrollView.bounds.width / CGFloat(photosCount),
                height: publicationScrollView.bounds.height
            )
            photoImageView.contentMode = .scaleAspectFit
            photosImageViews.append(photoImageView)
            publicationScrollView.addSubview(photoImageView)
        }
    }
    
    private func setupPageControl() {
        pageControl.frame = CGRectMake(0, 470, 180, 10)
        pageControl.center.x = contentView.center.x
        pageControl.pageIndicatorTintColor = .darkGray
        pageControl.currentPageIndicatorTintColor = .systemBlue
        contentView.addSubview(pageControl)
    }
    
    private func setupButtons() {
        setupNotificationButton()
        setupLikeButton()
        setupCommentButton()
        setupSendButton()
        setupFavouritesButton()
        
        func setupNotificationButton() {
            let notificationButton = UIButton()
            notificationButton.frame = CGRectMake(340, 5, 50, 50)
            notificationButton.setImage(
                UIImage(systemName: "ellipsis")?.withTintColor(.white, renderingMode: .alwaysOriginal),
                for: .normal
            )
            contentView.addSubview(notificationButton)
        }
        
        func setupLikeButton() {
            let likeButton = UIButton()
            likeButton.frame = CGRectMake(15, 460, 35, 35)
            likeButton.setImage(
                UIImage(systemName: "heart.fill")?.withTintColor(.systemRed, renderingMode: .alwaysOriginal),
                for: .normal
            )
            likeButton.contentVerticalAlignment = .fill
            likeButton.contentHorizontalAlignment = .fill
            likeButton.imageEdgeInsets = UIEdgeInsets(top: 5, left: 0, bottom: 2, right: 0)
            contentView.addSubview(likeButton)
        }
        
        func setupCommentButton() {
            let commentButton = UIButton()
            commentButton.frame = CGRectMake(60, 460, 35, 35)
            commentButton.setImage(
                UIImage(systemName: "message")?.withTintColor(.white, renderingMode: .alwaysOriginal),
                for: .normal
            )
            commentButton.contentVerticalAlignment = .fill
            commentButton.contentHorizontalAlignment = .fill
            commentButton.imageEdgeInsets = UIEdgeInsets(top: 4, left: 2, bottom: 4, right: 2)
            contentView.addSubview(commentButton)
        }
        
        func setupSendButton() {
            let sendButton = UIButton()
            sendButton.frame = CGRectMake(105, 460, 35, 35)
            sendButton.setImage(
                UIImage(systemName: "paperplane")?.withTintColor(.white, renderingMode: .alwaysOriginal),
                for: .normal
            )
            sendButton.contentVerticalAlignment = .fill
            sendButton.contentHorizontalAlignment = .fill
            sendButton.imageEdgeInsets = UIEdgeInsets(top: 4, left: 2, bottom: 4, right: 2)
            contentView.addSubview(sendButton)
        }
        
        func setupFavouritesButton() {
            let favouritesButton = UIButton()
            favouritesButton.frame = CGRectMake(350, 460, 35, 35)
            favouritesButton.setImage(
                UIImage(systemName: "bookmark")?.withTintColor(.white, renderingMode: .alwaysOriginal),
                for: .normal
            )
            favouritesButton.contentVerticalAlignment = .fill
            favouritesButton.contentHorizontalAlignment = .fill
            favouritesButton.imageEdgeInsets = UIEdgeInsets(top: 4, left: 2, bottom: 4, right: 2)
            contentView.addSubview(favouritesButton)
        }
    }
    
    private func setupLikesCountLabel() {
        likesCountLabel.frame = CGRectMake(15, 505, 200, 20)
        likesCountLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        likesCountLabel.textColor = .white
        contentView.addSubview(likesCountLabel)
    }
    
    private func setupSignatureLabel() {
        signatureLabel.frame = CGRectMake(15, 530, 400, 20)
        signatureLabel.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        signatureLabel.textColor = .white
        contentView.addSubview(signatureLabel)
    }
    
    private func addCommentTextField() {
        let commentButton = UIButton()
        commentButton.frame = CGRectMake(15, 550, 200, 20)
        commentButton.setAttributedTitle(
            NSAttributedString(string: "Посмотреть комментарий",
            attributes: [.font: UIFont.systemFont(ofSize: 16,
            weight: .regular)]),
            for: .normal
        )
        commentButton.setTitleColor(.lightGray, for: .normal)
        contentView.addSubview(commentButton)
        commentButton.sizeToFit()
        
        let commentTextField = UITextField()
        commentTextField.frame = CGRectMake(15, 578, 350, 40)
        commentTextField.backgroundColor = .black
        commentTextField.attributedPlaceholder = NSAttributedString(
            string: "Добавьте комментарий...",
            attributes: [.foregroundColor: UIColor.lightGray]
        )
        let userPersonalAvatar = UIImageView()
        userPersonalAvatar.frame = CGRectMake(0, 0, 30, 30)
        userPersonalAvatar.image = UIImage(named: "userAvatar")
        userPersonalAvatar.layer.cornerRadius = userPersonalAvatar.frame.width / 2
        userPersonalAvatar.clipsToBounds = true
        let containerUserPersonalAvatarView = UIView()
        containerUserPersonalAvatarView.frame = CGRectMake(0, 0, 40, 30)
        containerUserPersonalAvatarView.addSubview(userPersonalAvatar)
        commentTextField.leftView = containerUserPersonalAvatarView
        commentTextField.leftViewMode = .always
        contentView.addSubview(commentTextField)
    }
    
    private func setupDateLabel() {
        dateLabel.frame = CGRectMake(15, 620, 200, 15)
        dateLabel.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        dateLabel.textColor = .lightGray
        contentView.addSubview(dateLabel)
    }
    
    func configure(with publication: Publication) {
        userNameLabel.text = publication.userName
        likesCountLabel.text = "Нравится: \(publication.likes)"
        let attributedString = NSMutableAttributedString(string: publication.userName + " " + publication.signature)
        attributedString.addAttributes(
            [.font: UIFont.systemFont(ofSize: 17,
            weight: .bold)],
            range: NSMakeRange(0,
            publication.userName.count)
        )
        signatureLabel.attributedText = attributedString
        userAvatarImageView.image = UIImage(named: publication.userName)
        photosCount = publication.namePhotos.count
        dateLabel.text = publication.date
        for index in 0..<photosCount {
            photosImageViews[index].image = UIImage(named: publication.namePhotos[index])
        }
    }
}

extension PublicationTableViewCell: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let dimensionPerPhotoInPublication = contentView.bounds.width
        pageControl.currentPage = Int(publicationScrollView.contentOffset.x / dimensionPerPhotoInPublication)
    }
}
