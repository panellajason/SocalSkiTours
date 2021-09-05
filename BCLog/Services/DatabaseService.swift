//
//  DatabaseService.swift
//  BCLog
//
//  Created by Jason Panella on 8/11/21.
//  Copyright © 2021 Jason Panella. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth

class DatabaseService {
    
    private static var databaseInstance = Firestore.firestore()
    static var currentUserProfile:User?

    static func handleSignIn(email: String, password: String, completion: @escaping(Error?) ->()) {
        
        Auth.auth().signIn(withEmail: email, password: password) { user, error in

            guard error == nil && user != nil else {
                completion(error)
                return
            }
            
            guard let userID = Auth.auth().currentUser?.uid else { return }
            
            observeUserProfile(userID) { userProfile in
                currentUserProfile = userProfile
            }
            completion(error)
        }
    }
    
    static func handleSignUp(email: String, password: String, completion: @escaping(Error?) ->()) {
        
        Auth.auth().createUser(withEmail: email, password: password) { user, error in
            
            guard error == nil && user != nil else {
                completion(error)
                return
            }
            
            guard let userID = Auth.auth().currentUser?.uid else { return }
            currentUserProfile = User(userID: userID, favoriteTours: [])
            completion(error)
        }
    }
    
    static func handlePasswordRecoveryEmail (email: String, completion: @escaping(Error?) ->()) {
        Auth.auth().sendPasswordReset(withEmail: email) { error in
           completion(error)
        }
    }
    
    static func observeUserProfile(_ uid:String, completion: @escaping ((_ userProfile:User?)->())) {
                    
            databaseInstance.collection("user_favorites").whereField("user_id", isEqualTo: uid)
            .addSnapshotListener { querySnapshot, error in
                
                guard let documents = querySnapshot?.documents else { return }
                
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
    
    static func addToFavorites(tourID: String, completion: @escaping(Error?) ->()) {
        
        databaseInstance.collection("user_favorites").addDocument(data: [
            "tour_id": tourID,
            "user_id": currentUserProfile?.userID as Any])
        {  error in
            
            guard error == nil else {
                completion(error)
                return
            }
            //Successfully added Tour to favorites
            completion(error)
        }
    }
    
    static func removeFromFavorites(tourID: String, completion: @escaping(Error?) ->()) {

        databaseInstance.collection("user_favorites").whereField("tour_id", isEqualTo: tourID).whereField("user_id", isEqualTo: currentUserProfile?.userID as Any).getDocuments() { (querySnapshot, error) in
                
                guard error == nil else {
                    completion(error)
                    return
                }
                
                if !querySnapshot!.documents.isEmpty {
                    databaseInstance.collection("user_favorites").document(querySnapshot!.documents[0].documentID).delete() { removeError in
                        
                        guard removeError == nil else {
                            completion(removeError)
                            return
                        }
                        
                        //Successfully removed Tour from favorites
                        completion(removeError)
                    }
                } else {
                    return
                }
        }
    }
    
    static func checkIfTourIsFavorite(tourID: String, completion: @escaping(Error?, Bool) ->()) {

        databaseInstance.collection("user_favorites").whereField("tour_id", isEqualTo: tourID).whereField("user_id", isEqualTo: currentUserProfile?.userID as Any).getDocuments() { (querySnapshot, error) in

                guard error == nil else {
                    completion(error, false)
                    return
                }
                    
                if !querySnapshot!.documents.isEmpty {
                    //The tour is a favorite
                    completion(error, true)
                }
                else {
                    //The tour is not a favorite
                    completion(error, false)
                }
        }
    }
    
    
    
}
