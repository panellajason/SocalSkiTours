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
    var tourTitle: String
    var tourPath: GMSPolyline
    var tourMarker: GMSMarker
    var tourImages = [UIImage]()
    var tourDescription: String
    var tourAngle: String
    var tourDistance: String
    var tourAspect: String
    var tourBaseElevation: String
    var tourTrailhead: GMSMarker
    var tourSummitElevation: String

    init(title: String, path: GMSPolyline, id: String, imageURL: [UIImage], distance: String, description: String, marker: GMSMarker, aspect: String, base: String, trailhead: GMSMarker, summit: String, angle: String) {
        
        self.tourID = id
        self.tourTitle = title
        self.tourPath = path
        self.tourAngle = angle
        self.tourMarker = marker
        self.tourImages = imageURL
        self.tourDistance = distance
        self.tourDescription = description
        self.tourAspect = aspect
        self.tourBaseElevation = base
        self.tourTrailhead = trailhead
        self.tourSummitElevation = summit
    }
}
