//
//  PublicationsHeaderTableViewCell.swift
//  UIKit Homeworks
//
//  Created by nastasya on 21.06.2023.
//

import UIKit

final class PublicationsHeaderTableViewCell: UITableViewCell {

    private let segmentedControl = UISegmentedControl()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupPublicationsSegmentedControl()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        updatePublicationsSegmentedControlDimension()
    }
    
    private func setupPublicationsSegmentedControl() {
        segmentedControl.backgroundColor = .clear
        segmentedControl.tintColor = .gray
        segmentedControl.insertSegment(with: UIImage(systemName: "tablecells"), at: 0, animated: true)
        segmentedControl.insertSegment(with: UIImage(systemName: "play.square.stack"), at: 1, animated: true)
        segmentedControl.insertSegment(with: UIImage(systemName: "person.crop.square"), at: 2, animated: true)
        segmentedControl.selectedSegmentIndex = 0
        contentView.addSubview(segmentedControl)
    }
    
    private func updatePublicationsSegmentedControlDimension() {
        segmentedControl.frame = contentView.bounds
    }
    
    private func createCustomSegmentedControl() {
        
    }
    
}
