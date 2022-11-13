//
//  AuthVIewModel.swift
//  TwitterSwift
//
//  Created by Ray on 2022/11/3.
//

import Foundation

import Firebase

class AuthViewModel: ObservableObject {
    
    @Published var userSession: FirebaseAuth.User?
    @Published var didAuthenticateUser = false
    
    init () {
        
        self.userSession = Auth.auth().currentUser
        
        print("DEBUG: User session is \(String(describing: self.userSession?.uid))")
        
    }
    
    func login(withEmail email: String, password: String) {
        print("DEBUG: Email is \(email)")
        
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            
            if let error = error {
                print("DEBUG: Failed to sign in with error \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return }
            self.userSession = user
            print("DEBUG: did log user in......")
            
            
        }
    }
    
    func register(withEmail email: String, password: String, fullname: String, username: String) {
        
         print("DEBUG: current self is \(self)")
        
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            
            if let error = error {
                print("DEBUG: Failed to register with error \(error.localizedDescription)")
                return
            }
            // guard let 守护一定有值 如果没有 直接返回
            guard let user = result?.user else { return }
            self.userSession = user
            print("register successfully !")
            print("DEBUG:  userSession is \(String(describing: self.userSession))")
            
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
            
            print("DEBUG: didAuthenticateUser is \(self.didAuthenticateUser)")
            
        }
        
    }
    
    func signOut() {
        
        // try? 会在出错时，返回nil，不会导致程序崩溃，如果没有错误，会返回一个可选值
        // try! 会在出错时崩溃，打破错误传播链
        
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            userSession = nil
            print("signout successfully, userSession is \(String(describing: userSession))")
        } catch let signOutError as NSError {
            print("Error sugning out: %@", signOutError)
        }
        
    }
    
}
