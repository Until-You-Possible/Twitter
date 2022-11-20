//
//  User.swift
//  TwitterSwift
//
//  Created by Ray on 2022/11/18.
//

import Foundation
import FirebaseFirestoreSwift

struct User: Identifiable, Decodable, Hashable {
    @DocumentID var id : String?
    let username       : String
    let fullname       : String
    let profileImageUrl: String
    let email          : String
}
