//
//  UploadTweetsViewModel.swift
//  TwitterSwift
//
//  Created by Ray on 2022/11/22.
//

import Foundation


class UploadTweetsViewModel: ObservableObject {
    
    private let service = TweetService()
    
    func postTweetsData(withCaption caption: String) {
        service.uploadTweet(caption: caption)
    }
    
}
