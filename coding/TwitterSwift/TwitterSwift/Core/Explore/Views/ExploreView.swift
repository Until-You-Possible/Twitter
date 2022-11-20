//
//  ExploreView.swift
//  TwitterSwift
//
//  Created by Ray on 2022/10/26.
//

import SwiftUI

struct ExploreView: View {
    @ObservedObject var viewModel = ExploreViewModel()
    
    var body: some View {
        
        VStack {
            ScrollView {
                LazyVStack {
                    ForEach (viewModel.users, id: \.self) { user in
                        NavigationLink {
                            ProfileView(user: user)
                        } label: {
                            UserRowView(user: user)
                        }
                    }
                }
            }
        }
        .navigationTitle("Expore")
        .navigationBarTitleDisplayMode(.inline)
    }
    
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
