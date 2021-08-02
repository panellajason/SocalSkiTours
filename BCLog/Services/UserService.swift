//
//  UserService.swift
//  BCLog
//
//  Created by Jason Panella on 6/12/20.
//  Copyright © 2020 Jason Panella. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestore


class UserService {
    
    static var currentUserProfile:User?
    static var ref: DocumentReference? = nil
    static var db = Firestore.firestore()
    
    static func observeUserProfile(_ uid:String, completion: @escaping ((_ userProfile:User?)->())) {
                    
            db.collection("user_favorites").whereField("user_id", isEqualTo: uid)
            .addSnapshotListener { querySnapshot, error in
                guard let documents = querySnapshot?.documents else {
                    print("Error fetching documents: \(error!)")
                    return
                }
                
                var favoriteTours = [Tour]()
                let favorites = documents.map { $0["tour_id"]! }
                for favorite in favorites {
                    for tour in TourService.allTours {
                        if tour.tourID == (favorite as! String) {
                            favoriteTours.append(tour)
                        }
                    }
                }
                return(completion(User(userID: uid, favoriteTours: favoriteTours)))
            }
    }
}
