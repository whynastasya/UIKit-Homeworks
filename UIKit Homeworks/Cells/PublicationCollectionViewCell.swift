//
//  PublicationCollectionViewCell.swift
//  UIKit Homeworks
//
//  Created by nastasya on 17.06.2023.
//

import UIKit

final class PublicationCollectionViewCell: UICollectionViewCell {
    
    private let photoImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupPhotoImageView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupPhotoImageView() {
        photoImageView.frame = CGRectMake(0, 0, Constants.userPublicationDimension, Constants.userPublicationDimension)
        photoImageView.contentMode = .scaleAspectFit
        photoImageView.clipsToBounds = true
        photoImageView.layer.masksToBounds = true
        contentView.addSubview(photoImageView)
    }
    
    func configure(with publications: [Publication]) {
        for publication in publications {
            photoImageView.image = UIImage(named: publication.namePhotos[0])
        }
    }
}
