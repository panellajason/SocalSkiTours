//
//  TourService.swift
//  BCLog
//
//  Created by Jason Panella on 6/2/21.
//  Copyright © 2021 Jason Panella. All rights reserved.
//

import Foundation

class TourService {
    
    static var allTours = [Tour]()
    
    static func loadAllTours(completion:@escaping (_ tours:[Tour])->()) {
        var tempTours = [Tour]()
        
        SanBernardinoTours.loadTours { newTours in
            tempTours.append(contentsOf: newTours)
        }
        SanGabrielsTours.loadTours { moreTours in
            tempTours.append(contentsOf: moreTours)
        }
        SanJacintoTours.loadTours { moreTours in
            tempTours.append(contentsOf: moreTours)
        }
        let sorted = tempTours.sorted(by: { $0.tourTitle < $1.tourTitle })
        return completion(sorted)
    }
    
    static func findTour(withId id:String, completion:@escaping (_ tour:Tour)->()) {
        
        for tour in allTours where tour.tourID == id {
            return completion(tour)
        }
        return completion(allTours[0])
    }
}
