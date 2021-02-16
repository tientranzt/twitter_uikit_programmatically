//
//  FeedCollectionViewCell.swift
//  twitter_clone
//
//  Created by tientran on 08/02/2021.
//

import UIKit

protocol FeedCollectionViewCellDelegate : class {
    func handleProfileImageTapped()
}

class FeedCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    weak var delegate : FeedCollectionViewCellDelegate?
    
    private lazy var profileImageView : UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.setDimensions(width: 48, height: 48)
        iv.layer.cornerRadius = 48 / 2
        iv.backgroundColor = .twitterBlue
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleProfileImageTapped))
        iv.isUserInteractionEnabled = true
        iv.addGestureRecognizer(tap)
        return iv
    }()
    
    private let captionLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "Lorem sum text here"
        label.numberOfLines = 0
        
        return label
    }()
    
    private let infoLabel = UILabel()
    
    private lazy var replyButton : UIButton =  {
        let button = UIButton()
        button.setImage(UIImage(systemName: "arrowshape.turn.up.left"), for: .normal)
        button.tintColor = .darkGray
        button.setDimensions(width: 20, height: 20)
        button.addTarget(self, action: #selector(handleReplyButtonTaped), for: .touchUpInside)
        return button
    }()
    
    private lazy var refreshButton : UIButton =  {
        let button = UIButton()
        button.setImage(UIImage(systemName: "arrow.clockwise.circle"), for: .normal)
        button.tintColor = .darkGray
        button.setDimensions(width: 20, height: 20)
        button.addTarget(self, action: #selector(handleRefreshButtonTaped), for: .touchUpInside)
        return button
    }()
    
    private lazy var likeButton : UIButton =  {
        let button = UIButton()
        button.setImage(UIImage(systemName: "suit.heart"), for: .normal)
        button.tintColor = .darkGray
        button.setDimensions(width: 20, height: 20)
        button.addTarget(self, action: #selector(handleLikeButtonTaped), for: .touchUpInside)
        return button
    }()
    
    private lazy var shareButton : UIButton =  {
        let button = UIButton()
        button.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        button.tintColor = .darkGray
        button.setDimensions(width: 20, height: 20)
        button.addTarget(self, action: #selector(handleShareButtonTaped), for: .touchUpInside)
        return button
    }()
    
  
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        
        addSubview(replyButton)
        addSubview(refreshButton)
        addSubview(likeButton)
        addSubview(shareButton)
        addSubview(profileImageView)
        profileImageView.anchor(top: topAnchor, left: leftAnchor, paddingTop: 8, paddingLeft: 12)
        
        addSubview(captionLabel)
        addSubview(infoLabel)
        infoLabel.text = "Peter @peter"
        
        let stack = UIStackView(arrangedSubviews: [infoLabel, captionLabel])
        stack.axis = .vertical
        stack.spacing = 4
        addSubview(stack)
        stack.anchor(top: profileImageView.topAnchor, left: profileImageView.rightAnchor, right: rightAnchor, paddingLeft: 8)
        
        let actionButtonsStack = UIStackView(arrangedSubviews: [replyButton, refreshButton, likeButton, shareButton])
        actionButtonsStack.axis = .horizontal
        actionButtonsStack.spacing = 72
        addSubview(actionButtonsStack)
        actionButtonsStack.centerX(inView: self)
        actionButtonsStack.anchor(bottom: bottomAnchor, paddingBottom: 8)
        
        let divider = UIView()
        divider.backgroundColor = .lightGray
        addSubview(divider)
        divider.anchor(left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, height: 0.5)
    
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Helpers
    
    
    // MARK: - Selectors
    
    @objc func handleProfileImageTapped(){
        delegate?.handleProfileImageTapped()
    }
    
    @objc func handleReplyButtonTaped(){}

    @objc func handleRefreshButtonTaped(){}

    @objc func handleLikeButtonTaped(){}

    @objc func handleShareButtonTaped(){}
    
}
