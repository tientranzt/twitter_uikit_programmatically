//
//  FeedController.swift
//  twitter_clone
//
//  Created by tientran on 02/02/2021.
//

import UIKit

let feedCellResigter = "FeedCell"

class FeedController : UICollectionViewController  {
    
    // MARK: - Properties
  
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureProfileImage()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    // MARK: - Helpers
    
    func configureUI()  {
        view.backgroundColor = .white
        collectionView.register(FeedCollectionViewCell.self, forCellWithReuseIdentifier: feedCellResigter)
        
        collectionView.backgroundColor = .white
        
        let imageView = UIImageView(image: UIImage(systemName: "network")!)
        imageView.tintColor = .twitterBlue
        imageView.contentMode = .scaleAspectFit
        navigationItem.titleView = imageView
    
    }
    
    func configureProfileImage()  {
        let profileImage =  UIImageView()
        profileImage.setDimensions(width: 32, height: 32)
        profileImage.layer.cornerRadius = 32 / 2
        profileImage.backgroundColor = .twitterBlue
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: profileImage)
    }
}

extension FeedController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.size.width, height: 120)
    }
}

extension FeedController {
   
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: feedCellResigter, for: indexPath) as! FeedCollectionViewCell
        cell.delegate = self
        return cell
    }
}

// MARK: - FeedCollectionViewCellDelegate

extension FeedController : FeedCollectionViewCellDelegate{
    func handleProfileImageTapped() {
        let controller = ProfileController(collectionViewLayout: UICollectionViewFlowLayout())
        navigationController?.pushViewController(controller, animated: true)
        
    }
}
