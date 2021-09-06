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
        
        //Mt Baldy Trailhead
        let baldyTH = GMSMarker()
        baldyTH.position = CLLocationCoordinate2D(latitude: 34.266194, longitude: -117.626840)
        baldyTH.title = "Mt Baldy Trailhead"
        baldyTH.icon = GMSMarker.markerImage(with: .black)
        
        //Telegraph Trailhead
        let telegraphTH = GMSMarker()
        telegraphTH.position = CLLocationCoordinate2D(latitude: 34.265280, longitude: -117.605923)
        telegraphTH.title = "Mt Baldy Ski Lifts"
        telegraphTH.icon = GMSMarker.markerImage(with: .black)
        
        //Harwood Trailhead
        let harwoodTH = GMSMarker()
        harwoodTH.position = CLLocationCoordinate2D(latitude: 34.281825, longitude: -117.617570)
        harwoodTH.title = "Mt Baldy Ski Lifts"
        harwoodTH.icon = GMSMarker.markerImage(with: .black)
        
        //Vincent Gulch Trailhead
        let badenTH = GMSMarker()
        badenTH.position = CLLocationCoordinate2D(latitude: 34.373250, longitude: -117.751986)
        badenTH.title = "Vincent Gap Trailhead"
        badenTH.icon = GMSMarker.markerImage(with: .black)
        
        //Krakta Trailhead
        let kraktaTH = GMSMarker()
        kraktaTH.position = CLLocationCoordinate2D(latitude: 34.351453, longitude: -117.896972)
        kraktaTH.title = "Krakta Ridge Trailhead"
        kraktaTH.icon = GMSMarker.markerImage(with: .black)
        
        //Waterman Trailhead
        let watermanTH = GMSMarker()
        watermanTH.position = CLLocationCoordinate2D(latitude: 34.349698, longitude: -117.928709)
        watermanTH.title = "Waterman Trailhead"
        watermanTH.icon = GMSMarker.markerImage(with: .black)
        
        let badenPath = GMSMutablePath()
        badenPath.add(CLLocationCoordinate2D(latitude: 34.373250, longitude: -117.751986))
        badenPath.add(CLLocationCoordinate2D(latitude: 34.372731, longitude: -117.755967))
        badenPath.add(CLLocationCoordinate2D(latitude: 34.371467, longitude: -117.754773))
        badenPath.add(CLLocationCoordinate2D(latitude: 34.368462, longitude: -117.758920))
        badenPath.add(CLLocationCoordinate2D(latitude: 34.361183, longitude: -117.762169))
        let badenLine = GMSPolyline(path: badenPath)
        badenLine.strokeWidth = 3
        badenLine.strokeColor = .red
        let badenMarker = GMSMarker()
        badenMarker.position = CLLocationCoordinate2D(latitude: 34.361183, longitude: -117.762169)
        badenMarker.title = "Baden Powell"
        badenMarker.snippet = "NE Gullies"
        badenMarker.icon = GMSMarker.markerImage(with: .blue)
        let baden = Tour(title: "Baden Powell: NE Gullies", path: badenLine, id: "34.361183 -117.762169", imageURL: [#imageLiteral(resourceName: "baden"), #imageLiteral(resourceName: "baden6"), #imageLiteral(resourceName: "baden4")], distance: "4 miles", description: "Named after the founder of Boy Scouts, Baden Powell is a steep, complex mountain that is comprised of some well-spaced trees, steep gullies, and even some technical chutes. This entire area avalanches frequently in storm cycles, which may also explain why the highway is usually closed a few miles back from the trailhead during most winters. Many will still walk/skin the road when it's closed, but once the road opens, Baden Powell is a great winter/spring skiing destination due to its easy access and sheltered, north facing gullies which hold snow well into a good season. There are many different gullies and chutes to choose from on this mountwin, but be aware of waterfalls and avalanche paths as some of the descents (such as Boy Scout Gully off of the summit) end in these features. Even the usual NE gullies have some steep, narrow sections at some point in the ski down. The normal approach from Vincent Gulch parking lot can be quite steep and icy in the morning requiring some attention but the route slowly gives way to gentler slopes as you gain elevation.", marker: badenMarker, aspect: "NE", base: "6,600 ft", trailhead: badenTH, summit: "9,400 ft", angle: "25-35")
        
        let badenEPath = badenPath.mutableCopy()
        (badenEPath as AnyObject).add(CLLocationCoordinate2D(latitude: 34.360693, longitude: -117.763157))
        (badenEPath as AnyObject).add(CLLocationCoordinate2D(latitude: 34.358660, longitude: -117.764692))
        (badenEPath as AnyObject).add(CLLocationCoordinate2D(latitude: 34.358358, longitude: -117.764446))
        let badenELine = GMSPolyline(path: (badenEPath as! GMSPath))
        badenELine.strokeWidth = 3
        badenELine.strokeColor = .red
        let badenEMarker = GMSMarker()
        badenEMarker.position = CLLocationCoordinate2D(latitude: 34.358358, longitude: -117.764446)
        badenEMarker.title = "Baden Powell"
        badenEMarker.snippet = "East Face"
        badenEMarker.icon = GMSMarker.markerImage(with: .blue)
        let badenE = Tour(title: "Baden Powell: East Face", path: badenELine, id: "34.358358 -117.764446", imageURL: [#imageLiteral(resourceName: "baden3"), #imageLiteral(resourceName: "baden2"), #imageLiteral(resourceName: "baden5")], distance: "4 miles", description: "Similar to Mt Baldy's North Face in the sense that there's no way out, this descent can be a great link up with the usual descents on this mountain (NE gullies) as the East Face will soften first in corn cycles. All of the lines down the East Face are dead-ends but provide some great turns for what they are. The summit of BP is an excellent view of Mt Baldy's North Face if you are trying to guage conditions/snow coverage for that line. Follow the normal Baden Powell route and as you gain the last ridge to the summit, the East Face comes into view. Drop in from the summit and make sure you can climb back up the same line you ride. To get back to the trailhead, ski the NE gullies back to the car.", marker: badenEMarker, aspect: "E", base: "6,600 ft", trailhead: badenTH, summit: "9,400 ft", angle: "35-40")
                
        let baldyPath = GMSMutablePath()
        baldyPath.add(CLLocationCoordinate2D(latitude: 34.266194, longitude: -117.626840))
        baldyPath.add(CLLocationCoordinate2D(latitude: 34.266502, longitude: -117.627251))
        baldyPath.add(CLLocationCoordinate2D(latitude: 34.266809, longitude: -117.631681))
        baldyPath.add(CLLocationCoordinate2D(latitude: 34.270642, longitude: -117.632719))
        baldyPath.add(CLLocationCoordinate2D(latitude: 34.267859, longitude: -117.630642))
        baldyPath.add(CLLocationCoordinate2D(latitude: 34.268151, longitude: -117.629389))
        baldyPath.add(CLLocationCoordinate2D(latitude: 34.268303, longitude: -117.630210))
        baldyPath.add(CLLocationCoordinate2D(latitude: 34.274164, longitude: -117.631524))
        baldyPath.add(CLLocationCoordinate2D(latitude: 34.281466, longitude: -117.639026))
        baldyPath.add(CLLocationCoordinate2D(latitude: 34.280631, longitude: -117.641719))
        baldyPath.add(CLLocationCoordinate2D(latitude: 34.278896, longitude: -117.642305))
        baldyPath.add(CLLocationCoordinate2D(latitude: 34.278029, longitude: -117.644836))
        baldyPath.add(CLLocationCoordinate2D(latitude: 34.281319, longitude: -117.647120))
        baldyPath.add(CLLocationCoordinate2D(latitude: 34.283921, longitude: -117.646997))
        baldyPath.add(CLLocationCoordinate2D(latitude: 34.286354, longitude: -117.644966))
        let baldyLine = GMSPolyline(path: baldyPath)
        baldyLine.strokeWidth = 3
        baldyLine.strokeColor = .red
        let baldyBowlMarker = GMSMarker()
        baldyBowlMarker.position = CLLocationCoordinate2D(latitude: 34.286354, longitude: -117.644966)
        baldyBowlMarker.title = "Mt Baldy"
        baldyBowlMarker.snippet = "Baldy Bowl"
        baldyBowlMarker.icon = GMSMarker.markerImage(with: .blue)
        let baldyBowl = Tour(title: "Mt Baldy: Baldy Bowl", path: baldyLine, id: "34.286354 -117.644966", imageURL: [#imageLiteral(resourceName: "IMG_1311"), #imageLiteral(resourceName: "IMG_1032"), #imageLiteral(resourceName: "baldy"), #imageLiteral(resourceName: "IMG_1041"), #imageLiteral(resourceName: "darechute"), #imageLiteral(resourceName: "img023"), #imageLiteral(resourceName: "bowl"), #imageLiteral(resourceName: "Baldy_Bowl_Chutes")], distance: "4.5 miles", description: "Without a doubt, the most popular mountain in Southern California. On a clear weekend with sufficient snow, you may see 20-30+ hikers/skiers ascending the Bowl like a line of ants, 5 skiers descending various chutes, all while a helicopter circles the ski hut making a rescue; it can be a circus out there sometimes. Despite all this, this is some of the best alpine terrain in Souther California which explains why it hosts one of the only ski huts in the region. During good snow years, at least 10+ chutes are rideable varying in length, aspect and angle. The looker's left of the bowl is more couloir/crag-like while the chutes in the center of the bowl are slightly wider and shorter. Due to the rocky nature of the bowl and its southeast aspect, storms really need to pile up to make a sufficient base. That being said, it can go from rocks to rideable with one big storm and some rock skis. Spring conditions (corn, melt/freeze cycles) plague the Bowl all season, except after the coldest and driest of storms when powder may last one or two days. The looker's left of the Bowl tends to be rideable the earliest, and latest, in the season. Follow the Baldy Bowl trail to the Ski Hut, then traverse to the looker's left of the Bowl and ascend the trees. Once atop this section, follow the ridge up to the chutes. Alternatively, climb the chute of choice but beware of constant rockfall and avalanches (climbers/skiers get caught in slides every year, even during low snow years). Always start early and be out of the bowl early as this terrain heats up quickly and many are injured here every year.", marker: baldyBowlMarker, aspect: "S/E", base: "6,100 ft", trailhead: baldyTH, summit: "9,800 ft", angle: "30-45")

        let nPath = baldyPath.mutableCopy()
        (nPath as AnyObject).add(CLLocationCoordinate2D(latitude: 34.289109, longitude: -117.647143))
        let baldyNLine = GMSPolyline(path: (nPath as! GMSPath))
        baldyNLine.strokeWidth = 3
        baldyNLine.strokeColor = .red
        let baldyNMarker = GMSMarker()
        baldyNMarker.position = CLLocationCoordinate2D(latitude: 34.289109, longitude: -117.647143)
        baldyNMarker.title = "Mt Baldy"
        baldyNMarker.snippet = "North Face"
        baldyNMarker.icon = GMSMarker.markerImage(with: .blue)
        let baldyN = Tour(title: "Mt Baldy: North Face", path: baldyNLine, id: "34.289109 -117.647143", imageURL: [#imageLiteral(resourceName: "nface"), #imageLiteral(resourceName: "nfacebaldy"), #imageLiteral(resourceName: "nface2"), #imageLiteral(resourceName: "northf1"), #imageLiteral(resourceName: "northf2"), #imageLiteral(resourceName: "Screen Shot 2021-06-05 at 12.08.30 PM")], distance: "4.5 miles", description: "Despite being the most popular mountain in Southern California, the North Face of Mt Baldy rarely gets ridden in comparison to the Bowl, due to a few reasons. To start, you have to hike back up to the summit after riding the line (after nearly 4,000 vert to get to the summit in the first place) because there's no way out. Next, as Andy Lewicky (SierraDescents.com) puts it, 'The North face is usually an ice rink' for most of the season due to excessively high, moisture-laden winds. By the time spring comes around and North face starts to soften, the Bowl is usually too melted out to descend to the ski hut making the skiing-to-hiking ratio quite low. Finally, the North Face ends in a steep, narrow couloir (aptly named the Bottleneck Couloir) which is more of a waterfall; but this feature can be avoided by traversing skier's right at the ~9,000 ft mark. All of the various lines down the North face and West Baldy's North Face are impressively steep and sustained, looking almost Colorado-esque from afar. Take the normal approach to Mt Baldy's summit and make sure you can climb back up the line you skied. Descend the Baldy Bowl to get back to the trailhead.", marker: baldyNMarker, aspect: "N", base: "6,100 ft", trailhead: baldyTH, summit: "10,000 ft", angle: "40-45")
        
        let telegraphPath = GMSMutablePath()
        telegraphPath.add(CLLocationCoordinate2D(latitude: 34.265280, longitude: -117.605923))
        telegraphPath.add(CLLocationCoordinate2D(latitude: 34.265166, longitude: -117.604893))
        telegraphPath.add(CLLocationCoordinate2D(latitude: 34.263900, longitude: -117.602729))
        telegraphPath.add(CLLocationCoordinate2D(latitude: 34.261520, longitude: -117.602446))
        telegraphPath.add(CLLocationCoordinate2D(latitude: 34.261850, longitude: -117.600498))
        telegraphPath.add(CLLocationCoordinate2D(latitude: 34.260914, longitude: -117.600282))
        telegraphPath.add(CLLocationCoordinate2D(latitude: 34.261694, longitude: -117.598649))
        let telegraphLine = GMSPolyline(path: telegraphPath)
        telegraphLine.strokeWidth = 3
        telegraphLine.strokeColor = .red
        let telegraphMarker = GMSMarker()
        telegraphMarker.position = CLLocationCoordinate2D(latitude: 34.261694, longitude: -117.598649)
        telegraphMarker.title = "Telegraph Peak"
        telegraphMarker.snippet = "North Face"
        telegraphMarker.icon = GMSMarker.markerImage(with: .blue)
        let telegraph = Tour(title: "Telegraph Peak: North Face", path: telegraphLine, id: "34.261694 -117.598649", imageURL: [#imageLiteral(resourceName: "telegraph"), #imageLiteral(resourceName: "telegraph3"),#imageLiteral(resourceName: "telegraph2")], distance: "1 mile", description: "Southern California isn't known for its lift-accessed backcountry but Mt Baldy Ski Lifts can offer some great descents when there's snow; one of the most sought after being Telegraph Peak. Its excellent view and access from the ski lifts, not to mention its technical chutes and high elevation make this is a worthy descent. The best time to ride these chutes are in spring during melt/freeze cycles since winter can be quite variable. A short ski down from the lifts and a short skin up to the summit is all it takes to reach these chutes; getting back up to the ski resort is another challenge on its own, which can be approached a few different ways. After skiing the chutes, either climb back up to the ski lift which dropped you off or continue down the canyon until a gully appears on skier's left at about 6,500 feet. Follow this gully back up to the resort.", marker: telegraphMarker, aspect: "N", base: "8,600 ft", trailhead: telegraphTH, summit: "9,000 ft", angle: "40-45")
        
        let harwoodPath = GMSMutablePath()
        harwoodPath.add(CLLocationCoordinate2D(latitude: 34.281825, longitude: -117.617570))
        harwoodPath.add(CLLocationCoordinate2D(latitude: 34.282609, longitude: -117.619317))
        harwoodPath.add(CLLocationCoordinate2D(latitude: 34.283071, longitude: -117.622187))
        harwoodPath.add(CLLocationCoordinate2D(latitude: 34.283032, longitude: -117.623746))
        harwoodPath.add(CLLocationCoordinate2D(latitude: 34.282861, longitude: -117.624912))
        let harwoodLine = GMSPolyline(path: harwoodPath)
        harwoodLine.strokeWidth = 3
        harwoodLine.strokeColor = .red
        let harwoodMarker = GMSMarker()
        harwoodMarker.position = CLLocationCoordinate2D(latitude: 34.282861, longitude: -117.624912)
        harwoodMarker.title = "Mt Harwood"
        harwoodMarker.snippet = "East Chutes"
        harwoodMarker.icon = GMSMarker.markerImage(with: .blue)
        let harwood = Tour(title: "Mt Harwood: East Chutes", path: harwoodLine, id: "34.282861 -117.624912", imageURL: [#imageLiteral(resourceName: "harwood"),#imageLiteral(resourceName: "harwood4"), #imageLiteral(resourceName: "harwood2"),#imageLiteral(resourceName: "harwood3")], distance: ">1 mile", description: "Situated along the infamous Devil's Backbone, Mt Harwood's East Chutes are some of Southern California's best lift-accessed backcountry. When the stars align, which doesn't happen all that often, these chutes are a 30 minute hike from the ski resort and offer a 3,000 foot descent almost directly back to the bottom lift. Despite being such a short distance, this route is no joke. Year after year, the Backbone trail is closed due to injuries/deaths from slipping on ice and breaking cornices. The snow conditions in the San Gabriel's change very quickly; what may be soft powder on one aspect or elevation will be mashed potatoes on another, espescially on these sun-exposed, east-southeast facing slopes; rockfall and avalanches are common as a result. From Mt Baldy resort, follow the Devil's Backbone ridge for about a half mile and the east facing chutes will be below you. Ski down for as long as the snow lasts and walk back to your car at the resort parking lot below you.", marker: harwoodMarker, aspect: "E-SE", base: "8,500 ft", trailhead: harwoodTH, summit: "9,000 ft", angle: "40-45")
        
        let roadsidePath = GMSMutablePath()
        roadsidePath.add(CLLocationCoordinate2D(latitude: 34.266194, longitude: -117.626840))
        roadsidePath.add(CLLocationCoordinate2D(latitude: 34.265367, longitude: -117.627050))
        roadsidePath.add(CLLocationCoordinate2D(latitude: 34.264053, longitude: -117.628854))
        roadsidePath.add(CLLocationCoordinate2D(latitude: 34.259765, longitude: -117.624268))
        let roadsideLine = GMSPolyline(path: roadsidePath)
        roadsideLine.strokeWidth = 3
        roadsideLine.strokeColor = .red
        let roadsideMarker = GMSMarker()
        roadsideMarker.position = CLLocationCoordinate2D(latitude: 34.259765, longitude: -117.624268)
        roadsideMarker.title = "Manker Flats"
        roadsideMarker.snippet = "Road Chutes"
        roadsideMarker.icon = GMSMarker.markerImage(with: .blue)
        let roadside = Tour(title: "Manker Flats: Road Chutes", path: roadsideLine, id: "34.259765 -117.624268", imageURL: [#imageLiteral(resourceName: "roadside1"), #imageLiteral(resourceName: "roadside2")], distance: "1 mile", description: "Easily accessed from Mt Baldy road or even Mt Baldy Ski Resort, these chutes need an especially good storm cycle to fill in completely. Like the rest of the Mt Baldy area, they are steep and prone to avalanche. This ridge has several different chutes making this a great place to ski some laps and practice in committing terrain within sight of your car. From the ski lifts, exit the ski area and follow Thunder Mountain's rigdeline down until you reach your desired chute, which can be quite difficult. If approaching from the road, boot up your desired chute.", marker: roadsideMarker, aspect: "N-NW", base: "6,200 ft", trailhead: baldyTH, summit: "7,600 ft", angle: "35-40")
        
        let kraktaPath = GMSMutablePath()
        kraktaPath.add(CLLocationCoordinate2D(latitude: 34.351453, longitude: -117.896972))
        kraktaPath.add(CLLocationCoordinate2D(latitude: 34.351197, longitude: -117.897462))
        kraktaPath.add(CLLocationCoordinate2D(latitude: 34.351116, longitude: -117.899042))
        kraktaPath.add(CLLocationCoordinate2D(latitude: 34.349336, longitude: -117.899723))
        kraktaPath.add(CLLocationCoordinate2D(latitude: 34.347442, longitude: -117.898000))
        let kraktaLine = GMSPolyline(path: kraktaPath)
        kraktaLine.strokeWidth = 3
        kraktaLine.strokeColor = .red
        let kraktaMarker = GMSMarker()
        kraktaMarker.position = CLLocationCoordinate2D(latitude: 34.347518, longitude: -117.897992)
        kraktaMarker.title = "Krakta Ridge"
        kraktaMarker.snippet = "Ski Area"
        kraktaMarker.icon = GMSMarker.markerImage(with: .blue)
        let krakta = Tour(title: "Krakta Ridge: Ski Area", path: kraktaLine, id: "34.347518 -117.897992", imageURL: [#imageLiteral(resourceName: "krakta"), #imageLiteral(resourceName: "krakta2")], distance: "1 mile", description: "Krakta Ridge Ski Area, aka Snowcrest, is currently an abandoned ski resort which was open from 1954-2001. Avalanches, fires, and lawsuits were the demise of the resort in 2001. The ski area has since been sold and remained abandoned for roughly 20 years, despite being bought by the same owners as Mount Waterman Ski Lifts. The terrain is short and steep which is comprised of overgrown ski runs, areas of well-spaced trees and some areas of tight, new-growth trees. Krakta is perfect for a couple of short, quick laps but beware of road conditions as the CA 2 is not one of the top priority highways to plow after a heavy winter storm. At such a low elevation and being so close to the ocean, snow quality is usually lacking in the western San Gabriels but the occassional cold, dry storm still does happen; spring can also be quite fun if there's snow.", marker: kraktaMarker, aspect: "N", base: "6,800 ft", trailhead: kraktaTH, summit: "7,500 ft", angle: "20-30")
        
        let watermanPath = GMSMutablePath()
        watermanPath.add(CLLocationCoordinate2D(latitude: 34.349698, longitude: -117.928709))
        watermanPath.add(CLLocationCoordinate2D(latitude: 34.349296, longitude: -117.928535))
        watermanPath.add(CLLocationCoordinate2D(latitude: 34.349689, longitude: -117.926171))
        watermanPath.add(CLLocationCoordinate2D(latitude: 34.348609, longitude: -117.927180))
        watermanPath.add(CLLocationCoordinate2D(latitude: 34.346928, longitude: -117.925932))
        watermanPath.add(CLLocationCoordinate2D(latitude: 34.345188, longitude: -117.929851))
        watermanPath.add(CLLocationCoordinate2D(latitude: 34.345665, longitude: -117.933310))
        let watermanLine = GMSPolyline(path: watermanPath)
        watermanLine.strokeWidth = 3
        watermanLine.strokeColor = .red
        let watermanMarker = GMSMarker()
        watermanMarker.position = CLLocationCoordinate2D(latitude: 34.345932, longitude: -117.933253)
        watermanMarker.title = "Mt Waterman"
        watermanMarker.snippet = "Ski Area"
        watermanMarker.icon = GMSMarker.markerImage(with: .blue)
        let waterman = Tour(title: "Mt Waterman: Ski Area", path: watermanLine, id: "34.345932 -117.933253", imageURL: [#imageLiteral(resourceName: "waterman"), #imageLiteral(resourceName: "waterman2")], distance: "1 mile", description: "Although still operating, Mount Waterman Ski Lifts is open at such an inconsistent rate (usually weekends, if at all) it may as well be considered a backcountry destination. Boasting the first chairlift in Southern California and second in the state, Waterman opened in 1939 and is a gem in Southern California's ski history. The website is still active and lift-accessed skiing does happen here, so don't be suprised if the resort is open when you arrive; just drive down the road and ski something else (Krakta Ridge, Buckhorn, Throop, Islip). The joys of Waterman are its steep ski runs, tight gullies and parking as close as it gets to the goods. There are plently of other options just off of the resort area as well. Some of which that are much more committing and dangerous than the normal Waterman day, such as the Avalanche Chutes off of the summit which drop you a few miles down the road from the parking area. Highway 2 can be quite fickle with opening after a storm so keep an eye on Caltrans before making the drive. The western San Gabriels are lower elevation and very close to the ocean so San Gabriel Cement/Stucco (similar to Sierra Cement but worse) is common.", marker: watermanMarker, aspect: "N", base: "6,800 ft", trailhead: watermanTH, summit: "7,800 ft", angle: "25-30")
        
        tempTours.append(baldyBowl)
        tempTours.append(baldyN)
        tempTours.append(baden)
        tempTours.append(badenE)
        tempTours.append(telegraph)
        tempTours.append(harwood)
        tempTours.append(roadside)
        tempTours.append(krakta)
        tempTours.append(waterman)
        let sorted = tempTours.sorted(by: { $0.tourTitle < $1.tourTitle })
        return completion(sorted)        
    }
}
