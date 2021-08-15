//
//  ErrorService.swift
//  BCLog
//
//  Created by Jason Panella on 8/11/21.
//  Copyright © 2021 Jason Panella. All rights reserved.
//

import Foundation

enum ValidationError: Error {
        case invalidCredentials
        case emptyTextFields
        case passwordsMustMatch
}
        
extension ValidationError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidCredentials:
            return NSLocalizedString(
                "Username and/or passsword is incorrect.",
                comment: ""
            )
        case .emptyTextFields:
            return NSLocalizedString(
                "Fields cannot be empty.",
                comment: ""
            )
        case .passwordsMustMatch:
            return NSLocalizedString(
                "Passwords do not match",
                comment: ""
            )
        }
    }
}
