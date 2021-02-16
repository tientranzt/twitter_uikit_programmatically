//
//  ProfileHeader.swift
//  twitter_clone
//
//  Created by tientran on 10/02/2021.
//

import UIKit

class ProfileHeader: UICollectionReusableView {
    
    weak var delegate : ProfileConrollerDelegate?
    
    // MARK: - properties
    private lazy var customNavigation : UIView = {
        let view = UIView()
        view.backgroundColor = .twitterBlue
        view.addSubview(customNavigationBackButton)
        customNavigationBackButton.anchor(top: view.topAnchor, left: view.leftAnchor, paddingTop: 30, paddingLeft: 8, width: 42, height: 42)
        
        return view
    }()
    
    private lazy var customNavigationBackButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(handleDismissProfileHeader), for: .touchUpInside)
        return button
    }()
    
    private let profileImageView : UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.setDimensions(width: 54, height: 54)
        iv.layer.cornerRadius = 54 / 2
        iv.backgroundColor = .twitterBlue
        iv.clipsToBounds = true
        iv.layer.borderColor = UIColor.white.cgColor
        iv.layer.borderWidth = 1.75
        
        return iv
    }()
    
    private let profileFollowButton : UIButton = {
        let button =  UIButton()
        button.setTitle("Follow", for: .normal)
        button.layer.cornerRadius = 35 / 2
        button.setTitleColor(.twitterBlue, for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.twitterBlue.cgColor
        button.addTarget(self, action: #selector(handleFollowButtonTapped), for: .touchUpInside)
        button.setDimensions(width: 100, height: 35)
        return button
    }()
    
    private let userName : UILabel = {
        let label = UILabel()
        label.text = "Stephan ABC"
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        return label
    }()
    
    private let userTagName : UILabel = {
        let label = UILabel()
        label.text = "@stephanabc"
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        return label
    }()
    
    private let userTweet : UILabel = {
        let label = UILabel()
        label.text = "Lorem sum a, and this is lorem sum again"
        label.numberOfLines = 0
        
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        return label
    }()
    
    private let profileFilter = ProfileFilter()
    
    private let indicatorProfileFilter : UIView = {
        let view = UIView()
        view.backgroundColor = .twitterBlue

        return view
    }()
    
    // MARK: - lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        profileFilter.delegate = self
        configureUi()
    }
    
   
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    // MARK: - helpers
    func configureUi()  {
        addSubview(customNavigation)
        addSubview(profileImageView)
        addSubview(profileFollowButton)
        customNavigation.anchor(top:topAnchor, left : leftAnchor, right: rightAnchor, width: frame.size.width, height: 80)
        profileImageView.anchor(top: customNavigation.bottomAnchor, left: leftAnchor, paddingTop: -12, paddingLeft: 24)
        profileFollowButton.anchor(top: customNavigation.bottomAnchor, right: customNavigation.rightAnchor, paddingTop: 20, paddingRight: 20)
    
        let userInfoStack = UIStackView(arrangedSubviews: [userName, userTagName, userTweet])
        userInfoStack.axis = .vertical
        userInfoStack.spacing = 4
        addSubview(userInfoStack)
        userInfoStack.anchor(top: profileFollowButton.bottomAnchor, left: leftAnchor, right: rightAnchor, paddingLeft: 12, paddingRight: 12)
        
        addSubview(profileFilter)
        profileFilter.anchor(left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, height: 30)
        
        addSubview(indicatorProfileFilter)
        indicatorProfileFilter.anchor(left: leftAnchor, bottom: bottomAnchor, width: frame.size.width / 3, height: 2)
        
    }
    
    
    // MARK: - selectors
    @objc func handleFollowButtonTapped(){
        print("debug: follow button tapped")
    }
    
    @objc func handleDismissProfileHeader(){
        delegate?.handleDismissHeaderProfile()
    }
    
}

extension ProfileHeader : ProfileFilterDelegate {
    func filterIndexHandle(_ view: ProfileFilter, didSelected indexPath: IndexPath) {
        guard let cell = view.collectionView.cellForItem(at: indexPath) as? ProfileFilterCell else {
            return
        }
        
        let xPositon = cell.frame.origin.x
        
        UIView.animate(withDuration: 0.3) {
            self.indicatorProfileFilter.frame.origin.x = xPositon
        }
        
    
    }
}
