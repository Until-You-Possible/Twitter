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
    
    init () {
        
        self.userSession = Auth.auth().currentUser
        
        print("DEBUG: User session is \(String(describing: self.userSession))")
        
    }
    
}
