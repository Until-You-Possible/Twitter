//
//  AuthVIewModel.swift
//  TwitterSwift
//
//  Created by Ray on 2022/11/3.
//

import Foundation

import Firebase
import UIKit

class AuthViewModel: ObservableObject {
    
    @Published var userSession         : FirebaseAuth.User?
    @Published var didAuthenticateUser : Bool
    @Published var currentUser         : User?
    private var tempUserSeesion        : FirebaseAuth.User?
    private let service = UserService()
    
    init () {
        self.userSession = Auth.auth().currentUser
        self.didAuthenticateUser = false
        self.fetchUserData()

    }
    
    func login(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Failed to sign in with error \(error.localizedDescription)")
                return
            }
            guard let user   = result?.user else { return }
            self.userSession = user
        }
    }
    
    func register(withEmail email: String, password: String, fullname: String, username: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Failed to register with error \(error.localizedDescription)")
                return
            }
            // guard let 守护一定有值 如果没有 直接返回
            guard let user = result?.user else { return }
            self.tempUserSeesion = user
            
            let data = ["email"    : email,
                        "username" : username.lowercased(),
                        "fullname" : fullname,
                        "uid"      : user.uid
            ]
            // sync function
            Firestore.firestore().collection("users")
                .document(user.uid)
                .setData(data) { _ in
                    print("DEBUG: Did uplaod user data...")
                    self.didAuthenticateUser = true
                }
        }
        
    }
    
    func signOut() {
        
        // try? 会在出错时，返回nil，不会导致程序崩溃，如果没有错误，会返回一个可选值
        // try! 会在出错时崩溃，打破错误传播链
        
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            self.userSession         = nil
            self.didAuthenticateUser = false
            print("signout successfully, userSession is \(String(describing: userSession))")
        } catch let signOutError as NSError {
            print("Error sugning out: %@", signOutError)
        }
        
    }
    
    // upload user's profile image
    func uploadProfileImageToCurrentUser(_ image: UIImage) {
        guard let uid = tempUserSeesion?.uid else { return }
        ImageUploader.uploadImage(image: image) { profileImageUrl in
            Firestore.firestore().collection("users")
                .document(uid)
                .updateData(["profileImageUrl": profileImageUrl]) { _ in
                    self.userSession = self.tempUserSeesion
                }
        }
    }
    
    // fetch user data
    func fetchUserData() {
        guard let uid = self.userSession?.uid else { return }
        service.fetchUser(withUid: uid) { user in
            print("DEBUG: current user is \(user)")
            self.currentUser = user
        }
    }
    
}
