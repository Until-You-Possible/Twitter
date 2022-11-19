//
//  ContentView.swift
//  TwitterSwift
//
//  Created by Ray on 2022/10/25.
//

import SwiftUI
import Kingfisher

struct ContentView: View {
    
    @State private var showMenu = false
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        
        Group {
            // no user logger in
            if viewModel.userSession == nil {
                LoginView()
            } else {
                mainInterfaceView
            }
            
        }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
             ContentView()
        }
        .navigationViewStyle(.stack)

    }
}


extension ContentView {
    
    var mainInterfaceView: some View {
        
        ZStack(alignment: .topLeading) {
         
            MainTabView()
                .navigationBarHidden(showMenu)
            
            if showMenu  {
                ZStack {
                    Color(.black)
                        .opacity(showMenu ? 0.25 : 0.0)
                }
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        showMenu = false
                    }
                }
                .ignoresSafeArea()
            }
            
            SideMenuView()
                .frame(width: 300)
                .offset(x: showMenu ? 0: -300, y: 0)
                .background(showMenu ? Color.white : Color.clear)
            
        }
        .navigationTitle("home")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    withAnimation(.easeInOut) {
                        showMenu.toggle()
                    }
                } label: {
                    if let user = viewModel.currentUser {
                        KFImage(URL(string: user.profileImageUrl))
                            .resizable()
                            .scaledToFill()
                            .clipShape(Circle())
                            .frame(width: 32, height: 32)
                    }
                }
            }
        }
        .onAppear {
            showMenu = false
        }
        
    }
    
}
