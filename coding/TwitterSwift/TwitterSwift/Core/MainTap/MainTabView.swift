//
//  MainTabView.swift
//  TwitterSwift
//
//  Created by Ray on 2022/10/26.
//

import SwiftUI

struct MainTabView: View {
    
    @State private var selectedeIndex = 0
    
    var body: some View {
        
        TabView(selection: $selectedeIndex) {
            
            FeedView()
                .onTapGesture {
                    self.selectedeIndex = 0
                }
                .tabItem {
                    Image(systemName: "house")
                }.tag(0)
            
            ExploreView()
                .onTapGesture {
                    self.selectedeIndex = 1
                }
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }.tag(1)
            
            NotificationsView()
                .onTapGesture {
                    self.selectedeIndex = 2
                }
                .tabItem {
                    Image(systemName: "bell")
                }.tag(2)
            
            
            MessageView()
                .onTapGesture {
                    self.selectedeIndex = 3
                }
                .tabItem {
                    Image(systemName: "envelope")
                }.tag(3)
        
    }
}
    
}
    

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
