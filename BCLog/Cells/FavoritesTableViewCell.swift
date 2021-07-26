//
//  FavoritesTableViewCell.swift
//  BCLog
//
//  Created by Jason Panella on 6/7/21.
//  Copyright © 2021 Jason Panella. All rights reserved.
//

import UIKit

class FavoritesTableViewCell: UITableViewCell {

    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var view: UIView!
    static let identifier = "FavoritesTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
        
    func configure(with tour: Tour) {
        imageview.image = tour.tourImages[0]
        titleLabel.text = tour.tourTitle
    }
}
