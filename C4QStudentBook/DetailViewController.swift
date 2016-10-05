//
//  DetailViewController.swift
//  C4QStudentBook
//
//  Created by Tom Seymour on 9/30/16.
//  Copyright © 2016 C4Q-3.2. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var emailIDLabel: UILabel!
    
    @IBOutlet weak var studentIDLabel: UILabel!
    
    @IBOutlet weak var funFactTextView: UITextView!
    
    var student: Student?
    
    private var linkedInAcc: String?
    private var githubAcc: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpData()

        // Do any additional setup after loading the view.
    }

    func setUpData() {
        guard let stu = student else { return }
        emailIDLabel.text = stu.info.email
        studentIDLabel.text = "Student ID: \(String(stu.id))"
        funFactTextView.text = stu.funFact
        profileImageView.image = UIImage(named: stu.info.imageName)
        linkedInAcc = stu.linkedIn
        githubAcc = stu.github
        profileImageView.layer.cornerRadius = 100
        profileImageView.layer.masksToBounds = true
        
    }
    
    @IBAction func githubButtonTapped(_ sender: UIButton) {
        guard let github = githubAcc else { return }
        let githubURLString = "https://www.github.com/\(github)"
        guard let url = URL(string: githubURLString) else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
        
        
    }
    @IBAction func linkedInButtonTapped(_ sender: UIButton) {
        guard let linkedIn = linkedInAcc else { return }
        let linkedInURLString = "https://www.linkedin.com/in/\(linkedIn)"
        guard let url = URL(string: linkedInURLString) else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
        
    }
    
    
    
    
    
}
