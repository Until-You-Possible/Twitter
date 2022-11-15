//
//  ProfileSelectoerView.swift
//  TwitterSwift
//
//  Created by Ray on 2022/11/11.
//

import SwiftUI

struct ProfileSelectoerView: View {
    
    @State private var showImagePricker = false
    @State private var selectedImage: UIImage?
    @State var profileImage: Image
    
    var body: some View {
        
        VStack {
            
            // MARK: header view
            RoundedHeaderView(firstLine: "Create your account", secondLine: "Add a profile photo")
            
            Button {
                showImagePricker.toggle()
            } label: {
                if let profileImage = profileImage {
                    profileImage
                        .modifier(ProfileImageModifier())
                }  else {
                    Image(systemName: "plus.circle")
                        .renderingMode(.template)
                        .modifier(ProfileImageModifier())
                }

            }
            .sheet(isPresented: $showImagePricker, onDismiss: loadImage) {
                ImagePicker(selectedIamge: $selectedImage)
            }
                    
            Spacer()
            
        }
        .ignoresSafeArea()
        
    }
    
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        profileImage = Image(uiImage: selectedImage)
    }
    
}


private struct ProfileImageModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color(.systemBlue))
            .frame(width: 180, height: 180)
            .padding(.top, 50)
            .clipShape(Circle())
        
    }
    
}




struct ProfileSelectoerView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSelectoerView()
    }
}
