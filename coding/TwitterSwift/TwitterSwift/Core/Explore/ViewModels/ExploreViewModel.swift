//
//  ExploreViewModel.swift
//  TwitterSwift
//
//  Created by Ray on 2022/11/20.
//

import Foundation

class ExploreViewModel: ObservableObject {
    
    @Published var users = [User]()
    private let service = UserService()
    
    init() {
        fetchUsers()
    }
    
    func fetchUsers() {
        service.fetchAllUsers() { users in
            self.users = users
            //print("DEBUG: all users are \(users)")
        }
    }

}
