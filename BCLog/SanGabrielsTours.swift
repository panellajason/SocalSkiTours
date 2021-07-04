//
//  WrightwoodTours.swift
//  BCLog
//
//  Created by Jason Panella on 6/2/21.
//  Copyright © 2021 Jason Panella. All rights reserved.
//

import Foundation
import GoogleMaps

class SanGabrielsTours {
    
    static func loadTours(completion:@escaping (_ tours:[Tour])->()) {
        var tempTours = [Tour]()
        
        let badenPath = GMSMutablePath()
        badenPath.add(CLLocationCoordinate2D(latitude: 34.373250, longitude: -117.751986))
        badenPath.add(CLLocationCoordinate2D(latitude: 34.372731, longitude: -117.755967))
        badenPath.add(CLLocationCoordinate2D(latitude: 34.371467, longitude: -117.754773))
        badenPath.add(CLLocationCoordinate2D(latitude: 34.368462, longitude: -117.758920))
        badenPath.add(CLLocationCoordinate2D(latitude: 34.361183, longitude: -117.762169))
        let baden = Tour(path: badenPath, id: "34.361183 -117.762169", imageURL: [#imageLiteral(resourceName: "baden"), #imageLiteral(resourceName: "baden6"), #imageLiteral(resourceName: "baden4")], distance: "4 miles", description: "Named after the founder of Boy Scouts, Baden Powell is a steep, complex mountain that is comprised of well-spaced trees, steep gullies, and even some technical chutes. The entire area avalanches frequently in storm cycles, which may also explain why the highway is usually closed a few miles back from the trailhead during most winters. Many will still walk/skin the road when it's closed, but once the road opens, BP is a great winter/spring skiing destination due to its easy access and mostly north facing, sheltered gullies which hold snow well into a good season. There are many different gullies and chutes to choose from on BP, but be aware of waterfalls and avalanche paths as some of the descents (such as Boy Scout Gully off of the summit) end in these features. Even the usual NE gullies have some steep, narrow sections at some point in the ski down. The normal approach from Vincent Gulch parking lot can be quite steep and icy in the morning requiring some attention but the route slowly gives way to gentler slopes as you gain elevation.", title: "Baden Powell: NE Gullies", aspect: "NE", base: "6,600 ft", trailhead: "Vincent Gulch Trailhead", summit: "9,400 ft", angle: "25-35")
        
        let badenEPath = badenPath.mutableCopy()
        (badenEPath as AnyObject).add(CLLocationCoordinate2D(latitude: 34.360693, longitude: -117.763157))
        (badenEPath as AnyObject).add(CLLocationCoordinate2D(latitude: 34.358660, longitude: -117.764692))
        (badenEPath as AnyObject).add(CLLocationCoordinate2D(latitude: 34.358358, longitude: -117.764446))
        let badenE = Tour(path: badenEPath as! GMSMutablePath, id: "34.358358 -117.764446", imageURL: [#imageLiteral(resourceName: "baden3"), #imageLiteral(resourceName: "baden2"), #imageLiteral(resourceName: "baden5")], distance: "4 miles", description: "Similar to Mt Baldy's North Face in the sense that there's no way out, this descent can be a great link up with Baden's NE gullies as the East Face will soften first in corn cycles. All of the lines down the East Face are dead-ends but provide some great turns for what they are. The summit of BP is an excellent view of Mt Baldy's North Face if you are ever trying to guage conditions/snow coverage for that line. Follow the normal Baden Powell route and as you gain the last ridge to the summit, the East Face comes into view. Drop in from the summit and make sure you can climb back up the same line you ride. To get back to the trailhead, ski the NE gullies back to the car.", title: "Baden Powell: East Face", aspect: "E", base: "6,600 ft", trailhead: "Vincent Gulch Trailhead", summit: "9,400 ft", angle: "35-40")
                
        let mankerPath = GMSMutablePath()
        mankerPath.add(CLLocationCoordinate2D(latitude: 34.266194, longitude: -117.626840))
        mankerPath.add(CLLocationCoordinate2D(latitude: 34.266502, longitude: -117.627251))
        mankerPath.add(CLLocationCoordinate2D(latitude: 34.266809, longitude: -117.631681))
        mankerPath.add(CLLocationCoordinate2D(latitude: 34.270642, longitude: -117.632719))
        mankerPath.add(CLLocationCoordinate2D(latitude: 34.267859, longitude: -117.630642))
        mankerPath.add(CLLocationCoordinate2D(latitude: 34.268151, longitude: -117.629389))
        mankerPath.add(CLLocationCoordinate2D(latitude: 34.268303, longitude: -117.630210))
        mankerPath.add(CLLocationCoordinate2D(latitude: 34.274164, longitude: -117.631524))
        mankerPath.add(CLLocationCoordinate2D(latitude: 34.281466, longitude: -117.639026))
        mankerPath.add(CLLocationCoordinate2D(latitude: 34.280631, longitude: -117.641719))
        mankerPath.add(CLLocationCoordinate2D(latitude: 34.278896, longitude: -117.642305))
        mankerPath.add(CLLocationCoordinate2D(latitude: 34.278029, longitude: -117.644836))
        mankerPath.add(CLLocationCoordinate2D(latitude: 34.281319, longitude: -117.647120))
        mankerPath.add(CLLocationCoordinate2D(latitude: 34.283921, longitude: -117.646997))
        mankerPath.add(CLLocationCoordinate2D(latitude: 34.286354, longitude: -117.644966))
        let baldyBowl = Tour(path: mankerPath, id: "34.286354 -117.644966", imageURL: [#imageLiteral(resourceName: "IMG_1311"), #imageLiteral(resourceName: "IMG_1032"), #imageLiteral(resourceName: "baldy"), #imageLiteral(resourceName: "IMG_1041"), #imageLiteral(resourceName: "IMG_1038"), #imageLiteral(resourceName: "img023"), #imageLiteral(resourceName: "bowl"), #imageLiteral(resourceName: "Baldy_Bowl_Chutes")], distance: "4.5 miles", description: "Without a doubt, the most popular mountain in Southern California. On a clear winter weekend after a fresh snowfall, it is not uncommon to see 20-30+ hikers/skiers ascending the Bowl like a line of ants, 5 skiers descending various chutes at the same time, all while a helicopter circles the ski hut making a rescue; it can be a circus out there sometimes. Despite all that, this is some of the best terrain in Socal which explains why they built two ski huts here in the 1930s (the original burned down). On good snow years, at least 10+ chutes are rideable varying in length, aspect and angle. The looker's left of the bowl is more couloir/crag-like while the chutes in the center of the bowl are slightly wider and slightly less steep.  Unforuntately, not every line fills in every year due to inconsistent nature of Socal winters and the Bowl facing south to east; storms really need to pile up to make a sufficient base. The east facing side (looker's left) of the Bowl tends to be rideable the earliest, and latest, in the season. Each chute in the Bowl has its own feel and uniqueness and many will vary drastically from year to year depending on snow coverage. Follow the Baldy Bowl trail to the Ski Hut, then traverse to the looker's left of the Bowl and ascend the trees to the ridge and pick your line. If conditions allow, climb the chute of choice but beware of constant rockfall and avalanches. Always start early and be out of the bowl early as this terrain heats up very quick and many are injured here every year.", title: "Mt Baldy: Baldy Bowl", aspect: "S/E", base: "6,100 ft", trailhead: "Mt Baldy Trailhead", summit: "9,800 ft", angle: "30-45")

        let nPath = mankerPath.mutableCopy()
        (nPath as AnyObject).add(CLLocationCoordinate2D(latitude: 34.289109, longitude: -117.647143))
        let baldyN = Tour(path: nPath as! GMSMutablePath, id: "34.289109 -117.647143", imageURL: [#imageLiteral(resourceName: "nface"), #imageLiteral(resourceName: "nface2"), #imageLiteral(resourceName: "northf1"), #imageLiteral(resourceName: "northf2"), #imageLiteral(resourceName: "Screen Shot 2021-06-05 at 12.08.30 PM")], distance: "4.5 miles", description: "Despite being the most popular mountain in Southern California, the North Face of Mt Baldy rarely gets ridden in comparison to the Bowl, due to a few reasons. To start, you have to hike back up to the summit after riding the line (after the nearly 4,000 vert to get to the summit) because there's no way out. Next, as Andy Lewicky puts it, 'The North face is usually an ice rink' for most of the season due to excessively high moisture-laden winds, and by the time spring comes around the Bowl is too melted out to descend to the trailhead making the skiing-to-hiking ratio quite low. Finally, the North Face ends in a steep, narrow couloir (aptly named the Bottleneck Couloir) which is more of a waterfall, but this feature can be skipped by traversing skier's right at the ~9,000 ft mark. All of the various lines down the North face and West Baldy's North Face are impressively steep and sustained, looking almost Colorado-esque from afar. Take the normal approach to Mt Baldy's summit and make sure you can climb back up the line you skied. Descend the Baldy Bowl to get back to the trailhead.", title: "Mt Baldy: North Face", aspect: "N", base: "6,100 ft", trailhead: "Mt Baldy Trailhead", summit: "10,000 ft", angle: "40-45")
        
        let kraktaPath = GMSMutablePath()
        kraktaPath.add(CLLocationCoordinate2D(latitude: 34.351453, longitude: -117.896972))
        kraktaPath.add(CLLocationCoordinate2D(latitude: 34.351197, longitude: -117.897462))
        kraktaPath.add(CLLocationCoordinate2D(latitude: 34.351116, longitude: -117.899042))
        kraktaPath.add(CLLocationCoordinate2D(latitude: 34.349336, longitude: -117.899723))
        kraktaPath.add(CLLocationCoordinate2D(latitude: 34.347442, longitude: -117.898000))
        let krakta = Tour(path: kraktaPath, id: "34.347518 -117.897992", imageURL: [#imageLiteral(resourceName: "krakta"), #imageLiteral(resourceName: "krakta2")], distance: "1 mile", description: "Krakta Ridge Ski Area, aka Snowcrest, is currently an abandoned ski resort which was open from 1954-2001. Avalanches, fires, and lawsuits were the demise of the resort in 2001. The ski area has since been sold and remained abandoned for roughly 20 years despite being bought by the same owners as Mount Waterman Ski Lifts. The terrain is short and steep which is comprised of overgrown ski runs, areas of well-spaced trees and some areas of tight, new-growth trees. Krakta is perfect for a couple of short, quick laps but beware of road conditions as the CA 2 is not one of the top priority highways to plow after a heavy winter storm. At such a low elevation and being so close to the ocean, snow quality is usually lacking in the western San Gabriels but the occassional cold, dry storm still does happen and spring can be quite fun.", title: "Krakta Ridge: Ski Area", aspect: "N", base: "6,800 ft", trailhead: "Krakta Ridge Parking", summit: "7,500 ft", angle: "20-30")
        
        let watermanPath = GMSMutablePath()
        watermanPath.add(CLLocationCoordinate2D(latitude: 34.349698, longitude: -117.928709))
        watermanPath.add(CLLocationCoordinate2D(latitude: 34.349296, longitude: -117.928535))
        watermanPath.add(CLLocationCoordinate2D(latitude: 34.349689, longitude: -117.926171))
        watermanPath.add(CLLocationCoordinate2D(latitude: 34.348609, longitude: -117.927180))
        watermanPath.add(CLLocationCoordinate2D(latitude: 34.346928, longitude: -117.925932))
        watermanPath.add(CLLocationCoordinate2D(latitude: 34.345188, longitude: -117.929851))
        watermanPath.add(CLLocationCoordinate2D(latitude: 34.345665, longitude: -117.933310))
        let waterman = Tour(path: watermanPath, id: "34.345932 -117.933253", imageURL: [#imageLiteral(resourceName: "waterman"), #imageLiteral(resourceName: "waterman2")], distance: "1 mile", description: "Although still operating, Mount Waterman Ski Lifts is open at such an inconsistent rate (usually weekends, if at all) it may as well be considered a backcountry destination. Boasting the first chairlift in Southern California and second in the state, Waterman opened in 1939 and is a gem in Socal's ski history. The website is still active and lift-accessed skiing does happen here, so don't be suprised if the resort is open when you arrive; just drive down the road and ski something else (Krakta Ridge, Buckhorn, Throop, Islip). The joys of Waterman are its steep, open ski runs, tight gullies and parking as close as it gets to the goods. There are plently of other options just off of the resort area as well. Some of which that are much more committing and dangerous than the normal Waterman day, such as the Avalanche Chutes off of the summit which drop you a few miles down the road from the parking area. Highway 2 can be quite fickle with opening after a storm so keep an eye on Caltrans before making the drive; this is not a top priority highway compared to others in Socal. The western San Gabriels are lower elevation and very close to the ocean so San Gabriel Cement/Stucco (similar to Sierra Cement but worse) is common.", title: "Mount Waterman: Ski Area", aspect: "N", base: "6,800 ft", trailhead: "Waterman Parking", summit: "7,800 ft", angle: "25-30")
        
        tempTours.append(baldyBowl)
        tempTours.append(baldyN)
        tempTours.append(baden)
        tempTours.append(badenE)
        tempTours.append(krakta)
        tempTours.append(waterman)

        
        return completion(tempTours)
    }
}
