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
    
    private var databaseInstance = Firestore.firestore()
    
    static func handleSignIn(email: String, password: String, completion: @escaping(Error?) ->()) {
        
        Auth.auth().signIn(withEmail: email, password: password) { user, error in

            guard error != nil && user == nil else {
                guard let userID = Auth.auth().currentUser?.uid else { return }
                UserService.observeUserProfile(userID) { userProfile in
                    UserService.currentUserProfile = userProfile
                }
                completion(error)
                return
            }
            completion(error)
        }
    }
    
    static func handleSignUp(email: String, password: String, completion: @escaping(Error?) ->()) {
        
        Auth.auth().createUser(withEmail: email, password: password) { user, error in
            
            guard error != nil && user == nil else {
                guard let userID = Auth.auth().currentUser?.uid else { return }
                UserService.currentUserProfile = User(userID: userID, favoriteTours: [])
                
                completion(error)
                return
            }
            completion(error)
        }
    }
    
    static func handlePasswordRecoveryEmail (email: String, completion: @escaping(Error?) ->()) {
        Auth.auth().sendPasswordReset(withEmail: email) { error in
           completion(error)
        }
    }
    
    private func addToFavorites(tourID: String, completion: @escaping(Error?) ->()) {
        
        databaseInstance.collection("user_favorites").addDocument(data: [
            "tour_id": tourID,
            "user_id": UserService.currentUserProfile?.userID as Any])
        {  error in
            
            guard error == nil else {
                completion(error)
                return
            }
            completion(error)
        }
    }
    
    static func removeFromFavorites(tourID: String, completion: @escaping(Error?) ->()) {

        let db = Firestore.firestore()

        db.collection("user_favorites").whereField("tour_id", isEqualTo: tourID).whereField("user_id", isEqualTo: UserService.currentUserProfile?.userID as Any)
            .getDocuments() { (querySnapshot, error) in
                
                guard error == nil else {
                    print(error?.localizedDescription ?? "")
                    completion(error)
                    return
                }
                
                if !querySnapshot!.documents.isEmpty {
                    db.collection("user_favorites").document(querySnapshot!.documents[0].documentID).delete() { removeError in
                        guard removeError == nil else {
                            completion(removeError)
                            return
                        }
                        completion(removeError)
                    }
                }
        }
    }
    
    
    
}
