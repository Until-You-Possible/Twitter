//
//  ProfileSelectoerView.swift
//  TwitterSwift
//
//  Created by Ray on 2022/11/11.
//

import SwiftUI

struct ProfileSelectoerView: View {
    var body: some View {
        
        VStack {
            
            // MARK: header view
            RoundedHeaderView(firstLine: "Create your account", secondLine: "Add a profile photo")
            
            Button {
                
            } label: {
                Image(systemName: "plus.circle")
                    .resizable()
                    .renderingMode(.template)
                    .scaledToFill()
                    .frame(width: 180, height: 180)
                    .padding(.top, 50)
            }
            
            Spacer()
            
        }
        .ignoresSafeArea()
        
    }
}

struct ProfileSelectoerView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSelectoerView()
    }
}
