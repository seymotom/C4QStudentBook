//
//  WalkThroughViewController.swift
//  C4QStudentBook
//
//  Created by Tom Seymour on 11/18/16.
//  Copyright © 2016 C4Q-3.2. All rights reserved.
//

import UIKit



class WalkThroughViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    lazy var collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.bounces = false
        cv.isPagingEnabled = true
        cv.backgroundColor = .white
        cv.delegate = self
        cv.dataSource = self
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    var walkThroughData = [WalkThrough]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCollectionView()
        loadWalkThroughData()
    }
    
    
    func loadWalkThroughData() {
        let walkThrough1 = WalkThrough(image: "c4q1", title: "ABOUT US", description: "We foster the Queens tech ecosystem to increase economic opportunity and transform the world's most diverse community into a leading hub for innovation and entrepreneurship.")
        let walkThrough2 = WalkThrough(image: "c4q2", title: "Our Mission", description: "Coalition for Queens (C4Q) increases economic opportunity through technology and transforms the world's most diverse community into a leading hub for innovation and entrepreneurship.")
        let walkThrough3 = WalkThrough(image: "c4q3", title: "What is Access Code?", description: "Access Code is a 10-month software development program that trains talented adults from underserved populations to become industry ready programmers and helps get them tech jobs at leading companies.")
        
        walkThroughData = [walkThrough1, walkThrough2, walkThrough3]
    }
    
    func setUpCollectionView() {
        view.addSubview(collectionView)
        collectionView.register(WalkTroughCell.self, forCellWithReuseIdentifier: WalkTroughCell.identifyer)
        collectionView.register(LoginCell.self, forCellWithReuseIdentifier: LoginCell.identifyer)
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return walkThroughData.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.item == walkThroughData.count {
            let loginCell = collectionView.dequeueReusableCell(withReuseIdentifier: LoginCell.identifyer, for: indexPath) as! LoginCell
            return loginCell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WalkTroughCell.identifyer, for: indexPath) as! WalkTroughCell
        
        let thisWalkThroughPage = walkThroughData[indexPath.item]
        cell.walkThrough = thisWalkThroughPage
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.size.width, height: view.frame.size.height)
    }
    
    
    
    
    
    
    
    
    

}
