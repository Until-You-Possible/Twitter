//
//  TweetService.swift
//  TwitterSwift
//
//  Created by Ray on 2022/11/22.
//

import Foundation
import Firebase


struct TweetService {
    
    func uploadTweet(caption: String, completion: @escaping(Bool) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let data = ["uid"      : uid,
                    "caption"  : caption,
                    "likes"    : 0,
                    "timestamp":  Timestamp(date: Date())] as [String : Any]
        Firestore.firestore().collection("tweets").document()
            .setData(data) { error in
                if let error = error {
                    print("DEBUG: uploaded tweets failed with error: \(error)")
                    completion(false)
                    return
                }
                completion(true)
                print("DBBUG: upload tweets successfully")
            }
        
    }
    
    func fetchTweets(completion: @escaping([Tweet]) -> Void) {
        Firestore.firestore().collection("tweets").getDocuments() { snapshot, _ in
            var tweetsList = [Tweet]()
            guard let documents = snapshot?.documents else { return }
            documents.forEach() { document in
                guard let tweet = try? document.data(as: Tweet.self) else { return }
                tweetsList.append(tweet)
            }
            completion(tweetsList)
        }
    }
    
    
}
