//
//  NewTweetView.swift
//  TwitterSwift
//
//  Created by Ray on 2022/10/31.
//

import SwiftUI

struct NewTweetView: View {
    
    @State private var caption = "";
    
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
            
            HStack(alignment: .top) {
                
                Circle()
                    .frame(width: 64, height: 64)
                
                TextArea(placeholder: "now, what is happening?", text: $caption)
                
            }
            .padding(.horizontal)
            .padding(.vertical, 8)
            
        }
    }
}

struct NewTweetView_Previews: PreviewProvider {
    static var previews: some View {
        NewTweetView()
    }
}
