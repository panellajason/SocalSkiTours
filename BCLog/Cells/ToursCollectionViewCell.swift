//
//  ToursCollectionViewCell.swift
//  BCLog
//
//  Created by Jason Panella on 5/25/21.
//  Copyright © 2021 Jason Panella. All rights reserved.
//

import UIKit

class ToursCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var title: UILabel!
    static let identifier = "ToursCollectionViewCell"
    
    func configure(with tourTitle: String, tourImage: UIImage) {
        title.text = tourTitle
        imageView.image = tourImage
    }
    
}
