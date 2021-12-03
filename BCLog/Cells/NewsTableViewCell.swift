//
//  NewsTableViewCell.swift
//  BCLog
//
//  Created by Jason Panella on 12/1/21.
//  Copyright © 2021 Jason Panella. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    static let identifier = "NewsTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
        
    func configure(with article: Article) {
        
        titleLabel.text = article.title
        
        if(article.source == "Snow Brains") {
            imageview.image = UIImage(named: "snowbrains")
        } else if (article.source == "Open Snow") {
            imageview.image = UIImage(named: "opensnow")
        } else {
            imageview.image = UIImage(named: "powderchasers")
        }
        
    }

}
