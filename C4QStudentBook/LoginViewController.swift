//
//  LoginViewController.swift
//  C4QStudentBook
//
//  Created by Tom Seymour on 10/5/16.
//  Copyright © 2016 C4Q-3.2. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    var students = [Student]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTextField.delegate = self
        for studentDict in ac32_students {
            students.append(Student(studentDict: studentDict))
        }
    }
    

    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == self.passwordTextField {
            if let charactersCount = self.passwordTextField.text?.characters.count {
        
                if charactersCount >= 3 {
                    loginButton.backgroundColor = .blue
                } else {
                    loginButton.backgroundColor = .red
                }
            }
        }
        return true
    }

    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        guard let emailString = emailTextField.text else { return }
        guard let pwString = passwordTextField.text else { return }
        
        guard let student = students.filter({ $0.info.email == emailString }).first else {
            showError(message: "Unknown Email Address")
            return
        }
        if pwString == String(student.id) {
            
            performSegue(withIdentifier: "loginToTableViewSegue", sender: student)
            
        } else {
            showError(message: "Invalid Password")
        }
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "loginToTableViewSegue" {
            let navCon = segue.destination as? UINavigationController
            let destinationVC = navCon?.topViewController as? StudentsTableViewController
            destinationVC?.currentStudent = sender as? Student
            
        }
    }
    
    func showError(message: String) {
        let errorAlertView = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let okayAction = UIAlertAction(title: "Okay", style: .cancel, handler: nil)
        errorAlertView.addAction(okayAction)
        present(errorAlertView, animated: true, completion: nil)
    }
    
}
