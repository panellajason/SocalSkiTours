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

    weak var tour:Tour?
    
    func configure(with tour: Tour) {
        
        self.tour = tour
        self.title.text = tour.tourTitle
        
        self.imageView.image = nil
        self.imageView.image = tour.tourImages[0]
        
    }
}
