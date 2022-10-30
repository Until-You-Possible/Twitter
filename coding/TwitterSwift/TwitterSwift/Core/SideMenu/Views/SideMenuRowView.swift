//
//  SideMenuRowView.swift
//  TwitterSwift
//
//  Created by Ray on 2022/10/28.
//

import SwiftUI

struct SideMenuRowView: View {
    
    let viewModel: SideMenuViewModel
    
    var body: some View {
        
        HStack(spacing: 16) {
            Image(systemName: viewModel.imageName)
                .font(.headline)
                .foregroundColor(.gray)
            Text(viewModel.description)
                .font(.subheadline)
            
            Spacer()
        }
        .frame(height: 40)
        .padding(.vertical)
    }
    
    
}

struct SideMenuRowView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuRowView(viewModel: .profile)
    }
}

