//
//  Bio.swift
//  C4QStudentBook
//
//  Created by Tom Seymour on 9/30/16.
//  Copyright © 2016 C4Q-3.2. All rights reserved.
//
// [
//"fullName": "Jason Wang",
//"email":"qwang216@gmail.com",
//"imageName": "jason",
//],


import Foundation

class Bio {
    let firstName: String
    let lastName: String
    let imageName: String
    let email: String
    
    init(bioDict: [String: Any]) {
        if let fullName = bioDict["fullName"] as? String, let emailString = bioDict["email"] as? String, let imageNameString = bioDict["imageName"] as? String {
            self.email = emailString
            self.imageName = imageNameString
            let fullNameArray = fullName.components(separatedBy: " ")
            if let fn = fullNameArray.first {
                self.firstName = fn
            } else {
                self.firstName = "noFirstName"
            }
            if let ln = fullNameArray.last {
                self.lastName = ln
            } else {
                self.lastName = "noLastName"
            }
        } else {
            self.firstName = "N/A"
            self.lastName = "N/A"
            self.email = "N/A"
            self.imageName = "C4Q_logo"
        }
    }
}
