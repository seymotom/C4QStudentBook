//
//  StudentsTableViewController.swift
//  C4QStudentBook
//
//  Created by Tom Seymour on 9/30/16.
//  Copyright © 2016 C4Q-3.2. All rights reserved.
//


import UIKit

class StudentsTableViewController: UITableViewController {
    
    var students = [Student]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Tom Seymour"
        
        for studentDict in ac32_students {
            students.append(Student(studentDict: studentDict))
        }
    }



    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return students.count
    }

    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "studentTVCID", for: indexPath) as! StudentTableViewCell
        let student = students[indexPath.row]
        cell.setData(student: student)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedStudent = self.students[indexPath.row]
        performSegue(withIdentifier: "studentDetailSegueID", sender: selectedStudent)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "studentDetailSegueID" {
            //perform segue on detail view controller
            let detailController = segue.destination as! DetailViewController
            let thisStudentObject = sender as? Student
            detailController.student = thisStudentObject
            
            
        }
    }
    
    

}
