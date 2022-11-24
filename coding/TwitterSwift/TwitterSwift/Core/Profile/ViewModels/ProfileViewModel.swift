//
//  ProfileViewModel.swift
//  TwitterSwift
//
//  Created by Ray on 2022/11/24.
//

import Foundation


class ProfileViewModle: ObservableObject {
    
    let service = TweetService()
    @Published var tweets = [Tweet]()
    let user: User
    
    init(user: User) {
        self.user = user
        self.fetchTweets()
    }
    
    // use uid to fetch current user's tweets
    func fetchTweets() {
        guard let uid = user.id else { return }
        service.fetchTweets(forUid: uid) { tweets in
            self.tweets = tweets
            for i in 0 ..< tweets.count {
                self.tweets[i].user = self.user
            }
        }
    }
    
}
