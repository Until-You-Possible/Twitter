//
//  UserStatesView.swift
//  TwitterSwift
//
//  Created by Ray on 2022/10/28.
//

import SwiftUI

struct UserStatesView: View {
    var body: some View {
        
        HStack {
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
        .padding(.top)
    }
}

struct UserStatesView_Previews: PreviewProvider {
    static var previews: some View {
        UserStatesView()
    }
}
