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
        
        //San Jacinto Tram Trailhead
        let sanJacintoTH = GMSMarker()
        sanJacintoTH.position = CLLocationCoordinate2D(latitude: 33.813169, longitude: -116.638612)
        sanJacintoTH.title = "Palm Springs Tramway"
        sanJacintoTH.icon = GMSMarker.markerImage(with: .black)

        //Snow Creek Trailhead
        let snowCreekTH = GMSMarker()
        snowCreekTH.position = CLLocationCoordinate2D(latitude: 33.898705, longitude: -116.679772)
        snowCreekTH.title = "Snow Creek Trailhead"
        snowCreekTH.icon = GMSMarker.markerImage(with: .black)
        
        let sanJacintoPath = GMSMutablePath()
        sanJacintoPath.add(CLLocationCoordinate2D(latitude: 33.813169, longitude: -116.638612))
        sanJacintoPath.add(CLLocationCoordinate2D(latitude: 33.812777, longitude: -116.643131))
        sanJacintoPath.add(CLLocationCoordinate2D(latitude: 33.810911, longitude: -116.650454))
        sanJacintoPath.add(CLLocationCoordinate2D(latitude: 33.807053, longitude: -116.654017))
        sanJacintoPath.add(CLLocationCoordinate2D(latitude: 33.802389, longitude: -116.658565))
        sanJacintoPath.add(CLLocationCoordinate2D(latitude: 33.803233, longitude: -116.668098))
        sanJacintoPath.add(CLLocationCoordinate2D(latitude: 33.800257, longitude: -116.673663))
        sanJacintoPath.add(CLLocationCoordinate2D(latitude: 33.807066, longitude: -116.674223))
        sanJacintoPath.add(CLLocationCoordinate2D(latitude: 33.809758, longitude: -116.677387))
        sanJacintoPath.add(CLLocationCoordinate2D(latitude: 33.814823, longitude: -116.674842))
        sanJacintoPath.add(CLLocationCoordinate2D(latitude: 33.811873, longitude: -116.678853))
        sanJacintoPath.add(CLLocationCoordinate2D(latitude: 33.814957, longitude: -116.677273))
        let sanJacintoLine = GMSPolyline(path: sanJacintoPath)
        sanJacintoLine.strokeWidth = 3
        sanJacintoLine.strokeColor = .red
        let sanJacintoMarker = GMSMarker()
        sanJacintoMarker.position = CLLocationCoordinate2D(latitude: 33.814957, longitude: -116.677273)
        sanJacintoMarker.title = "San Jacinto"
        sanJacintoMarker.snippet = "East Face"
        sanJacintoMarker.icon = GMSMarker.markerImage(with: .blue)
        let sanJTram = Tour(title: "San Jacinto: East Face", difficulty: 2, path: sanJacintoLine, id: "33.814957 -116.677273", imageURL: [#imageLiteral(resourceName: "sanj2"),#imageLiteral(resourceName: "jeanpeak"),#imageLiteral(resourceName: "sanj3")], distance: 5.5, description: "Along with San Gorgonio and San Antonio (Mt Baldy), San Jacinto is a giant by Socal standards, even U.S. standards. From the base of Coachella Valley to the summit, San Jacinto rises over 11,000 feet. The good news is that there's a tram that will take you about 80% of the way there. The terrain varies from open bowls and well spaced trees up high to tight, treed canyons below. Since this is east facing it holds soft snow well in early/mid winter and softens nicely during corn cycles in spring. From the Palm Springs Aerial Tramway, take the Round Valley trail up through Round Valley. From here, you can either continue heading west and up to Jean Peak (10,670 feet) or traverse north for about a mile or so and then up to the San Jacinto summit (10,833 feet). A GPS is recommended as it is easy to get disoriented on this mountain. ", marker: sanJacintoMarker, aspect: "E", base: "8,500 ft", trailhead: sanJacintoTH, summit: "10,800 ft", angle: "25-30")
        
        let snowCreekPath = GMSMutablePath()
        snowCreekPath.add(CLLocationCoordinate2D(latitude: 33.898705, longitude: -116.679772))
        snowCreekPath.add(CLLocationCoordinate2D(latitude: 33.889856, longitude: -116.667558))
        snowCreekPath.add(CLLocationCoordinate2D(latitude: 33.876617, longitude: -116.660691))
        snowCreekPath.add(CLLocationCoordinate2D(latitude: 33.867031, longitude: -116.659710))
        snowCreekPath.add(CLLocationCoordinate2D(latitude: 33.864940, longitude: -116.658947))
        snowCreekPath.add(CLLocationCoordinate2D(latitude: 33.848338, longitude: -116.668714))
        snowCreekPath.add(CLLocationCoordinate2D(latitude: 33.838387, longitude: -116.675962))
        snowCreekPath.add(CLLocationCoordinate2D(latitude: 33.832746, longitude: -116.678100))
        snowCreekPath.add(CLLocationCoordinate2D(latitude: 33.829154, longitude: -116.678306))
        snowCreekPath.add(CLLocationCoordinate2D(latitude: 33.827295, longitude: -116.677794))
        snowCreekPath.add(CLLocationCoordinate2D(latitude: 33.824613, longitude: -116.677588))
        snowCreekPath.add(CLLocationCoordinate2D(latitude: 33.823428, longitude: -116.677259))
        snowCreekPath.add(CLLocationCoordinate2D(latitude: 33.820956, longitude: -116.679014))
        snowCreekPath.add(CLLocationCoordinate2D(latitude: 33.818889, longitude: -116.678740))
        snowCreekPath.add(CLLocationCoordinate2D(latitude: 33.814693, longitude: -116.679236))
        let snowCreekLine = GMSPolyline(path: snowCreekPath)
        snowCreekLine.strokeWidth = 3
        snowCreekLine.strokeColor = .red
        let snowCreekMarker = GMSMarker()
        snowCreekMarker.position = CLLocationCoordinate2D(latitude: 33.814693, longitude: -116.679236)
        snowCreekMarker.title = "San Jacinto"
        snowCreekMarker.snippet = "Snow Creek"
        snowCreekMarker.icon = GMSMarker.markerImage(with: .blue)
        let snowCreek = Tour(title: "San Jacinto: Snow Creek", difficulty: 3, path: snowCreekLine, id: "33.814693 -116.679236", imageURL: [#imageLiteral(resourceName: "snowcrk"), #imageLiteral(resourceName: "snowcrk2")], distance: 12, description: "The most extreme ascent/descent in Southern California, Snow Creek is a essentially a giant funnel down the north face of San Jacinto. This couloir is very steep and sustained and avalanches frequently. With nearly 10k vert to reach the summit, arduous bushwhacking, and large waterfalls which may require ropes, Snow Creek doesn't get climbed that often, let aloned skied. The crux of the route, the Chockstone, is only skiable during the best of seasons, such as when Andy Lewicky skied it in the El Nino year of 2010 (check out his report on SierraDescents.com). Even during good seasons, there will be no shortage of bushwhacking and rockclimbing as this route starts at nearly 1,000 feet on the desert floor. The standard approach goes through DWA land where trespassing is not allowed but this can be avoided by traversing around as the route on the map shows. Park at the utility station (33.898705, -116.679772) and head east towards the ridge on east side of Falls Creek. Climb this ridge until 4,300 feet and then traverse underneath it until you reach what is known as the Isthmus. From here, climb straight up and enter the couloir at ~5,500 feet. Follow the couloir to the summit. Alternatively, some skiers have used two cars and approached via the Palm Springs Aerial Tramway and skied down the chute to the second car at the utility station. Another approach is using the tram for both entry and exit, but only skiing the chute as far as your liking and hiking back up to the summit.", marker: snowCreekMarker, aspect: "N", base: "1,200 ft", trailhead: snowCreekTH, summit: "10,850 ft", angle: "40-45")
        
        tempTours.append(sanJTram)
        tempTours.append(snowCreek)
        let sorted = tempTours.sorted(by: { $0.tourTitle < $1.tourTitle })
        return completion(sorted)
    }
}
