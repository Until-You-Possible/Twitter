//
//  TextArea.swift
//  TwitterSwift
//
//  Created by Ray on 2022/10/31.
//

import SwiftUI

struct TextArea: View {
    
    @Binding var text: String
    let placeholder: String
    
    init(placeholder: String, text: Binding<String>) {
        self.placeholder = placeholder
        self._text = text
        UITextView.appearance().backgroundColor = .clear
    }
    
    
    var body: some View {
        
        ZStack(alignment: .topLeading) {
            if text.isEmpty {
                Text(placeholder)
                    .foregroundColor(Color(.placeholderText))
                    .padding(.horizontal, 0)
                    .padding(.vertical, 12)
            }
            
            TextEditor(text: $text)
                .padding(4)
        }
        .font(.body)
        
    }
}

