//
//  TwitterSwiftApp.swift
//  TwitterSwift
//
//  Created by Ray on 2022/10/25.
//

import SwiftUI
import Firebase

@main
struct TwitterSwiftApp: App {
    
    @StateObject var viewModel = AuthViewModel()
    
    init () {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                // MainTabView()
                // LoginView()
                ContentView()
            }
            .environmentObject(viewModel)
            .navigationViewStyle(.stack)
        }
    }
}
