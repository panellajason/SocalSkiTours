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
        
        BigBearTours.loadTours { newTours in
            tempTours.append(contentsOf: newTours)
        }
        SanGabrielsTours.loadTours { moreTours in
            tempTours.append(contentsOf: moreTours)
        }
        
        return completion(tempTours)
    }
    
    static func findTour(withId id:String, completion:@escaping (_ tour:Tour)->()) {
        for tour in allTours {
            if tour.tourID == id {
                return completion(tour)
            }
        }
        return completion(allTours[0])
    }
  
    
}
