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
    
    func fetchAllUsers(completion: @escaping(Any) -> Void) {
        var users = [Any]()
        Firestore.firestore().collection("users")
            .getDocuments() { ( querySnapshot, error) in
                if let error = error {
                    print("Error getting documents: \(error)")
                    return
                }
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                    users.append(document)
                }
                completion(users)
            }
    }
    
}
