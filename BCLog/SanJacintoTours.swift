//
//  SanJacintoTours.swift
//  BCLog
//
//  Created by Jason Panella on 7/3/21.
//  Copyright © 2021 Jason Panella. All rights reserved.
//

import Foundation
import GoogleMaps

class SanJacintoTours {
    
    static func loadTours(completion:@escaping (_ tours:[Tour])->()) {
        var tempTours = [Tour]()
        
        let tramPath = GMSMutablePath()
        tramPath.add(CLLocationCoordinate2D(latitude: 34.373250, longitude: -117.751986))
        tramPath.add(CLLocationCoordinate2D(latitude: 34.372731, longitude: -117.755967))
        tramPath.add(CLLocationCoordinate2D(latitude: 34.371467, longitude: -117.754773))
        tramPath.add(CLLocationCoordinate2D(latitude: 34.368462, longitude: -117.758920))
        tramPath.add(CLLocationCoordinate2D(latitude: 34.361183, longitude: -117.762169))
        let sanJTram = Tour(path: tramPath, id: "34.361183 -117.762169", imageURL: [#imageLiteral(resourceName: "sanj2"), #imageLiteral(resourceName: "sanj3")], distance: "5.5 miles", description: "Along with San Gorgonio and San Antonio (Mt Baldy), San Jacinto is a giant by Socal standards and rises from just above sea level to 10,830 feet. The good news is that there's a tram that will take you about 80% of the way there; it's like getting a ski pass but you still have 2k+ vert to hike. The terrain varies from open bowls and well spaced trees up top to tight, treed canyons down below. Since this is east facing it holds soft snow well early/mid winter and softens nicely during corn cycles in spring. A GPS is nice to have for this mountain as it is easy to get disoriented in the trees. From the Palm Springs Aerial Tramway, take the trail up through Round Valley and up to the summit directly west for a Round Valley descent (10,600 feet). For the San Jacinto East Face descent (10,800 feet), traverse north for about one mile and then up to the San Jacinto summit.", title: "San Jacinto: East Face", aspect: "E", base: "8,500 ft", trailhead: "Palm Springs Tramway", summit: "10,800 ft", angle: "20-30")
        
        let snowCrkPath = GMSMutablePath()
        snowCrkPath.add(CLLocationCoordinate2D(latitude: 34.373250, longitude: -117.751986))
        snowCrkPath.add(CLLocationCoordinate2D(latitude: 34.372731, longitude: -117.755967))
        snowCrkPath.add(CLLocationCoordinate2D(latitude: 34.371467, longitude: -117.754773))
        snowCrkPath.add(CLLocationCoordinate2D(latitude: 34.368462, longitude: -117.758920))
        snowCrkPath.add(CLLocationCoordinate2D(latitude: 34.361183, longitude: -117.762169))
        let snowCrk = Tour(path: snowCrkPath, id: "34.361183 -117.762169", imageURL: [#imageLiteral(resourceName: "sanj2"), #imageLiteral(resourceName: "sanj"), #imageLiteral(resourceName: "sanj3")], distance: "5.5 miles", description: "The forbidden side of San Jacinto", title: "San Jacinto: Snow Creek", aspect: "N", base: "8,500 ft", trailhead: "Palm Springs Tramway", summit: "10,800 ft", angle: "40-45")
        
    
        //--------------------------------------
        //dropdown menu for filter
        //personal location on map
        //switch to satellite view on map
        //help button
        
        tempTours.append(sanJTram)
        tempTours.append(snowCrk)

        return completion(tempTours)
    }
}
