//
//  TweetsViewModel.swift
//  TwitterSwift
//
//  Created by Ray on 2022/11/27.
//

import Foundation

class TweetViewModel: ObservableObject {
    @Published var tweet: Tweet
    private let service = TweetService()
    init (tweet: Tweet) {
        self.tweet = tweet
    }
    
    func likeTweet() {
        service.likeTweet(self.tweet) {
            self.tweet.didLike = true
        }
    }
    
}
