//
//  RoundedHeaderView.swift
//  TwitterSwift
//
//  Created by Ray on 2022/11/3.
//

import SwiftUI

struct RoundedHeaderView: View {
    
    let firstLine: String
    let secondLine: String
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            HStack { Spacer () }
            
            Text(firstLine)
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            Text(secondLine)
                .font(.largeTitle)
                .fontWeight(.semibold)
        }
//            .frame(width: UIScreen.main.bounds.width, height: 260)
        .frame(height: 260)
        .padding(.leading)
        .background(Color(.systemBlue))
        .foregroundColor(.white)
        .clipShape(RoundedShape(corners: [.bottomRight]))
        
    }
}

struct RoundedHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        RoundedHeaderView(firstLine: "Hello", secondLine: "Welcome Back")
    }
}
