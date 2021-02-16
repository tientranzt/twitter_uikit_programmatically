//
//  ExploreController.swift
//  twitter_clone
//
//  Created by tientran on 02/02/2021.
//

import UIKit

private let reuseIdentifier = "UserCell"
class ExploreController : UITableViewController  {
    // mark - properties
    private let searchController = UISearchController()
    
    // mark - lifecircle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureSearchController()
    }
    
    // mark - helpers
    func configureUI()  {
        view.backgroundColor = .white
        navigationItem.title = "Explore"
        tableView.register(UserCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.rowHeight = 60
        tableView.separatorStyle = .none
        
    }
    
    func configureSearchController()  {
        searchController.searchResultsUpdater = self
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.placeholder = "Looking user"
        searchController.searchBar.tintColor = .twitterBlue
        navigationItem.searchController = searchController
        definesPresentationContext = false
    }
}

extension ExploreController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! UserCell
        cell.selectionStyle = .none
        return cell
    }
}

// MARK: - UISearchResultsUpdating

extension ExploreController : UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {
            return
        }
        print(text)
    }
}
