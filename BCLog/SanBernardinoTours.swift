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
        let jepsonNW = Tour(path: sfPath, id: "34.103435 -116.847386", imageURL: [#imageLiteral(resourceName: "jepson_nw"), #imageLiteral(resourceName: "IMG_4364"), #imageLiteral(resourceName: "IMG_0673"), #imageLiteral(resourceName: "DDF34D9F-6ABB-4F2A-A1CE-3BB8D4CB6A4C"), #imageLiteral(resourceName: "IMG_1214"), #imageLiteral(resourceName: "IMG_1185")], distance: "6 miles", description: "Three defined, north facing chutes with many others that come to life on good snow years. This is the alpine so cornices are common on many of the entrances to these chutes in winter and wind-affect is as well. These chutes are typically rideable well into spring if we've had a decent snow year, sometimes early summer. The looker's right chutes are more complex and tighter while the three main chutes are very open and straightforward. Follow the South Fork Trail for 3.5 miles, then cross the South Fork meadows and continue up through the trees. The terrain will become a series of small gullies but head in the SW direction and follow the gullies up and around Charlton Peak until the trees begin to clear. Continue up this old avalanche path until you are able to see the obvious saddle between Jepson and Little Charlton Peak; boot or skin up this and follow Jepson's ridge up to the summit.", title: "Jepson Peak: N Chutes", aspect: "N", base: "6,900 ft", trailhead: "South Fork Trailhead", summit: "11,200 ft", angle: "35-40")
        
        let nePath = sfPath.mutableCopy()
        (nePath as AnyObject).add(CLLocationCoordinate2D(latitude: 34.101618, longitude: -116.843024))
        let jepsonNE = Tour(path: nePath as! GMSMutablePath, id: "34.101618 -116.843024", imageURL: [#imageLiteral(resourceName: "jepson_ne"), #imageLiteral(resourceName: "IMG_1402"), #imageLiteral(resourceName: "IMG_0794"), #imageLiteral(resourceName: "IMG_0875"), #imageLiteral(resourceName: "IMG_1216")], distance: "6.5 miles", description: "Similar to the N chutes, except these are slightly steeper and more technical. In good corn cycles, these chutes and the N chutes are a great link-up since these will soften first due to their easterly exposure to the sun. This exposure also allows these chutes to heat up fairly quickly and wet slides are common in spring. Cornices form at the entrances to some of these chutes after storms and wind-affected snow is common, but there are some golden days when conditions are soft powder and stable in late winter/early spring. Follow either the Big Draw route or the Jepson N chutes route; I prefer the Jepson N chutes routes as it is slightly shorter.", title: "Jepson Peak: NE Chutes", aspect: "NE", base: "6,900 ft", trailhead: "South Fork Trailhead", summit: "11,200 ft", angle: "35-40")
        
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
        let bigdraw = Tour(path: gorgPath, id: "34.099683 -116.838692", imageURL: [#imageLiteral(resourceName: "big_draw"), #imageLiteral(resourceName: "IMG_0913"), #imageLiteral(resourceName: "IMG_0058"), #imageLiteral(resourceName: "IMG_0878")], distance: "6.5 miles", description: "One of the most classic descents in Southern California, the Big Draw has been skied since the early 1900s (San Gorgonio Ski Club) and the area was petitioned to become a ski resort in the 1940s but failed. Today, it is known as a rite of passage in Socal backcountry skiing and offers the easiest way up the San G/Jepson saddle. The Big Draw is an excellent catcher's mitt for snow as it is a large bowl positioned between two windstrewn peaks. It usually is the last remaining snow in southern California, sometimes having patches into July. In 2019, this was skiable for several thousand feet well into June. Follow the South Fork Trail for 3.5 miles, then cross the South Fork meadows and continue up through the trees. The terrain will become a series of small gullies but head in the SE direction and the terrain will flatten out, the trees will clear, and the Big Draw bowl will be the saddle between San G's NW chutes and Jepson's NE chutes. If conditions allow, skinning up the entirety of this bowl without switching to bootpacking is manageable.", title: "San Gorgonio: The Big Draw", aspect: "N", base: "6,900 ft", trailhead: "South Fork Trailhead", summit: "11,200 ft", angle: "30-35")
        
        let nwPath = gorgPath.mutableCopy()
        (nwPath as AnyObject).add(CLLocationCoordinate2D(latitude: 34.099769, longitude: -116.836071))
        (nwPath as AnyObject).add(CLLocationCoordinate2D(latitude: 34.101406, longitude: -116.834642))
        let gorgNW = Tour(path: nwPath as! GMSMutablePath, id: "34.101406 -116.834642", imageURL: [#imageLiteral(resourceName: "IMG_8932"), #imageLiteral(resourceName: "gorg_nw"), #imageLiteral(resourceName: "nwchu")], distance: "6.5 miles", description: "Often overlooked for the more popular descents nearby, these chutes offer steep, sustained drops which need a decent amount of snowfall to become rideable. This area is subject to very high winds and variable riding conditions, so spring is usually the best season when trying to ride these chutes. Due to their westerly exposure, these chutes usually soften later in the day and are a great link up with Jepson's NE chutes. Follow the Big Draw route and continue along the San Gorgonio ridge in the NE direction until you find your desired chute.", title: "San Gorgonio: NW Chutes", aspect: "NW", base: "6,900 ft", trailhead: "South Fork Trailhead", summit: "11,200 ft", angle: "40-45")
        
        let nPath = (nwPath as AnyObject).mutableCopy()
        (nPath as AnyObject).add(CLLocationCoordinate2D(latitude: 34.101979, longitude: -116.830673))
        let gorgN = Tour(path: nPath as! GMSMutablePath, id: "34.101979 -116.830673", imageURL: [#imageLiteral(resourceName: "IMG_1436"), #imageLiteral(resourceName: "gorg_n"), #imageLiteral(resourceName: "IMG_9002"), #imageLiteral(resourceName: "gorg1")], distance: "6.5 miles", description: "The tallest mountain in Southern California at 11,500 ft and a moderate 2,000 ft descent down broad chutes. This area was under threat of development in the mid 1900s, but the ultimate decision was that “San Gorgonio Primitive Area has a higher public value as a wilderness and a watershed than as a downhill ski area”. Winter skiing conditions are variable at this elevation due to wind, with the upper few hundred feet of the chutes usually being wind-stripped. The north face of San G is known for its massive avalanches (See pic 4 of the 2019 Valentines Day slides courtesy of Socalsnow.org; these occurred after a large atmopsheric river and high snow levels). Spring is the most popular season to ride and climb Gorgonio (the snow is consolidated and quick to travel on, the days are longer, and the riding conditions are consistent). If skiing conditions are favorable, these chutes feel like your average black-diamond ski resort run despite the mountain looking like a giant from afar. Follow the Big Draw route and follow the San Gorgonio ridge to the north face; or branch off before the North chutes and climb those for a slightly steeper but more direct route. Note: the actual summit of San Gorgonio is about a mile in the easterly direction from this descent and offers no additional skiing, unless you are looking to drop in to the steep bowl just below the summit.", title: "San Gorgonio: North Slope", aspect: "N", base: "6,900 ft", trailhead: "South Fork Trailhead", summit: "11,500 ft", angle: "30-35")
        
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
        let charDL = Tour(path: charPath, id: "34.114789 -116.852401", imageURL: [#imageLiteral(resourceName: "dl1"), #imageLiteral(resourceName: "dl2"), #imageLiteral(resourceName: "dl3")], distance: "5.5 miles", description: "This gully tends to act as a catcher's mitt for snow during most storms. The steep, north facing trees above this run are known to slide, as can be seen in the second photo (Valentines Day slides 2019 from Socalsnow.org after a large atmospheric river and high snow levels). Although the north facing trees directly above this gully are steep, the actually line itself is very manageable and probably the most mellow descent down Chalrton. Much of this gully, especially the upper 1,000 ft or so, is east facing so it heats up quickly in the morning sunlight during late winter/spring. Follow the normal route to Charlton Peak along the South Fork Trail and the entrance to the chute is a short distance in the NE direction from the summit. The first few hundred feet of the descent has some well spaced trees but the gully opens up quite quickly. ", title: "Charlton Peak: Dog Leg", aspect: "NE", base: "6,900 ft", trailhead: "South Fork Trailhead", summit: "10,800 ft", angle: "30")
        
        let charMPath = charPath.mutableCopy()
        (charMPath as AnyObject).add(CLLocationCoordinate2D(latitude: 34.116171, longitude: -116.853880))
        let charMain = Tour(path: charMPath as! GMSMutablePath, id: "34.116171 -116.853880", imageURL: [#imageLiteral(resourceName: "main0"), #imageLiteral(resourceName: "main3"), #imageLiteral(resourceName: "main2"), #imageLiteral(resourceName: "main5")], distance: "5.5 miles", description: "A 2,000+ ft descent down a sustained gully which is prone to slide during/after storms. The gully itself is only about 30-35 degrees but the sides of the gully are 38-40 degrees and are a prime angle for sliding. This area is generally protected from winds and high elevation so the north side of the mountain can hold soft snow well after a storm in winter. There are various chutes if the main chute is tracked-out but they all take some navigating through some trees to get to. Follow the South Fork Trail for about 3.5 miles then cross the South Fork meadows and make your way up the low-angle, eastern side of Charlton as the route shows on the map. The entrance to the chute is about 400 ft away and can be seen from the summit, next to a pile of rocks in the north direction.", title: "Charlton Peak: Main Gully", aspect: "N", base: "6,900 ft", trailhead: "South Fork Trailhead", summit: "10,800 ft", angle: "30-35")

        let charDPath = (charMPath as AnyObject).mutableCopy()
        (charDPath as AnyObject).add(CLLocationCoordinate2D(latitude: 34.116468, longitude: -116.854930))
        let charDol = Tour(path: charDPath as! GMSMutablePath, id: "34.116468 -116.854930", imageURL: [#imageLiteral(resourceName: "dol4"), #imageLiteral(resourceName: "dol5"), #imageLiteral(resourceName: "IMG_1212"), #imageLiteral(resourceName: "dol1"), #imageLiteral(resourceName: "dol6"), #imageLiteral(resourceName: "dol3")], distance: "5.5 miles", description: "Tucked away on the backside of the mountain, this chute is often overlooked by many riders. Although the entrance to the line is hidden by trees, this side of the mountain is worth checking out if the main lines are tracked-out. This chute rides very similar to the other Charlton chutes in terms of steepness but is a bit shorter and tends to have more variable snow due to its afternoon sun exposure. There are steeper and more complex north facing chutes just above Dollar Lake that could be worth checking out as well. Follow the normal route to Charlton Peak along the South Fork Trail and navigate through the trees in the NW direction until you find the entrance. After skiing the chute, walk past Dollar Lake and up a small hill until you are able to drop in again to meet up with the Main gully.", title: "Charlton Peak: Dollar Col", aspect: "NW", base: "6,900 ft", trailhead: "South Fork Trailhead", summit: "10,800 ft", angle: "30")
        
        let altPath = GMSMutablePath()
        altPath.add(CLLocationCoordinate2D(latitude: 34.161167, longitude: -116.871683))
        altPath.add(CLLocationCoordinate2D(latitude: 34.158697, longitude: -116.871030))
        altPath.add(CLLocationCoordinate2D(latitude: 34.157153, longitude: -116.867553))
        altPath.add(CLLocationCoordinate2D(latitude: 34.155129, longitude: -116.868068))
        altPath.add(CLLocationCoordinate2D(latitude: 34.147831, longitude: -116.855580))
        altPath.add(CLLocationCoordinate2D(latitude: 34.144195, longitude: -116.853840))
        altPath.add(CLLocationCoordinate2D(latitude: 34.136789, longitude: -116.858281))
        altPath.add(CLLocationCoordinate2D(latitude: 34.131813, longitude: -116.866294))
        let altoDiablo = Tour(path: altPath, id: "34.131813 -116.866294", imageURL: [#imageLiteral(resourceName: "alt2"), #imageLiteral(resourceName: "alt1"), #imageLiteral(resourceName: "alt4")], distance: "3.5 miles", description: "One of the closer descents along the South Fork trail, this avalanche path offers two moderate open pitches; the upper one being subject to windloading and some massive avalanches in the last decade. The upper pitch has some short, steep chutes that are great for doing multiple laps and practicing for more committing terrain in the area. There is another bowl which is behind the upper pitch and is very similar in style, as can be seen in the 3rd pic. Follow the South Fork Trail for about 2 miles until the lower pitch (a large clearing of trees) comes into view, then follow the lower and upper pitch up to the summit. Alternatively, approach via the north facing trees.", title: "Alto Diablo: Avy Path", aspect: "NE", base: "6,900 ft", trailhead: "South Fork Trailhead", summit: "10,200 ft", angle: "30")
        
        let altTPath = GMSMutablePath()
        altTPath.add(CLLocationCoordinate2D(latitude: 34.161167, longitude: -116.871683))
        altTPath.add(CLLocationCoordinate2D(latitude: 34.158697, longitude: -116.871030))
        altTPath.add(CLLocationCoordinate2D(latitude: 34.157153, longitude: -116.867553))
        altTPath.add(CLLocationCoordinate2D(latitude: 34.155129, longitude: -116.868068))
        altTPath.add(CLLocationCoordinate2D(latitude: 34.147831, longitude: -116.855580))
        altTPath.add(CLLocationCoordinate2D(latitude: 34.137137, longitude: -116.865890))
        let altoDiabloTrees = Tour(path: altTPath, id: "34.137137 -116.865890", imageURL: [#imageLiteral(resourceName: "IMG_1213"), #imageLiteral(resourceName: "alt3"), #imageLiteral(resourceName: "alt5")], distance: "3.5 miles", description: "The closest descent along the South Fork trail, these small gullies and well-spaced trees have a relatively easy approach, especially when snow coverage is adequate. Nearly the entire South Fork trail is a burn area and so is this descent, so there are many fallen trees and new-growth bushes scattered throughout the landscape that must be covered. This area makes for good storm day/post storm day riding due to its low-angle slopes, protection from the wind and higher elevation for more powdery snow. Follow the South Fork Trail for about 1.5 miles and skin up the north facing trees and series of small gullies until you reach your desired elevation.", title: "Alto Diablo: North Trees", aspect: "NE", base: "6,900 ft", trailhead: "South Fork Trailhead", summit: "10,000 ft", angle: "25")
        
        let sugPath = GMSMutablePath()
        sugPath.add(CLLocationCoordinate2D(latitude: 34.231631, longitude: -116.806132))
        sugPath.add(CLLocationCoordinate2D(latitude: 34.225995, longitude: -116.813088))
        sugPath.add(CLLocationCoordinate2D(latitude: 34.218608, longitude: -116.805902))
        sugPath.add(CLLocationCoordinate2D(latitude: 34.215235, longitude: -116.803571))
        sugPath.add(CLLocationCoordinate2D(latitude: 34.215126, longitude: -116.795548))
        sugPath.add(CLLocationCoordinate2D(latitude: 34.209479, longitude: -116.794252))
        sugPath.add(CLLocationCoordinate2D(latitude: 34.204253, longitude: -116.796951))
        let sugarloaf = Tour(path: sugPath, id: "34.204253 -116.796951", imageURL: [#imageLiteral(resourceName: "sug2"), #imageLiteral(resourceName: "sug"), #imageLiteral(resourceName: "sug3")], distance: "3-5 miles", description: "A low-angle tour which offers sheltered trees, long gullies, and a few open bowls. The summit is a medium-full day but there are plenty of shorter tours to be had around this mountain. The snow quality is usually decent up high and since much of the mountain is north facing trees, it holds soft snow quite well in winter. Follow forest road 2N23 for a mile or so and branch off the road for your desired tour. It's nice to have a GPS with topography to navigate this mountain since it's all trees and hard to get a good read on location just from looking around.", title: "Sugarloaf: Rock Bowl/Summit", aspect: "NE", base: "7,000 ft", trailhead: "2N23 and CA 38", summit: "9,400-10,000 ft", angle: "20-25")
        
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
