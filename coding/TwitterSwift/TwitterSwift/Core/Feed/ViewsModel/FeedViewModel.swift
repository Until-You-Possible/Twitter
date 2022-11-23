//
//  FeedViewModel.swift
//  TwitterSwift
//
//  Created by Ray on 2022/11/23.
//

import Foundation



class FeedViewModel: ObservableObject {
    
    @Published var userTweets = [Tweet]()
    private let service       = TweetService()
    private let userSerive    = UserService()
    
    init() {
        self.fetchTweetsData()
    }
    
    func fetchTweetsData() {
        service.fetchTweets() { userTweets in
            self.userTweets = userTweets
            for i in 0 ..< userTweets.count {
                let uid = userTweets[i].uid
                self.userSerive.fetchUser(withUid: uid) { user in
                    self.userTweets[i].user = user
                }
            }
        }
    }
    
}
