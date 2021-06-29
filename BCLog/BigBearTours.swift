//
//  TourService.swift
//  BCLog
//
//  Created by Jason Panella on 5/29/21.
//  Copyright © 2021 Jason Panella. All rights reserved.
//

import Foundation
import Firebase
import GoogleMaps

class BigBearTours {
        
    static func loadTours(completion:@escaping (_ tours:[Tour])->()) {
        var tempTours = [Tour]()
        
        let sfPath = GMSMutablePath()
        sfPath.add(CLLocationCoordinate2D(latitude: 34.161167, longitude: -116.871683))
        sfPath.add(CLLocationCoordinate2D(latitude: 34.158697, longitude: -116.871030))
        sfPath.add(CLLocationCoordinate2D(latitude: 34.157153, longitude: -116.867553))
        sfPath.add(CLLocationCoordinate2D(latitude: 34.155129, longitude: -116.868068))
        sfPath.add(CLLocationCoordinate2D(latitude: 34.147831, longitude: -116.855580))
        sfPath.add(CLLocationCoordinate2D(latitude: 34.130464, longitude: -116.843415))
        sfPath.add(CLLocationCoordinate2D(latitude: 34.120446, longitude: -116.842900))
        sfPath.add(CLLocationCoordinate2D(latitude: 34.116077, longitude: -116.842706))
        sfPath.add(CLLocationCoordinate2D(latitude: 34.110304, longitude: -116.843963))
        sfPath.add(CLLocationCoordinate2D(latitude: 34.107230, longitude: -116.850109))
        sfPath.add(CLLocationCoordinate2D(latitude: 34.103873, longitude: -116.850108))
        sfPath.add(CLLocationCoordinate2D(latitude: 34.103435, longitude: -116.847386))
        let jepsonNW = Tour(path: sfPath, id: "34.103435 -116.847386", imageURL: [#imageLiteral(resourceName: "jepson_nw"), #imageLiteral(resourceName: "IMG_4364"), #imageLiteral(resourceName: "IMG_0673"), #imageLiteral(resourceName: "DDF34D9F-6ABB-4F2A-A1CE-3BB8D4CB6A4C"), #imageLiteral(resourceName: "IMG_1214"), #imageLiteral(resourceName: "IMG_1185")], distance: "6 miles", description: "Three classic chutes but many others to choose from on good years", title: "Jepson Peak: N Chutes", aspect: "N", base: "6,900 ft", trailhead: "South Fork Trailhead", summit: "11,200 ft", angle: "35-40")
        
        let nePath = sfPath.mutableCopy()
        (nePath as AnyObject).add(CLLocationCoordinate2D(latitude: 34.101618, longitude: -116.843024))
        let jepsonNE = Tour(path: nePath as! GMSMutablePath, id: "34.101618 -116.843024", imageURL: [#imageLiteral(resourceName: "jepson_ne"), #imageLiteral(resourceName: "IMG_1402"), #imageLiteral(resourceName: "IMG_0794"), #imageLiteral(resourceName: "IMG_0875"), #imageLiteral(resourceName: "IMG_1216")], distance: "6 miles", description: "Similar to the NW chutes but these get sun earlier and can be slightly more technical.", title: "Jepson Peak: NE Chutes", aspect: "NE", base: "6,900 ft", trailhead: "South Fork Trailhead", summit: "11,200 ft", angle: "35-40")
        
        let gorgPath = GMSMutablePath()
        gorgPath.add(CLLocationCoordinate2D(latitude: 34.161167, longitude: -116.871683))
        gorgPath.add(CLLocationCoordinate2D(latitude: 34.158697, longitude: -116.871030))
        gorgPath.add(CLLocationCoordinate2D(latitude: 34.157153, longitude: -116.867553))
        gorgPath.add(CLLocationCoordinate2D(latitude: 34.155129, longitude: -116.868068))
        gorgPath.add(CLLocationCoordinate2D(latitude: 34.147831, longitude: -116.855580))
        gorgPath.add(CLLocationCoordinate2D(latitude: 34.130464, longitude: -116.843415))
        gorgPath.add(CLLocationCoordinate2D(latitude: 34.120446, longitude: -116.842900))
        gorgPath.add(CLLocationCoordinate2D(latitude: 34.118907, longitude: -116.839350))
        gorgPath.add(CLLocationCoordinate2D(latitude: 34.108832, longitude: -116.838182))
        gorgPath.add(CLLocationCoordinate2D(latitude: 34.099683, longitude: -116.838692))
        let bigdraw = Tour(path: gorgPath, id: "34.099683 -116.838692", imageURL: [#imageLiteral(resourceName: "big_draw"), #imageLiteral(resourceName: "IMG_0913"), #imageLiteral(resourceName: "IMG_0058"), #imageLiteral(resourceName: "IMG_0878")], distance: "6 miles", description: "One of the most classic descents in socal, been ridden since the 30s", title: "San Gorgonio: The Big Draw", aspect: "N", base: "6,900 ft", trailhead: "South Fork Trailhead", summit: "11,200 ft", angle: "30-35")
        
        let nwPath = gorgPath.mutableCopy()
        (nwPath as AnyObject).add(CLLocationCoordinate2D(latitude: 34.099769, longitude: -116.836071))
        (nwPath as AnyObject).add(CLLocationCoordinate2D(latitude: 34.101406, longitude: -116.834642))
        let gorgNW = Tour(path: nwPath as! GMSMutablePath, id: "34.101406 -116.834642", imageURL: [#imageLiteral(resourceName: "IMG_8932"), #imageLiteral(resourceName: "gorg_nw"), #imageLiteral(resourceName: "nwchu"), #imageLiteral(resourceName: "IMG_1215")], distance: "6.5 miles", description: "Often overlooked for the more popular descents nearby, these chutes offer some steep lines which need a decent amount of snowfall to fill in.", title: "San Gorgonio: NW Chutes", aspect: "NW", base: "6,900 ft", trailhead: "South Fork Trailhead", summit: "11,200 ft", angle: "40-45")
        
        let nPath = (nwPath as AnyObject).mutableCopy()
        (nPath as AnyObject).add(CLLocationCoordinate2D(latitude: 34.101979, longitude: -116.830673))
        let gorgN = Tour(path: nPath as! GMSMutablePath, id: "34.101979 -116.830673", imageURL: [#imageLiteral(resourceName: "IMG_1436"), #imageLiteral(resourceName: "gorg_n"), #imageLiteral(resourceName: "IMG_9002"), #imageLiteral(resourceName: "gorg1")], distance: "6.5 miles", description: "The tallest mountain in SoCal and a moderate 2,000 ft descent.  Prone to slide during/after big storms.", title: "San Gorgonio: North Slope", aspect: "N", base: "6,900 ft", trailhead: "South Fork Trailhead", summit: "11,400 ft", angle: "30-35")
        
        let charPath = GMSMutablePath()
        charPath.add(CLLocationCoordinate2D(latitude: 34.161167, longitude: -116.871683))
        charPath.add(CLLocationCoordinate2D(latitude: 34.158697, longitude: -116.871030))
        charPath.add(CLLocationCoordinate2D(latitude: 34.157153, longitude: -116.867553))
        charPath.add(CLLocationCoordinate2D(latitude: 34.155129, longitude: -116.868068))
        charPath.add(CLLocationCoordinate2D(latitude: 34.147831, longitude: -116.855580))
        charPath.add(CLLocationCoordinate2D(latitude: 34.130464, longitude: -116.843415))
        charPath.add(CLLocationCoordinate2D(latitude: 34.120446, longitude: -116.842900))
        charPath.add(CLLocationCoordinate2D(latitude: 34.116077, longitude: -116.842706))
        charPath.add(CLLocationCoordinate2D(latitude: 34.114104, longitude: -116.851331))
        charPath.add(CLLocationCoordinate2D(latitude: 34.114789, longitude: -116.852401))
        let charDL = Tour(path: charPath, id: "34.114789 -116.852401", imageURL: [#imageLiteral(resourceName: "dl1"), #imageLiteral(resourceName: "dl2"), #imageLiteral(resourceName: "dl3")], distance: "5.5 miles", description: "A fun,  mellow gully which tends to be a catcher's mitt for snow. The steep, north facing trees above this run are known to slide.", title: "Charlton Peak: Dog Leg", aspect: "NE", base: "6,900 ft", trailhead: "South Fork Trailhead", summit: "10,800 ft", angle: "30")
        
        let charMPath = charPath.mutableCopy()
        (charMPath as AnyObject).add(CLLocationCoordinate2D(latitude: 34.116171, longitude: -116.853880))
        let charMain = Tour(path: charMPath as! GMSMutablePath, id: "34.116171 -116.853880", imageURL: [#imageLiteral(resourceName: "main0"), #imageLiteral(resourceName: "main3"), #imageLiteral(resourceName: "main2"), #imageLiteral(resourceName: "main5")], distance: "5.5 miles", description: "A 2,000ft+ descent down a somewhat steep gully which is prone to slide during/after big storms. Generally protected and high elevation so can hold soft snow well after a storm.", title: "Charlton Peak: Main Gully", aspect: "N", base: "6,900 ft", trailhead: "South Fork Trailhead", summit: "10,800 ft", angle: "30-35")

        let charDPath = (charMPath as AnyObject).mutableCopy()
        (charDPath as AnyObject).add(CLLocationCoordinate2D(latitude: 34.116468, longitude: -116.854930))
        let charDol = Tour(path: charDPath as! GMSMutablePath, id: "34.116468 -116.854930", imageURL: [#imageLiteral(resourceName: "dol4"), #imageLiteral(resourceName: "dol5"), #imageLiteral(resourceName: "IMG_1212"), #imageLiteral(resourceName: "dol1"), #imageLiteral(resourceName: "dol6"), #imageLiteral(resourceName: "dol3")], distance: "5.5 miles", description: "Somewhat hidden from the usual approach, this chute is a shorter alterntaive to Charlton's other descents. A bit difficult to find the line from the summit.", title: "Charlton Peak: Dollar Col", aspect: "NW", base: "6,900 ft", trailhead: "South Fork Trailhead", summit: "10,800 ft", angle: "30")
        
        let altPath = GMSMutablePath()
        altPath.add(CLLocationCoordinate2D(latitude: 34.161167, longitude: -116.871683))
        altPath.add(CLLocationCoordinate2D(latitude: 34.158697, longitude: -116.871030))
        altPath.add(CLLocationCoordinate2D(latitude: 34.157153, longitude: -116.867553))
        altPath.add(CLLocationCoordinate2D(latitude: 34.155129, longitude: -116.868068))
        altPath.add(CLLocationCoordinate2D(latitude: 34.147831, longitude: -116.855580))
        altPath.add(CLLocationCoordinate2D(latitude: 34.144195, longitude: -116.853840))
        altPath.add(CLLocationCoordinate2D(latitude: 34.136789, longitude: -116.858281))
        altPath.add(CLLocationCoordinate2D(latitude: 34.131813, longitude: -116.866294))
        let altoDiablo = Tour(path: altPath, id: "34.131813 -116.866294", imageURL: [#imageLiteral(resourceName: "alt2"), #imageLiteral(resourceName: "alt1"), #imageLiteral(resourceName: "alt4")], distance: "3.5 miles", description: "One of the closer descents along the South Fork trail, this avalanche path offers two moderate open pitches; the upper one being subject to windloading and some truly massive avalanches in the last decade; there aren't any trees left on the lower pitch for a reason. The upper pitch has some steep, short chutes that are great for lapping and practicing for more committing terrain. Follow the South Fork Trail for about 2 miles until the lower pitch comes into view, then follow the avy paths up to the summit. Alternatively, approach via the north facing trees for a safer ascent.", title: "Alto Diablo: Avy Path", aspect: "NE", base: "6,900 ft", trailhead: "South Fork Trailhead", summit: "10,200 ft", angle: "30")
        
        let altTPath = GMSMutablePath()
        altTPath.add(CLLocationCoordinate2D(latitude: 34.161167, longitude: -116.871683))
        altTPath.add(CLLocationCoordinate2D(latitude: 34.158697, longitude: -116.871030))
        altTPath.add(CLLocationCoordinate2D(latitude: 34.157153, longitude: -116.867553))
        altTPath.add(CLLocationCoordinate2D(latitude: 34.155129, longitude: -116.868068))
        altTPath.add(CLLocationCoordinate2D(latitude: 34.147831, longitude: -116.855580))
        altTPath.add(CLLocationCoordinate2D(latitude: 34.137137, longitude: -116.865890))
        let altoDiabloTrees = Tour(path: altTPath, id: "34.137137 -116.865890", imageURL: [#imageLiteral(resourceName: "IMG_1213"), #imageLiteral(resourceName: "alt3"), #imageLiteral(resourceName: "alt5")], distance: "3.5 miles", description: "The closest descent along the South Fork trail, these sheltered gullies and well-spaced trees have a relatively easy approach, especially when coverage is adequate. Nearly the entire South Fork trail is a burn area and so is this descent, so there are many fallen trees and bushes scattered throughout the landscape that must be avoided. This area makes for good storm day/post storm day riding due to its protected nature, low-angle, and higher elevation for more powdery snow. Follow the South Fork Trail for about 1.5 miles and skin up the north facing trees and series of small gullies until the summit,.", title: "Alto Diablo: North Trees", aspect: "NE", base: "6,900 ft", trailhead: "South Fork Trailhead", summit: "10,000 ft", angle: "25")
        
        let sugPath = GMSMutablePath()
        sugPath.add(CLLocationCoordinate2D(latitude: 34.231631, longitude: -116.806132))
        sugPath.add(CLLocationCoordinate2D(latitude: 34.225995, longitude: -116.813088))
        sugPath.add(CLLocationCoordinate2D(latitude: 34.218608, longitude: -116.805902))
        sugPath.add(CLLocationCoordinate2D(latitude: 34.215235, longitude: -116.803571))
        sugPath.add(CLLocationCoordinate2D(latitude: 34.215126, longitude: -116.795548))
        sugPath.add(CLLocationCoordinate2D(latitude: 34.209479, longitude: -116.794252))
        sugPath.add(CLLocationCoordinate2D(latitude: 34.204253, longitude: -116.796951))
        let sugarloaf = Tour(path: sugPath, id: "34.204253 -116.796951", imageURL: [#imageLiteral(resourceName: "sug2"), #imageLiteral(resourceName: "sug"), #imageLiteral(resourceName: "sug3")], distance: "3-5 miles", description: "A low-angle beginner/intermediate tour which offers sheltered trees, gullies, and a few open bowls. The summit is a medium-full day but there are plenty of shorter tours around this mountain.", title: "Sugarloaf: Rock Bowl", aspect: "NE", base: "7,000 ft", trailhead: "2N23 and CA 38", summit: "9,400-10,000 ft", angle: "20-25")
        
        tempTours.append(jepsonNW)
        tempTours.append(jepsonNE)
        tempTours.append(bigdraw)
        tempTours.append(gorgN)
        tempTours.append(gorgNW)
        tempTours.append(charDL)
        tempTours.append(charMain)
        tempTours.append(charDol)
        tempTours.append(altoDiablo)
        tempTours.append(altoDiabloTrees)
        tempTours.append(sugarloaf)

        return completion(tempTours)
    }
    
}
