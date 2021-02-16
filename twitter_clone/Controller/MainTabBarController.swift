//
//  MainTabBarController.swift
//  twitter_clone
//
//  Created by tientran on 02/02/2021.
//

import UIKit

class MainTabBarController: UITabBarController {

    // MARK: - Properties
    private let actionButton : UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.backgroundColor = .twitterBlue
        button.setImage(UIImage(systemName: "square.and.pencil"), for: .normal)
        button.addTarget(self, action: #selector(handleActionButtonClicked), for: .touchUpInside)
        return button
    }()
    
    
    // MARK: - Selectors
    @objc func handleActionButtonClicked(){
        let nav = UINavigationController(rootViewController: UploadTwwetController())
        nav.modalPresentationStyle = .fullScreen
        present(nav, animated: true, completion: nil)
    }
    
    // MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configViewController()
        configureUI()
    }
    
    // mark - helpers
    
    func configureUI()  {
        view.addSubview(actionButton)
        actionButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingBottom: 64, paddingRight: 16, width: 54, height: 54)
        actionButton.layer.cornerRadius = 54/2
    }
    
    func configViewController()  {
    
        let feed = FeedController(collectionViewLayout: UICollectionViewFlowLayout())
        let nav1 = templateNavigationConroller(tabBarItemImage: UIImage(systemName: "house"), viewController: feed)
        
        let explore = ExploreController()
        let nav2 = templateNavigationConroller(tabBarItemImage: UIImage(systemName: "magnifyingglass"), viewController: explore)
       
        let notifications = NotificationsController()
        let nav3 = templateNavigationConroller(tabBarItemImage: UIImage(systemName: "bell"), viewController: notifications)
        
        let conversations = ConversationsController()
        let nav4 = templateNavigationConroller(tabBarItemImage: UIImage(systemName: "message"), viewController: conversations)
        
        viewControllers = [nav1, nav2, nav3, nav4]
        
        
    }
    
    func templateNavigationConroller(tabBarItemImage : UIImage?, viewController : UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: viewController)
        nav.tabBarItem.image = tabBarItemImage
        nav.navigationBar.tintColor = .white
        return nav
    }
    
}
