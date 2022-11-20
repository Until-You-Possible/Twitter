//
//  UserService.swift
//  TwitterSwift
//
//  Created by Ray on 2022/11/17.
//

import Firebase
import FirebaseFirestoreSwift


struct UserService {
    
    func fetchUser(withUid uid: String, completion: @escaping(User) -> Void) {
        Firestore.firestore().collection("users")
            .document(uid)
            .getDocument { snapshot, _ in
                guard let snapshot = snapshot else { return }
                guard let user = try? snapshot.data(as: User.self) else { return }
                completion(user)
            }
    }
    
    func fetchAllUsers(completion: @escaping([User]) -> Void) {
        var users = [User]()
        Firestore.firestore().collection("users")
            .getDocuments() { ( querySnapshot, error) in
                if let error = error {
                    print("Error getting documents: \(error)")
                    return
                }
                guard let documents = querySnapshot?.documents else { return }
                documents.forEach() { document in
                    guard let user = try? document.data(as: User.self) else { return }
                    users.append(user)
                }
                completion(users)
            }
    }
    
}
