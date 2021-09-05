//
//  TourService.swift
//  BCLog
//
//  Created by Jason Panella on 5/29/21.
//  Copyright © 2021 Jason Panella. All rights reserved.
//

import Foundation
import GoogleMaps

class SanBernardinoTours {
        
    static func loadTours(completion:@escaping (_ tours:[Tour])->()) {
        var tempTours = [Tour]()
        
        //South Fork Trailhead
        let southForkTH = GMSMarker()
        southForkTH.position = CLLocationCoordinate2D(latitude: 34.161167, longitude: -116.871683)
        southForkTH.title = "South Fork Trailhead"
        southForkTH.icon = GMSMarker.markerImage(with: .black)
        
        //Sugarloaf Trailhead
        let sugarTH = GMSMarker()
        sugarTH.position = CLLocationCoordinate2D(latitude: 34.231631, longitude: -116.806132)
        sugarTH.title = "Sugarloaf Trailhead"
        sugarTH.icon = GMSMarker.markerImage(with: .black)

        let jepsonNWPath = GMSMutablePath()
        jepsonNWPath.add(CLLocationCoordinate2D(latitude: 34.161167, longitude: -116.871683))
        jepsonNWPath.add(CLLocationCoordinate2D(latitude: 34.158697, longitude: -116.871030))
        jepsonNWPath.add(CLLocationCoordinate2D(latitude: 34.157153, longitude: -116.867553))
        jepsonNWPath.add(CLLocationCoordinate2D(latitude: 34.155129, longitude: -116.868068))
        jepsonNWPath.add(CLLocationCoordinate2D(latitude: 34.147831, longitude: -116.855580))
        jepsonNWPath.add(CLLocationCoordinate2D(latitude: 34.130464, longitude: -116.843415))
        jepsonNWPath.add(CLLocationCoordinate2D(latitude: 34.120446, longitude: -116.842900))
        jepsonNWPath.add(CLLocationCoordinate2D(latitude: 34.116077, longitude: -116.842706))
        jepsonNWPath.add(CLLocationCoordinate2D(latitude: 34.110304, longitude: -116.843963))
        jepsonNWPath.add(CLLocationCoordinate2D(latitude: 34.107230, longitude: -116.850109))
        jepsonNWPath.add(CLLocationCoordinate2D(latitude: 34.103873, longitude: -116.850108))
        jepsonNWPath.add(CLLocationCoordinate2D(latitude: 34.103435, longitude: -116.847386))
        let jepNWLine = GMSPolyline(path: jepsonNWPath)
        jepNWLine.strokeWidth = 3
        jepNWLine.strokeColor = .red
        let jepsonNWMarker = GMSMarker()
        jepsonNWMarker.position = CLLocationCoordinate2D(latitude: 34.103435, longitude: -116.847386)
        jepsonNWMarker.title = "Jepson Peak"
        jepsonNWMarker.snippet = "North Chutes"
        jepsonNWMarker.icon = GMSMarker.markerImage(with: .blue)
        let jepsonNW = Tour(title: "Jepson Peak: North Chutes", path: jepNWLine, id: "34.103435 -116.847386", imageURL: [#imageLiteral(resourceName: "jepson_nw"), #imageLiteral(resourceName: "IMG_4364"), #imageLiteral(resourceName: "IMG_0673"), #imageLiteral(resourceName: "DDF34D9F-6ABB-4F2A-A1CE-3BB8D4CB6A4C"), #imageLiteral(resourceName: "IMG_1214"), #imageLiteral(resourceName: "IMG_1185")], distance: "6 miles", description: "Three defined, north facing chutes with many others that fill in during good snow years. The looker's right chutes are more complex and technical while the three main chutes are very open and straightforward. The entrances may be guarded with cornices and wind-affected snow is common during much of the winter as well. These chutes are typically rideable well into spring if there has been a decent snow year, sometimes even early June. Follow the South Fork Trail for 3.5 miles, then cross the South Fork meadows and continue south. The terrain will become a series of treed gullies but head in the SW direction and follow the gullies up and around Charlton Peak until the trees begin to clear. Continue up this old avalanche path until you are able to see the obvious saddle between Jepson Peak and Little Charlton Peak; boot or skin up this and follow Jepson's ridge up to the summit chutes.", marker: jepsonNWMarker, aspect: "N", base: "6,900 ft", trailhead: southForkTH, summit: "11,200 ft", angle: "35-40")
        
        let nePath = jepsonNWPath.mutableCopy()
        (nePath as AnyObject).add(CLLocationCoordinate2D(latitude: 34.101618, longitude: -116.843024))
        let jepNELine = GMSPolyline(path: (nePath as! GMSPath))
        jepNELine.strokeWidth = 3
        jepNELine.strokeColor = .red
        let jepsonNEMarker = GMSMarker()
        jepsonNEMarker.position = CLLocationCoordinate2D(latitude: 34.101618, longitude: -116.843024)
        jepsonNEMarker.title = "Jepson Peak"
        jepsonNEMarker.snippet = "NE Chutes"
        jepsonNEMarker.icon = GMSMarker.markerImage(with: .blue)
        let jepsonNE = Tour(title: "Jepson Peak: NE Chutes", path: jepNELine, id: "34.101618 -116.843024", imageURL: [#imageLiteral(resourceName: "jepson_ne"), #imageLiteral(resourceName: "IMG_1402"), #imageLiteral(resourceName: "IMG_0794"), #imageLiteral(resourceName: "IMG_0875"), #imageLiteral(resourceName: "IMG_1216")], distance: "6.5 miles", description: "Jepson's northeast cirque is one of the most beautiful set of lines in the region. Similar to the North chutes, except these are slightly steeper and there is a little bit more to choose from. An especially fun line is down Jepson's spine which offers a number of chutes to choose from on the way down. In good corn cycles, these chutes and the North chutes are a great link-up since these will soften first due to their easterly exposure to the sun. This exposure also allows the snow to heat up fairly quickly and wet slides are common throughout the season. Cornices form at the entrances to some of these chutes and wind-affected snow is common. In spite of that, there are some golden days when conditions are soft and stable in late winter/early spring. Follow either the Big Draw route or the Jepson N chutes route; I usually prefer the Big Draw route so I can get a close look at the cirque on the way up.", marker: jepsonNEMarker, aspect: "NE", base: "6,900 ft", trailhead: southForkTH, summit: "11,200 ft", angle: "38-40")
        
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
        let gorgLine = GMSPolyline(path: gorgPath)
        gorgLine.strokeWidth = 3
        gorgLine.strokeColor = .red
        let bigDrawMarker = GMSMarker()
        bigDrawMarker.position = CLLocationCoordinate2D(latitude: 34.099683, longitude: -116.838692)
        bigDrawMarker.title = "San Gorgonio"
        bigDrawMarker.snippet = "The Big Draw"
        bigDrawMarker.icon = GMSMarker.markerImage(with: .blue)
        let bigdraw = Tour(title: "San Gorgonio: The Big Draw", path: gorgLine, id: "34.099683 -116.838692", imageURL: [#imageLiteral(resourceName: "big_draw"), #imageLiteral(resourceName: "IMG_0913"), #imageLiteral(resourceName: "IMG_0058"), #imageLiteral(resourceName: "IMG_0878")], distance: "6.5 miles", description: "One of the most classic descents in Southern California, the Big Draw has been skied by the San Gorgonio Ski Club since the early 1900s. The area was petitioned to become a ski resort in the 1940s but failed. Today, it is known as a rite of passage in SoCal backcountry skiing and also offers the easiest way up the San Gorgonio/Jepson saddle. The Big Draw is an excellent catcher's mitt for snow as it is essentially a large bowl positioned between two windstrewn peaks. It is usually the last remaining snow in Southern California, sometimes having patches last into July. In 2019, this was skiable for several thousand feet well into June. This last winter season (2021), however, much of this area was hardly rideable or never became rideable due to lack of snow. Follow the South Fork Trail for 3.5 miles, then cross South Fork meadows and continue up through the trees. The terrain will become a series of small gullies but head in the SE direction and the terrain will flatten out, the trees will clear, and the large bowl known as the Big Draw will become visible. If conditions allow, skinning up the entirety of this bowl, without switching to bootpacking, is manageable.", marker: bigDrawMarker, aspect: "N", base: "6,900 ft", trailhead: southForkTH, summit: "11,200 ft", angle: "30-35")
        
        let nwPath = gorgPath.mutableCopy()
        (nwPath as AnyObject).add(CLLocationCoordinate2D(latitude: 34.099769, longitude: -116.836071))
        (nwPath as AnyObject).add(CLLocationCoordinate2D(latitude: 34.101406, longitude: -116.834642))
        let gorgNWLine = GMSPolyline(path: (nwPath as! GMSPath))
        gorgNWLine.strokeWidth = 3
        gorgNWLine.strokeColor = .red
        let gorgNWMarker = GMSMarker()
        gorgNWMarker.position = CLLocationCoordinate2D(latitude: 34.101406, longitude: -116.834642)
        gorgNWMarker.title = "San Gorgonio"
        gorgNWMarker.snippet = "NW Chutes"
        gorgNWMarker.icon = GMSMarker.markerImage(with: .blue)
        let gorgNW = Tour(title: "San Gorgonio: NW Chutes", path: gorgNWLine, id: "34.101406 -116.834642", imageURL: [#imageLiteral(resourceName: "IMG_8932"), #imageLiteral(resourceName: "gorg_nw"), #imageLiteral(resourceName: "nwchu")], distance: "6.5 miles", description: "Often overlooked for the more popular descents nearby, these chutes offer steep, sustained drops which need a decent amount of snowfall to become rideable. This area is subject to very high winds and therefore variable riding conditions, so spring is usually the best season to ride these chutes. Due to their westerly exposure, this side of the mountain usually softens a bit later in the day and are a great link up with Jepson's NE chutes which heat up early. Follow the Big Draw route and continue along the San Gorgonio ridge in the NE direction until you find your desired chute.", marker: gorgNWMarker, aspect: "NW", base: "6,900 ft", trailhead: southForkTH, summit: "11,200 ft", angle: "40-45")
        
        let nPath = (nwPath as AnyObject).mutableCopy()
        (nPath as AnyObject).add(CLLocationCoordinate2D(latitude: 34.101979, longitude: -116.830673))
        let gorgNLine = GMSPolyline(path: (nPath as! GMSPath))
        gorgNLine.strokeWidth = 3
        gorgNLine.strokeColor = .red
        let gorgNMarker = GMSMarker()
        gorgNMarker.position = CLLocationCoordinate2D(latitude: 34.101979, longitude: -116.830673)
        gorgNMarker.title = "San Gorgonio"
        gorgNMarker.snippet = "North Face"
        gorgNMarker.icon = GMSMarker.markerImage(with: .blue)
        let gorgN = Tour(title: "San Gorgonio: North Face", path: gorgNLine, id: "34.101979 -116.830673", imageURL: [#imageLiteral(resourceName: "IMG_1436"), #imageLiteral(resourceName: "gorg_n"), #imageLiteral(resourceName: "IMG_9002"), #imageLiteral(resourceName: "gorg1")], distance: "6.5 miles", description: "The tallest mountain in Southern California at 11,500 ft and a moderate 2,000 ft descent down broad chutes. Winter skiing conditions are variable at this elevation due to winds and it is not uncommon for the upper few hundred feet of some of the chutes to be wind-stripped. The north face of San Gorgonio is also known for its massive avalanches (See pic 4 of the 2019 Valentines Day slides, courtesy of Socalsnow.org; these occurred after a large atmopsheric river and high snow levels). Spring is the most popular season to ride and climb Gorgonio (the snow is consolidated and quick to travel on, the days are longer, and the riding conditions are consistent). If skiing conditions are favorable, these chutes feel like your average black-diamond ski resort run despite the mountain looking like a giant from afar. This area was under threat of development in the mid 1900s, but the ultimate decision was that “San Gorgonio Primitive Area has a higher public value as a wilderness and a watershed than as a downhill ski area”. Either follow the Big Draw route to the San Gorgonio ridge, or branch off when the North face comes into view and climb those chutes for a slightly steeper but more direct route. Note: the actual summit of San Gorgonio is about a mile in the easterly direction from the North face and offers no additional skiing, unless you are looking to drop in to the steep bowl just below the summit (which doesn't get ridden all that often).", marker: gorgNMarker, aspect: "N", base: "6,900 ft", trailhead: southForkTH, summit: "11,500 ft", angle: "30-35")
        
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
        let charLine = GMSPolyline(path: charPath)
        charLine.strokeWidth = 3
        charLine.strokeColor = .red
        let charDLMarker = GMSMarker()
        charDLMarker.position = CLLocationCoordinate2D(latitude: 34.114789, longitude: -116.852401)
        charDLMarker.title = "Charlton Peak"
        charDLMarker.snippet = "Dog Leg"
        charDLMarker.icon = GMSMarker.markerImage(with: .blue)
        let charDL = Tour(title: "Charlton Peak: Dog Leg", path: charLine, id: "34.114789 -116.852401", imageURL: [#imageLiteral(resourceName: "dl1"), #imageLiteral(resourceName: "dl2"), #imageLiteral(resourceName: "dl3")], distance: "5.5 miles", description: "A popular easterly facing gully down Charlton which tends to act as a catcher's mitt for snow during most storms. The steep, north facing trees above this run are known to slide, as can be seen in the second photo (Valentines Day 2019 from Socalsnow.org, after a large atmospheric river and high snow levels). Although the north facing trees directly above this gully are steep, the actually line itself is very manageable and one of the more mellow descents down Chalrton. Much of this line is east facing so snow quality can deteriorate quite quickly as the morning sunlight cooks the surface in late winter/spring, while the other side of the mountain may still be soft and powdery. Follow the normal route to Charlton Peak along the South Fork Trail and the entrance to the chute is a short distance in the NE direction from the summit. The first few hundred feet of the descent has some well spaced trees but the gully opens up quite quickly. ", marker: charDLMarker, aspect: "NE", base: "6,900 ft", trailhead: southForkTH, summit: "10,800 ft", angle: "30")
        
        let charMPath = charPath.mutableCopy()
        (charMPath as AnyObject).add(CLLocationCoordinate2D(latitude: 34.116171, longitude: -116.853881))
        let charMLine = GMSPolyline(path: (charMPath as! GMSPath))
        charMLine.strokeWidth = 3
        charMLine.strokeColor = .red
        let charMainMarker = GMSMarker()
        charMainMarker.position = CLLocationCoordinate2D(latitude: 34.116171, longitude: -116.853881)
        charMainMarker.title = "Charlton Peak"
        charMainMarker.snippet = "Main Gully"
        charMainMarker.icon = GMSMarker.markerImage(with: .blue)
        let charMain = Tour(title: "Charlton Peak: Main Gully", path: charMLine, id: "34.116171 -116.853881", imageURL: [#imageLiteral(resourceName: "main0"), #imageLiteral(resourceName: "mainchar"),  #imageLiteral(resourceName: "main3"), #imageLiteral(resourceName: "main2"), #imageLiteral(resourceName: "main5")], distance: "5.5 miles", description: "The main attraction on Charlton and a 2,000+ ft descent down a sustained, north facing gully which is prone to slide during/after storms. This area is high elevation and has decent wind protection so the north side of the mountain can hold soft snow well after a storm during winter months. There are various chutes if the main chute is tracked-out but they all take some navigating through some trees to get to so take a good look at the mountain before heading up. Follow the South Fork Trail for about 3.5 miles then cross the South Fork meadows and make your way up the low-angle, eastern ridge of Charlton as the route shows on the map. The entrance to the chute is within 400 feet from the summit and is visible next to a pile of rocks in the northerly direction.", marker: charMainMarker, aspect: "N", base: "6,900 ft", trailhead: southForkTH, summit: "10,800 ft", angle: "30-35")

        let charDPath = (charMPath as AnyObject).mutableCopy()
        (charDPath as AnyObject).add(CLLocationCoordinate2D(latitude: 34.116468, longitude: -116.854931))
        let charDLine = GMSPolyline(path: (charDPath as! GMSPath))
        charDLine.strokeWidth = 3
        charDLine.strokeColor = .red
        let charDolMarker = GMSMarker()
        charDolMarker.position = CLLocationCoordinate2D(latitude: 34.116468, longitude: -116.854931)
        charDolMarker.title = "Charlton Peak"
        charDolMarker.snippet = "Dollar Col"
        charDolMarker.icon = GMSMarker.markerImage(with: .blue)
        let charDol = Tour(title: "Charlton Peak: Dollar Col", path: charDLine, id: "34.116468 -116.854931", imageURL: [#imageLiteral(resourceName: "dol4"), #imageLiteral(resourceName: "dol5"), #imageLiteral(resourceName: "IMG_1212"), #imageLiteral(resourceName: "dol1"), #imageLiteral(resourceName: "dol6"), #imageLiteral(resourceName: "dol3")], distance: "5.5 miles", description: "Tucked away on the backside of the mountain, this chute is often overlooked by many riders. Although the entrance to the line is hidden by trees, this side of the mountain is worth checking out if the main lines are tracked-out or you are doing multiple laps. This chute rides very similar to the other Charlton chutes in terms of steepness but is a bit shorter and can have more variable snow due to its afternoon sun exposure. There are steeper and more complex north facing chutes just above Dollar Lake that could be worth checking out as well. Follow the normal route to Charlton Peak along the South Fork Trail and navigate through the trees in the NW direction until you find the entrance. After skiing the chute, walk past Dollar Lake and up a small hill until you are able to drop in again to meet up with the Main gully.", marker: charDolMarker, aspect: "NW", base: "6,900 ft", trailhead: southForkTH, summit: "10,800 ft", angle: "30")
        
        let altPath = GMSMutablePath()
        altPath.add(CLLocationCoordinate2D(latitude: 34.161167, longitude: -116.871683))
        altPath.add(CLLocationCoordinate2D(latitude: 34.158697, longitude: -116.871030))
        altPath.add(CLLocationCoordinate2D(latitude: 34.157153, longitude: -116.867553))
        altPath.add(CLLocationCoordinate2D(latitude: 34.155129, longitude: -116.868068))
        altPath.add(CLLocationCoordinate2D(latitude: 34.147831, longitude: -116.855580))
        altPath.add(CLLocationCoordinate2D(latitude: 34.144195, longitude: -116.853840))
        altPath.add(CLLocationCoordinate2D(latitude: 34.136789, longitude: -116.858281))
        altPath.add(CLLocationCoordinate2D(latitude: 34.131813, longitude: -116.866294))
        let altoLine = GMSPolyline(path: altPath)
        altoLine.strokeWidth = 3
        altoLine.strokeColor = .red
        let altoMarker = GMSMarker()
        altoMarker.position = CLLocationCoordinate2D(latitude: 34.131813, longitude: -116.866294)
        altoMarker.title = "Alto Diablo"
        altoMarker.snippet = "Avy Path"
        altoMarker.icon = GMSMarker.markerImage(with: .blue)
        let altoDiablo = Tour(title: "Alto Diablo: Avy Path", path: altoLine, id: "34.131813 -116.866294", imageURL: [#imageLiteral(resourceName: "alt2"), #imageLiteral(resourceName: "alt1"), #imageLiteral(resourceName: "alt4")], distance: "3.5 miles", description: "One of the closer descents along the South Fork trail, this avalanche path offers two moderate open pitches; the upper one being subject to windloading and some massive avalanches in the last decade. The upper pitch has some short, steep chutes that are great for doing multiple laps and practicing for more committing terrain in the area. There is another bowl which is just behind the upper pitch and is very similar in terraimn-style, as can be seen in the 3rd pic. Follow the South Fork Trail for about 2 miles until the lower pitch (a large clearing of trees) comes into view, then follow the lower and upper pitch up to the summit. Alternatively, approach via the north facing trees route.", marker: altoMarker, aspect: "NE", base: "6,900 ft", trailhead: southForkTH, summit: "10,200 ft", angle: "30")
        
        let altTPath = GMSMutablePath()
        altTPath.add(CLLocationCoordinate2D(latitude: 34.161167, longitude: -116.871683))
        altTPath.add(CLLocationCoordinate2D(latitude: 34.158697, longitude: -116.871030))
        altTPath.add(CLLocationCoordinate2D(latitude: 34.157153, longitude: -116.867553))
        altTPath.add(CLLocationCoordinate2D(latitude: 34.155129, longitude: -116.868068))
        altTPath.add(CLLocationCoordinate2D(latitude: 34.147831, longitude: -116.855580))
        altTPath.add(CLLocationCoordinate2D(latitude: 34.137137, longitude: -116.865891))
        let altoTreesLine = GMSPolyline(path: altTPath)
        altoTreesLine.strokeWidth = 3
        altoTreesLine.strokeColor = .red
        let altoTreesMarker = GMSMarker()
        altoTreesMarker.position = CLLocationCoordinate2D(latitude: 34.137137, longitude: -116.865891)
        altoTreesMarker.title = "Alto Diablo"
        altoTreesMarker.snippet = "North Trees"
        altoTreesMarker.icon = GMSMarker.markerImage(with: .blue)
        let altoDiabloTrees = Tour(title: "Alto Diablo: North Trees", path: altoTreesLine, id: "34.137137 -116.865891", imageURL: [#imageLiteral(resourceName: "IMG_1213"), #imageLiteral(resourceName: "alt3"), #imageLiteral(resourceName: "alt5")], distance: "3.5 miles", description: "The closest descent along the South Fork trail, these small gullies and well-spaced trees have a relatively easy approach, especially when snow coverage is adequate. Nearly the entire South Fork trail is a burn area and so is this descent, so there are many fallen trees and new-growth bushes scattered throughout the landscape that must be covered. This area makes for good storm day/post storm day riding due to its low-angle slopes, protection from the wind and higher elevation for more powdery snow. Follow the South Fork Trail for about 1.5 miles and skin up the north facing trees and series of small gullies until you reach your desired elevation.", marker: altoTreesMarker, aspect: "N", base: "6,900 ft", trailhead: southForkTH, summit: "10,000 ft", angle: "25")
        
        let sugPath = GMSMutablePath()
        sugPath.add(CLLocationCoordinate2D(latitude: 34.231631, longitude: -116.806132))
        sugPath.add(CLLocationCoordinate2D(latitude: 34.225995, longitude: -116.813088))
        sugPath.add(CLLocationCoordinate2D(latitude: 34.218608, longitude: -116.805902))
        sugPath.add(CLLocationCoordinate2D(latitude: 34.215235, longitude: -116.803571))
        sugPath.add(CLLocationCoordinate2D(latitude: 34.215126, longitude: -116.795548))
        sugPath.add(CLLocationCoordinate2D(latitude: 34.209479, longitude: -116.794252))
        sugPath.add(CLLocationCoordinate2D(latitude: 34.204253, longitude: -116.796951))
        let sugLine = GMSPolyline(path: sugPath)
        sugLine.strokeWidth = 3
        sugLine.strokeColor = .red
        let sugarloafMarker = GMSMarker()
        sugarloafMarker.position = CLLocationCoordinate2D(latitude: 34.204253, longitude: -116.796951)
        sugarloafMarker.title = "Sugarloaf"
        sugarloafMarker.snippet = "Rock Bowl"
        sugarloafMarker.icon = GMSMarker.markerImage(with: .blue)
        let sugarloaf = Tour(title: "Sugarloaf: Rock Bowl", path: sugLine, id: "34.204253 -116.796951", imageURL: [#imageLiteral(resourceName: "sug2"), #imageLiteral(resourceName: "sug"), #imageLiteral(resourceName: "sug3")], distance: "3-5 miles", description: "A low-angle tour which offers sheltered trees, long gullies, and a few open bowls. The summit is a medium-full day but there are plenty of shorter tours to be had around this mountain. The snow quality is usually decent up high and since much of the mountain is north facing trees, it holds soft snow quite well during winter months. Follow forest road 2N23 for a mile or so and branch off the road for your desired tour. It's nice to have a GPS with topography to navigate this mountain since it's all trees and hard to get a good read on location just from looking around.", marker: sugarloafMarker, aspect: "NE", base: "7,000 ft", trailhead: sugarTH, summit: "9,400 ft", angle: "20-25")
        
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
        let sorted = tempTours.sorted(by: { $0.tourTitle < $1.tourTitle })
        return completion(sorted)
    }
}
