//
//  ConversationsController.swift
//  twitter_clone
//
//  Created by tientran on 02/02/2021.
//

import UIKit


class ConversationsController : UIViewController  {
    // mark - properties
    
    // mark - lifecircle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // mark - helpers
    
    func configureUI()  {
        view.backgroundColor = .white
        navigationItem.title = "Converstions"
    }
}
