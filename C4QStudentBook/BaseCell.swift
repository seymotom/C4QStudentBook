//
//  BaseCell.swift
//  C4QStudentBook
//
//  Created by Tom Seymour on 11/18/16.
//  Copyright © 2016 C4Q-3.2. All rights reserved.
//

import UIKit

class BaseCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setUpCell() {
        backgroundColor = .white
    }
}
