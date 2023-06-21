//
//  StoriesTableViewCell.swift
//  UIKit Homeworks
//
//  Created by nastasya on 21.06.2023.
//

import UIKit

class StoriesTableViewCell: UITableViewCell {
    
    private let storiesScrollView = UIScrollView()
    var usersWithStoriesCount = 50
    var storiesPreviewImageViews = [UIImageView]()
    var storiesNameLabels = [UILabel]()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupStoriesScrollView()
        updateLayoutStoriesView()
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
    
    func createStoriesView() -> UIView {
        let storiesView = UIView()
        storiesView.layer.cornerRadius = Constants.storiesDimensions / 2
        storiesView.backgroundColor = .darkGray.withAlphaComponent(0.4)
        
        return storiesView
    }
    
    func updateLayoutStoriesView() {
        for index in 0..<usersWithStoriesCount {
            let precedingStoriesWidths = CGFloat(index) * Constants.storiesDimensions
            let precedingStoriesOffsets = CGFloat(index + 1) * Constants.storiesXOffset
            let currentViewOffset =  precedingStoriesWidths + precedingStoriesOffsets
            let storiesView = createStoriesView()
            storiesView.frame = CGRectMake(
                currentViewOffset,
                10,
                Constants.storiesDimensions,
                Constants.storiesDimensions
            )
            storiesScrollView.addSubview(storiesView)
            
            let storyPreviewImageView = createStoryPreviewImageView()
            storiesPreviewImageViews.append(storyPreviewImageView)
            storiesView.addSubview(storyPreviewImageView)
            
            let storyNameLabel = createStoryNameLabel()
            storiesView.addSubview(storyNameLabel)
            storiesNameLabels.append(storyNameLabel)
            storyNameLabel.topAnchor.constraint(equalTo: storiesView.bottomAnchor, constant: 1).isActive = true
            storyNameLabel.centerXAnchor.constraint(equalTo: storiesView.centerXAnchor, constant: 1).isActive = true
        }
    }
    
    private func createStoryPreviewImageView() -> UIImageView {
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
    
    private func createStoryNameLabel() -> UILabel {
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
    
    func configure(with stories: [Story]) {
        usersWithStoriesCount = stories.count
        for index in 0..<usersWithStoriesCount {
            storiesPreviewImageViews[index].image = UIImage(named: stories[index].preview)
            storiesNameLabels[index].text = stories[index].name
        }
    }
}
