//
//  User.swift
//  BCLog
//
//  Created by Jason Panella on 5/31/20.
//  Copyright © 2020 Jason Panella. All rights reserved.
//

import Foundation

class User {
    var userID: String
    var favoriteTours = [Tour]()

    init(userID:String, favoriteTours: [Tour]) {
        self.userID = userID
        self.favoriteTours = favoriteTours
    }
}


