//
//  customInputField.swift
//  TwitterSwift
//
//  Created by Ray on 2022/11/2.
//

import SwiftUI

struct customInputField: View {
    
    let imageName: String
    let placeholdertext: String
    @Binding var text: String
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color(.darkGray))
                
                TextField(placeholdertext, text: $text)
                
            }
            
            Divider()
                .background(Color(.darkGray))
        }
        
    }
}

struct customInputField_Previews: PreviewProvider {
    static var previews: some View {
        customInputField(imageName: "envelope",
                         placeholdertext: "Emain",
                         text: .constant(""))
    }
}
