//
//  ProfileViewModel.swift
//  TwitterSwift
//
//  Created by Ray on 2022/11/24.
//

import Foundation


class ProfileViewModle: ObservableObject {
    
    let service = TweetService()
    let userSerivce = UserService()
    @Published var tweets = [Tweet]()
    @Published var likeTweets = [Tweet]()
    let user: User
    
    init(user: User) {
        self.user = user
        self.fetchTweets()
         self.fetchLikeData()
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
    
    // fetch liked data
    func fetchLikeData() {
        guard let uid = user.id else { return }
        service.fetchLikeData(forUid: uid) { tweets in
            self.likeTweets = tweets
            for i in 0 ..< tweets.count {
                let uid = self.likeTweets[i].uid
                self.userSerivce.fetchUser(withUid: uid) { user in
                    self.likeTweets[i].user = user
                }
            }
        }
    }
    
    func filterTweets(forFilter filter: TweetFilterViewModel) -> [Tweet] {
        switch filter {
        case .tweets:
            return tweets
        case .replies:
            return tweets
        case .likes:
            return likeTweets
        }
    }
    
}
