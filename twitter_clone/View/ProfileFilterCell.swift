//
//  ProfileFilterCell.swift
//  twitter_clone
//
//  Created by tientran on 11/02/2021.
//

import UIKit

class ProfileFilterCell: UICollectionViewCell {
    
    var options : ProfileFilterOptions! {
        didSet{
            label.text = options.description
        }
    }
    
    private let label : UILabel = {
        let label = UILabel()
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubview(label)
        label.centerX(inView: self)
    }
    
    override var isSelected: Bool{
        didSet {
            label.textColor = isSelected ? UIColor.twitterBlue :  UIColor.black
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
