//
//  UploadTweetsViewModel.swift
//  TwitterSwift
//
//  Created by Ray on 2022/11/22.
//

import Foundation


class UploadTweetsViewModel: ObservableObject {
    @Published var didUploadedTweets = false
    
    private let service = TweetService()
    
    func postTweetsData(withCaption caption: String) {
        if caption.isEmpty {
            print("caption can not be empty")
            return
        }
        service.uploadTweet(caption: caption) { success in
            if success {
                // dismiss something
                self.didUploadedTweets = true
            } else {
                // show the error message to user...
                
            }
        }
    }
    
}
