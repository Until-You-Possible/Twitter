//
//  customInputField.swift
//  TwitterSwift
//
//  Created by Ray on 2022/11/2.
//

import SwiftUI

struct customInputField: View {
    
    let imageName       : String
    let placeholdertext : String
    var isSecureField   : Bool? = false
    @Binding var text   : String
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color(.darkGray))
                
                if isSecureField ?? false {
                    SecureField(placeholdertext, text: $text)
                } else {
                    TextField(placeholdertext, text: $text)
                }
                
            }
            
            
            Divider()
                .background(Color(.darkGray))
        }
        
    }
}

struct customInputField_Previews: PreviewProvider {
    static var previews: some View {
        customInputField(imageName: "envelope",
                         placeholdertext: "Email",
                         isSecureField: false,
                         text: .constant(""))
    }
}
