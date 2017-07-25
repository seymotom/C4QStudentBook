//
//  LoginCell.swift
//  C4QStudentBook
//
//  Created by Tom Seymour on 11/18/16.
//  Copyright © 2016 C4Q-3.2. All rights reserved.
//

import UIKit


class LoginCell: BaseCell {
    
    static let identifyer = "loginCellID"

    let emailTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "email address"
        tf.backgroundColor = UIColor.white
        tf.borderStyle = .roundedRect
        return tf
    }()
    
    let passwordTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "password"
        tf.isSecureTextEntry = true
        tf.backgroundColor = UIColor.white
        tf.borderStyle = .roundedRect

        return tf
    }()
    
    lazy var loginButton: UIButton = {
        let lb = UIButton(type: .system)
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        lb.setTitle("login", for: .normal)
        lb.setTitleColor(UIColor.white, for: .normal)
        lb.backgroundColor = UIColor.red
        return lb
    }()
    
    func loginButtonTapped() {
        print("beer o'clock!!!")
    }
    
    override func setUpCell() {
        super.setUpCell()
        backgroundColor = UIColor.lightGray
        
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(loginButton)
        
        emailTextField.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        emailTextField.widthAnchor.constraint(equalTo: widthAnchor, multiplier: CGFloat(0.5)).isActive = true
        emailTextField.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 20).isActive = true
        
        passwordTextField.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -20).isActive = true
        passwordTextField.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        passwordTextField.widthAnchor.constraint(equalTo: widthAnchor, multiplier: CGFloat(0.5)).isActive = true
        
        loginButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        loginButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: CGFloat(0.25)).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        loginButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30).isActive = true
        

        
    }
    
}


