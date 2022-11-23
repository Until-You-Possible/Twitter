//
//  Tweet.swift
//  TwitterSwift
//
//  Created by Ray on 2022/11/23.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift


struct Tweet: Identifiable, Decodable, Hashable {
    @DocumentID var id : String?
    let caption        : String
    let timestamp      : Timestamp
    let uid            : String
    var likes          : Int
    var user           : User?
}
