//
//  NewTweetView.swift
//  TwitterSwift
//
//  Created by Ray on 2022/10/31.
//

import SwiftUI
import Kingfisher

struct NewTweetView: View {
    
    @EnvironmentObject var authViewModel: AuthViewModel
    
    @State private var caption = "";
    
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var viewModel = UploadTweetsViewModel()
    
    var body: some View {
        VStack {
            
            HStack {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Cancel")
                        .foregroundColor(Color(.systemBlue))
                }
                
                Spacer()
                
                Button {
                    viewModel.postTweetsData(withCaption: caption)
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
                
                if let user = authViewModel.currentUser {
                    KFImage(URL(string: user.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: 64, height: 64)
                } else {
                    Circle()
                        .frame(width: 64, height: 64)
                }
                
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
