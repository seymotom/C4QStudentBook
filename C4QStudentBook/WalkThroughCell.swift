//
//  WlakThroughCell.swift
//  C4QStudentBook
//
//  Created by Tom Seymour on 11/18/16.
//  Copyright © 2016 C4Q-3.2. All rights reserved.
//

import UIKit

class WalkTroughCell: BaseCell {
    static let identifyer = "walkThroughCellID"
    
    let imageView: UIImageView = {
        let image = UIImage(named: "c4q_logo")
        let iv = UIImageView(image: image)
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let textView: UITextView = {
        let tv = UITextView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.text = "Jason is beautiful"
        tv.isEditable = false
        return tv
    }()
    
    var walkThrough: WalkThrough? {
        didSet {
            guard let walkThroughData = walkThrough else { return }
            setUp(walkThrough: walkThroughData)
        }
    }
    
    override func setUpCell() {
        super.setUpCell()
        addSubview(imageView)
        addSubview(textView)
        
        textView.topAnchor.constraint(equalTo: imageView.bottomAnchor).isActive = true
        textView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        textView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        textView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: CGFloat(0.25)).isActive = true
        
        imageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        imageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: CGFloat(0.6)).isActive = true
        
    }
    
    func setUp(walkThrough: WalkThrough) {
        imageView.image = UIImage(named: walkThrough.image)
        
        let attributedString = NSMutableAttributedString(string: walkThrough.title, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 20, weight: UIFontWeightMedium)])
        let descriptionAttribute = NSMutableAttributedString(string:"\n\n" + walkThrough.description, attributes: [NSForegroundColorAttributeName: UIColor.lightGray])
        attributedString.append(descriptionAttribute)
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        
        let textLength = attributedString.string.characters.count
        let range = NSRange(location: 0, length: textLength)
        
        attributedString.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: range)
        
        textView.attributedText = attributedString
    }
}
