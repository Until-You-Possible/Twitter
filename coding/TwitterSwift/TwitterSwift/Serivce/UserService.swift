//
//  UserService.swift
//  TwitterSwift
//
//  Created by Ray on 2022/11/17.
//

import Firebase


struct UserService {
    
    func fetchUser(withUid uid: String) {
        Firestore.firestore().collection("users")
            .document(uid)
            .getDocument { snapshot, _ in
                guard let data = snapshot?.data() else { return }
                print("current user data is \(data)")
            }
    }
    
}
