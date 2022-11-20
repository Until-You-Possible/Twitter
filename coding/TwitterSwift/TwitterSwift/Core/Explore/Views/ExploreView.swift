//
//  ExploreView.swift
//  TwitterSwift
//
//  Created by Ray on 2022/10/26.
//

import SwiftUI

struct ExploreView: View {
    var body: some View {
        
        VStack {
            ScrollView {
                LazyVStack {
                    ForEach (0 ... 30, id: \.self) { _ in
                        NavigationLink {
//                                ProfileView()
                        } label: {
                            UserRowView()
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
