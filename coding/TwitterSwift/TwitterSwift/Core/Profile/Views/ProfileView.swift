//
//  ProfileView.swift
//  TwitterSwift
//
//  Created by Ray on 2022/10/26.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        
        VStack(alignment: .leading) {
            
            headerView
            
            actionsButtons
            
            userInfoDetails

            Spacer()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}


extension ProfileView {
    
    var headerView: some View {
        
        ZStack(alignment: .bottomLeading) {
            Color(.systemBlue)
                .ignoresSafeArea()
            
            VStack {
                Button {
                    
                } label: {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .frame(width: 20, height: 16)
                        .foregroundColor(.white)
                        .offset(x: 16, y: 12)
                }
                
                Circle()
                    .frame(width: 72, height: 72)
                    .offset(x: 16, y: 24)
            }

        }
        .frame(height: 96)
    }
    
    var actionsButtons: some View {
        HStack {
            Spacer()
            Image(systemName: "bell.badge")
                .padding(6)
                .overlay(Circle().stroke(Color.gray, lineWidth: 0.75))
            
            Button {
                
            } label: {
                Text("Eidt Profile")
                    .font(.subheadline).bold()
                    .frame(width: 120, height: 32)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray, lineWidth: 0.75))
            }
        }
        .padding(.trailing)
    }
    
    var userInfoDetails: some View {
        
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Text("Heath Ledger")
                    .bold()
                    .font(.title)
                Image(systemName: "checkmark.seal.fill")
                    .foregroundColor(Color(.systemBlue))
            }
            Text("@gang")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Text("Your moms favorite villain")
                .font(.subheadline)
                .padding(.vertical)
            
            HStack(spacing: 24) {
                
                HStack {
                    Image(systemName: "mappin.and.ellipse")
                    Text("Gotham, YN")
                }
                
                HStack {
                    Image(systemName: "link")
                    Text("www.google.com")
                }
                
            }
            .font(.caption)
            .foregroundColor(.gray)
            
            HStack(spacing: 24) {
                HStack {
                    Text("789")
                        .font(.subheadline)
                        .bold()
                    Text("Following")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                
                HStack {
                    Text("789")
                        .font(.subheadline)
                        .bold()
                    Text("Fllowers")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
            .padding(.vertical)
        }
        .padding(.horizontal)
        
    }
    
}
