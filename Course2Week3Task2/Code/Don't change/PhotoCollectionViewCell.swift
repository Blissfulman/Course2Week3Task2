//
//  PhotoCollectionViewCell.swift
//  Course2Week3Task2
//
//  Copyright © 2018 e-Legion. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {

    struct Const {
        static let photoLabelHeight: CGFloat = 30.0
        static let photoLabelBackgroundAlpha: CGFloat = 0.7
    }
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var photoNameLabel: UILabel!
    
    // MARK: - Override
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        photoNameLabel.backgroundColor = UIColor.white.withAlphaComponent(Const.photoLabelBackgroundAlpha)
        photoImageView.contentMode = .scaleAspectFill
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        photoImageView.frame = bounds
        photoNameLabel.frame = CGRect(x: 0,
                                      y: frame.height - Const.photoLabelHeight,
                                      width: frame.width,
                                      height: Const.photoLabelHeight)
    }
    
    // MARK: - Public
    
    func configure(with photo: Photo) {
        photoImageView.image = photo.image
        
        photoNameLabel.text = photo.name
        photoNameLabel.sizeToFit()
        
        setNeedsLayout()
    }
}
