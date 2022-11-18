//
//  SideMenuView.swift
//  TwitterSwift
//
//  Created by Ray on 2022/10/28.
//

import SwiftUI

struct SideMenuView: View {
    
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        
        if let user = authViewModel.currentUser {
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    Circle()
                        .frame(width: 48.0, height: 48)
                    VStack(alignment: .leading, spacing: 4) {
                        Text(user.fullname)
                            .font(.subheadline)
                            .bold()
                            
                        
                        Text("@\(user.username)")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    UserStatesView()
                        .padding(.vertical)

                }
                ForEach(SideMenuViewModel.allCases, id: \.rawValue) { item in
                    
                    if item == .profile {
                        NavigationLink {
                            ProfileView()
                        } label: {
                            SideMenuRowView(viewModel: item)
                        }
                    } else if item == .logout {
                        Button {
                            authViewModel.signOut()
                        } label: {
                            SideMenuRowView(viewModel: item)
                        }
                    }
                    else {
                        SideMenuRowView(viewModel: item)
                    }
                    
                }
                Spacer()
            }
            .padding(.leading)
        }
        
        
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
}
