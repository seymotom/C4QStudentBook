//
//  StudentTableViewCell.swift
//  C4QStudentBook
//
//  Created by Tom Seymour on 9/30/16.
//  Copyright © 2016 C4Q-3.2. All rights reserved.
//

import UIKit

class StudentTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!

    @IBOutlet weak var profileImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        profileImageView.layer.cornerRadius = 37.5
        profileImageView.layer.masksToBounds = true
        
    }
    
    func setData(student: Student) {
        profileImageView.image = UIImage(named: student.info.imageName)
        nameLabel.text = student.info.firstName + " " + student.info.lastName
        emailLabel.text = student.info.email
    }
    
    
    

    
}
