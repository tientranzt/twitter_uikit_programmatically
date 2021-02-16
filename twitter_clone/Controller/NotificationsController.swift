//
//  Notifications.swift
//  twitter_clone
//
//  Created by tientran on 02/02/2021.
//

import UIKit

private let reuseIdentifier = "NotificationCell"

class NotificationsController : UITableViewController  {
    // MARK: - properties
    
    
    // MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        configureUI()
    }
    
    // MARK: - helpers
    func configureUI()  {
        view.backgroundColor = .white
        navigationItem.title = "Notifications"
        tableView.register(NotificationsCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.rowHeight = 50
    }
}

extension NotificationsController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! NotificationsCell
        return cell
    }
}


