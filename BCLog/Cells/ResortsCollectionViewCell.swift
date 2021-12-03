//
//  ResortsCollectionViewCell.swift
//  BCLog
//
//  Created by Jason Panella on 12/2/21.
//  Copyright © 2021 Jason Panella. All rights reserved.
//

import UIKit

class ResortsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var snowAmount: UILabel!
    @IBOutlet weak var title: UILabel!
    static let identifier = "ResortsCollectionViewCell"
    
    func configure(with resort: Resort) {
        snowAmount.text = " " + resort.fiveDaySnowTotal + "\""
        if(resort.resort.contains("Mammoth")) {
            title.text = "Mammoth"
        } else {
            title.text = resort.resort
        }
        
    }
}
