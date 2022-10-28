//
//  SideMenuView.swift
//  TwitterSwift
//
//  Created by Ray on 2022/10/28.
//

import SwiftUI

struct SideMenuView: View {
    var body: some View {
        
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Circle()
                    .frame(width: 48.0, height: 48)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Bruce Wayne")
                        .font(.subheadline)
                        .bold()
                        
                    
                    Text("@gang")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                
                UserStatesView()
                    .padding(.vertical)
                
                
            }
            
            SideMenuRowView()
            
            Spacer()

        }
        .padding(.leading)
        
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
}
