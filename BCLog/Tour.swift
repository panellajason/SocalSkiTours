//
//  Tour.swift
//  BCLog
//
//  Created by Jason Panella on 5/17/21.
//  Copyright © 2021 Jason Panella. All rights reserved.
//

import Foundation
import UIKit
import GoogleMaps

class Tour {
    var tourID: String
    var tourPath: GMSMutablePath
    var tourTitle: String
    var tourImages = [UIImage]()
    var tourDescription: String
    var tourAngle: String
    var tourDistance: String
    var tourAspect: String
    var tourBase: String
    var tourTrailhead: String
    var tourSummitElevation: String

    init(path: GMSMutablePath, id: String, imageURL: [UIImage], distance: String, description: String, title: String, aspect: String, base: String, trailhead: String, summit: String, angle: String) {
        
        self.tourID = id
        self.tourPath = path
        self.tourAngle = angle
        self.tourTitle = title
        self.tourImages = imageURL
        self.tourDistance = distance
        self.tourDescription = description
        self.tourAspect = aspect
        self.tourBase = base
        self.tourTrailhead = trailhead
        self.tourSummitElevation = summit
    }
}
