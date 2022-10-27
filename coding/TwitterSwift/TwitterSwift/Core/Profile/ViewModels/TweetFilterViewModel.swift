//
//  TweetFilterViewModel.swift
//  TwitterSwift
//
//  Created by Ray on 2022/10/27.
//

import Foundation


enum TweetFilterViewModel: Int, CaseIterable {
    
    case tweets
    case replies
    case likes
    
    var title: String {
        switch self {
        case .tweets: return "Tweets"
        case .replies: return "Replies"
        case .likes: return "Likes"
        }
    }
    
}
