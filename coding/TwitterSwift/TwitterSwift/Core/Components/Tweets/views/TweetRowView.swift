//
//  TweetRowView.swift
//  TwitterSwift
//
//  Created by Ray on 2022/10/26.
//

import SwiftUI
import Kingfisher

struct TweetRowView: View {
    @ObservedObject var viewModel: TweetViewModel
    init(tweet: Tweet) {
        self.viewModel = TweetViewModel(tweet: tweet)
    }
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top, spacing: 12) {
                
                if let userInfo = viewModel.tweet.user {
                    KFImage(URL(string: userInfo.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: 56, height: 56)
                        .foregroundColor(Color(.systemBlue))
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    if let user = viewModel.tweet.user {
                        HStack {
                            Text(user.fullname)
                                .font(.subheadline).bold()
                            Text("@\(user.username)")
                                .font(.subheadline).bold()
                            Text("4w")
                                .fixedSize()
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                    }
                    // tweet caption
                    Text(viewModel.tweet.caption)
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                }
            }
            
            // MARK: action buttons
            HStack() {
                
                Button {
                    // action goes here...
                } label: {
                    Image(systemName: "bubble.left")
                        .font(.subheadline)
                }
                
                Spacer()
                
                Button {
                    // action goes here...
                } label: {
                    Image(systemName: "arrow.2.squarepath")
                        .font(.subheadline)
                }
                
                Spacer()
                
                Button {
                    viewModel.likeTweet()
                } label: {
                    Image(systemName: viewModel.tweet.didLike ?? false ? "heart.fill" : "heart")
                        .font(.subheadline)
                        .foregroundColor(viewModel.tweet.didLike ?? false ? .red : .gray)
                }
                
                Spacer()
                
                Button {
                    // action goes here...
                } label: {
                    Image(systemName: "bookmark")
                        .font(.subheadline)
                }
            }
            .padding([.top, .bottom], 16)
            .padding(.leading, 68)
            .padding(.trailing, 30)
            .foregroundColor(.gray)
            
            Divider()
        }
    }
}
//
//struct TweetRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        TweetRowView()
//    }
//}
