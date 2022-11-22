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
    
    func fetchTweets(completion: @escaping([User]) -> Void) {
        Firestore.firestore().collection("tweet").getDocuments() { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            let users = documents.compactMap({ try? $0.data(as: User.self) })
            completion(users)
        }
    }
    
    
}
