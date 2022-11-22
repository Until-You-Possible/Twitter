//
//  TweetService.swift
//  TwitterSwift
//
//  Created by Ray on 2022/11/22.
//

import Foundation
import Firebase


struct TweetService {
    
    func uploadTweet(caption: String) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let data = ["uid"      : uid,
                    "caption"  : caption,
                    "likes"    : 0,
                    "timestamp":  Timestamp(date: Date())] as [String : Any]
        Firestore.firestore().collection("tweets").document()
            .setData(data) { _ in
                print("DBBUG: upload tweets")
            }
        
    }
    
    
}
