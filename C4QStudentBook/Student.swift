//
//  Student.swift
//  C4QStudentBook
//
//  Created by Tom Seymour on 9/30/16.
//  Copyright © 2016 C4Q-3.2. All rights reserved.
//


//"info": [
//"fullName": "Jason Wang",
//"email":"qwang216@gmail.com",
//"imageName": "jason",
//],
//"studentID": 3200,
//"github": "qwang216",
//"linkedin": "jasonqwang",
//"funFact": "I code for food"
import Foundation

class Student {
    let id: Int
    let github: String
    let linkedIn: String
    let funFact: String
    let info: Bio
    
    init(studentDict: [String: Any]) {
        if let fact = studentDict["funFact"] as? String, let studentID = studentDict["studentID"] as? Int, let githubAcc = studentDict["github"] as? String, let linkedInAcc = studentDict["linkedin"] as? String, let studentInfo = studentDict["info"] as? [String: Any] {
            self.funFact = fact
            self.id = studentID
            self.github = githubAcc
            self.linkedIn = linkedInAcc
            self.info = Bio(bioDict: studentInfo)
        } else {
            self.funFact = "N/A"
            self.id = 0
            self.github = "N/A"
            self.linkedIn = "N/A"
            self.info = Bio(bioDict: ["": ""])
        }
    
    }
    
}
