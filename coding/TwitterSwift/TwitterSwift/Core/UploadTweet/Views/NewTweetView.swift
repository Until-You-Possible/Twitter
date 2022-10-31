//
//  NewTweetView.swift
//  TwitterSwift
//
//  Created by Ray on 2022/10/31.
//

import SwiftUI

struct NewTweetView: View {
    var body: some View {
        VStack {
            
            HStack {
                Button {
                    
                } label: {
                    Text("Cancel")
                        .foregroundColor(Color(.systemBlue))
                }
                
                Spacer()
                
                Button {
                    
                } label: {
                    Text("Tweet")
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .background(Color(.systemBlue))
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                }
            }
            .padding()
            
            HStack {
                
                Circle()
                    .frame(width: 64, height: 64)
                
                
                
            }
            
        }
    }
}

struct NewTweetView_Previews: PreviewProvider {
    static var previews: some View {
        NewTweetView()
    }
}
