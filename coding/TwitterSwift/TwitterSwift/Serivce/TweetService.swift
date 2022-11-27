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
    
    
}


// MARK: relevant like

extension TweetService {
    
    func likeTweet(_ tweet: Tweet, completion: @escaping() -> Void) {
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
    // when app lauched to checked the likes
    func checkIfUserLikes(_ tweet: Tweet, completion: @escaping(Bool) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let tweetId = tweet.id else { return }
        Firestore.firestore().collection("users")
            .document(uid)
            .collection("user-likes")
            .document(tweetId)
            .getDocument() { snapshot, _ in
                guard let snapshot = snapshot else { return }
                print("xxx", snapshot.exists)
                completion(snapshot.exists)
            }
    }
    
    func unLikeTweet(_ tweet: Tweet, completion: @escaping() -> Void) {
        // current user id
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let tweetId = tweet.id else { return }
        let userLikeRef = Firestore.firestore().collection("users").document(uid).collection("user-likes")
        guard tweet.likes > 0 else { return }
        // 更新tweet表中的like字段
        Firestore.firestore().collection("tweets").document(tweetId).updateData(["likes": tweet.likes - 1]) { _ in
            userLikeRef.document(tweetId).delete() { _ in
                completion()
            }
        }
    }
    // get liked data by user...
    func fetchLikeData(forUid uid: String, completion: @escaping([Tweet]) -> Void) {
        // 先获取user-like的collection
        // 根据 user-like中的id 去 tweets的collection中进行查找再返回
        // print("feat like data from firebase.")
        var tweets = [Tweet]()
        Firestore.firestore().collection("users")
            .document(uid)
            .collection("user-likes")
            .getDocuments { snapshot, _ in
                guard let tweetsDocs = snapshot?.documents else { return }
                tweetsDocs.forEach() { doc in
                    let tweedID = doc.documentID
                    Firestore.firestore().collection("tweets").document(tweedID)
                        .getDocument() { userLikedSnapshot, _ in
                            guard let tweet = try? userLikedSnapshot!.data(as: Tweet.self) else { return }
                            tweets.append(tweet)
                            completion(tweets)
                        }
                }
            }

    }
    
}
