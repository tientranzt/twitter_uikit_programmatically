//
//  UploadTweetController.swift
//  twitter_clone
//
//  Created by tientran on 06/02/2021.
//

import UIKit

class UploadTwwetController: UIViewController {
    
    // MARK - properties
    lazy var actionTweetButton : UIButton = {
        let button  = UIButton()
        button.setTitle("Tweet", for: .normal)
        button.tintColor = .white
        button.backgroundColor =  .twitterBlue
        button.frame = CGRect(x: 0, y: 0, width: 64, height: 32)
        button.layer.cornerRadius = 32 / 2
        button.addTarget(self, action: #selector(handleActionTweetButtonTaped), for: .touchUpInside)
        
        return button
    }()
    
    private let profileImage : UIImageView = {
        let iv = UIImageView()
        iv.setDimensions(width: 46, height: 46)
        iv.layer.cornerRadius = 46 / 2
        iv.backgroundColor = .twitterBlue
        return iv
    }()
    
    private let captionTextView  = CaptionTextView()
    
    
    // MARK - lifecirlce
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureNavigation()
    }
    
    // MARK - helpers
    
    func configureUI() {
        view.backgroundColor = .white
        
        view.addSubview(profileImage)
        view.addSubview(captionTextView)
        let stack = UIStackView(arrangedSubviews: [profileImage, captionTextView])
        stack.axis = .horizontal
        

        
        view.addSubview(stack)
    
        stack.anchor(top:view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor,right: view.rightAnchor, paddingTop: 16, paddingLeft: 16, paddingRight: 16)
       
        
        
       
    }
    
    func configureNavigation()  {
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(handleCancelButton))
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: actionTweetButton)
    }
    
    @objc func handleCancelButton() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func handleActionTweetButtonTaped()  {
        print("debug: hand tweet button clicked ")
    }
    
    
}
