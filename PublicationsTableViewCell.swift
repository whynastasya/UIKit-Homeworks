//
//  PublicationsTableViewCell.swift
//  UIKit Homeworks
//
//  Created by nastasya on 22.05.2023.
//

import UIKit

final class PublicationsTableViewCell: UITableViewCell {

    private let publicationsCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    private let flowLayout = UICollectionViewFlowLayout()
    var publications = [Publication]()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupPublicationsCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        updatePublicationsCollectionViewDimmension()
    }
    
    private func setupPublicationsCollectionView() {
        setupFlowLayout()
        publicationsCollectionView.collectionViewLayout = flowLayout
        publicationsCollectionView.showsVerticalScrollIndicator = false
        publicationsCollectionView.dataSource = self
        publicationsCollectionView.delegate = self
        publicationsCollectionView.register(PublicationCollectionViewCell.self, forCellWithReuseIdentifier: "PublicationCell")
        publicationsCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        contentView.addSubview(publicationsCollectionView)
    }
    
    private func updatePublicationsCollectionViewDimmension() {
        publicationsCollectionView.frame = contentView.bounds
    }
    
    private func setupFlowLayout() {
        flowLayout.itemSize = CGSize(width: Constants.userPublicationDimension, height: Constants.userPublicationDimension)
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.sectionInset = UIEdgeInsets(top: 1, left: 0, bottom: 1, right: 0)
    }
}

extension PublicationsTableViewCell: UICollectionViewDelegate {

}

extension PublicationsTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        publications.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PublicationCell", for: indexPath) as! PublicationCollectionViewCell
        cell.configure(with: publications)
        return cell
    }
}

extension PublicationTableViewCell: UICollectionViewDelegateFlowLayout {

}
