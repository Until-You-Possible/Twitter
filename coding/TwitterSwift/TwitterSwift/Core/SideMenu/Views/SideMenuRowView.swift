//
//  SideMenuRowView.swift
//  TwitterSwift
//
//  Created by Ray on 2022/10/28.
//

import SwiftUI

struct SideMenuRowView: View {
    var body: some View {
        
        VStack() {
            ForEach(SideMenuViewModel.allCases, id: \.rawValue) { item in
                HStack(spacing: 16) {
                    Image(systemName: item.imageName)
                        .font(.headline)
                        .foregroundColor(.gray)
                    Text(item.description)
                        .font(.subheadline)
                    
                    Spacer()
                }
                .frame(height: 40)
                .padding(.vertical)
            }
        }
    }
}

struct SideMenuRowView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuRowView()
    }
}

