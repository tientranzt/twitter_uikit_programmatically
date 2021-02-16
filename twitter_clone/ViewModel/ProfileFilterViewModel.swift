//
//  ProfileFilterViewModel.swift
//  twitter_clone
//
//  Created by tientran on 11/02/2021.
//

import Foundation

enum ProfileFilterOptions  : Int , CaseIterable {
    case tweet
    case reply
    case like

    var description : String {
        switch self {
            case .tweet: return "Tweet"
            case .reply: return "Tweet & Reply"
            case .like: return "Like"
        }
    }
}
