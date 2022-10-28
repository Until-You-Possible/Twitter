//
//  SideMenuViewModel.swift
//  TwitterSwift
//
//  Created by Ray on 2022/10/28.
//

import Foundation


enum SideMenuViewModel: Int, CaseIterable {
    
    case profile
    case lists
    case bookmarks
    case logout
    
    var description: String  {
        
        switch self {
            
        case .profile: return "Profile"
        case .lists: return "Lists"
        case .bookmarks: return "Bookmarks"
        case .logout: return "Logout"
            
        }
        
    }
    
    var imageName: String {
        
        switch self {
            
        case .profile: return "person"
        case .lists: return  "list.bullet"
        case .logout: return "arrow.left.square"
        case .bookmarks: return "bookmark"
            
        }
    }
    
}

