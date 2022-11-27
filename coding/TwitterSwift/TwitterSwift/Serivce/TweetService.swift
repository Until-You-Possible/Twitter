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
        Firestore.firestore().collection("tweets")
            .order(by: "timestamp", descending: true)
            .getDocuments() { snapshot, _ in
            var tweetsList = [Tweet]()
            guard let documents = snapshot?.documents else { return }
            documents.forEach() { document in
                guard let tweet = try? document.data(as: Tweet.self) else { return }
                tweetsList.append(tweet)
            }
            completion(tweetsList)
        }
    }
    
    func fetchTweets(forUid uid: String,completion: @escaping([Tweet]) -> Void) {
        Firestore.firestore().collection("tweets")
            .whereField("uid", isEqualTo: uid)
            .getDocuments() { snapshot, _ in
            var tweetsList = [Tweet]()
            guard let documents = snapshot?.documents else { return }
            documents.forEach() { document in
                guard let tweet = try? document.data(as: Tweet.self) else { return }
                tweetsList.append(tweet)
            }
            completion(tweetsList.sorted(by: { $0.timestamp.dateValue() > $1.timestamp.dateValue() }))
        }
    }
    
    func likeTweet(_ tweet: Tweet, completion: @escaping() -> Void) {
        print("Debug: like current Tweet")
        // current user id
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let tweetId = tweet.id else { return }
        let userLikeRef = Firestore.firestore().collection("users").document(uid).collection("user-likes")
        // 更新tweet表中的like字段
        Firestore.firestore().collection("tweets").document(tweetId).updateData(["likes": tweet.likes + 1]) { _ in
            userLikeRef.document(tweetId).setData([:]) { _ in
                completion()
            }
        }
        
    }
    
    
}
