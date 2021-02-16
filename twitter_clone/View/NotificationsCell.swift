//
//  NotificationsCell.swift
//  twitter_clone
//
//  Created by tientran on 16/02/2021.
//

import UIKit

class NotificationsCell: UITableViewCell {
    
    private lazy var profileImageView : UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.setDimensions(width: 48, height: 48)
        iv.layer.cornerRadius = 48 / 2
        iv.backgroundColor = .twitterBlue
        return iv
    }()
    
    private let titleNotification : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.text = "Stephan ABC"
        return label
    }()
    
    private let descriptionNotification : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .lightGray
        label.text = "Description for notifications"
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(profileImageView)
        profileImageView.anchor(top: topAnchor, left: leftAnchor, paddingLeft: 8)
        profileImageView.centerY(inView: self)
        addSubview(titleNotification)
        addSubview(descriptionNotification)
        let stack = UIStackView(arrangedSubviews: [titleNotification, descriptionNotification])
        stack.axis = .vertical
        stack.spacing = 2
        addSubview(stack)
        stack.anchor(top: profileImageView.topAnchor, left: profileImageView.rightAnchor, right: rightAnchor, paddingLeft: 8, paddingRight: 8)
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
