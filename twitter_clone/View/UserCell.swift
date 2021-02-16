//
//  UserCell.swift
//  twitter_clone
//
//  Created by tientran on 11/02/2021.
//

import UIKit

class UserCell: UITableViewCell {
    
    // MARK: - properties
    private let profileImage : UIImageView = {
        let iv = UIImageView()
        iv.setDimensions(width: 42, height: 42)
        iv.layer.cornerRadius = 42 / 2
        iv.backgroundColor = .twitterBlue
        return iv
    }()
    
    private let username : UILabel = {
        let label = UILabel()
        label.text = "Stepehn ACB"
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    private let userAccount : UILabel = {
        let label = UILabel()
        label.text = "@stephen"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .lightGray
        return label
    }()
 
    // MARK: - lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(profileImage)
        profileImage.anchor(left: leftAnchor, paddingLeft: 12)
        profileImage.centerY(inView: self)
        
        let stack = UIStackView(arrangedSubviews: [username, userAccount])
        stack.axis = .vertical
        stack.spacing = 4
        addSubview(stack)
        stack.anchor(top: profileImage.topAnchor, left: profileImage.rightAnchor, right: rightAnchor, paddingLeft: 8)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
