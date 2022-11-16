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
    @State var profileImage: Image?
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        
        VStack {
            
            // MARK: header view
            RoundedHeaderView(firstLine: "Create your account", secondLine: "Add a profile photo")
            
            Button {
                showImagePricker.toggle()
            } label: {
                if let profileImage = profileImage {
                    profileImage
                        .resizable()
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
            .padding(.top, 44)
            
            // MARK: continue button
            
            if let selectedImage = selectedImage {
                Button {
                    print("profile image")
                    // upload the image info
                    viewModel.uploadProfileImageToCurrentUser(selectedImage)
                    
                } label: {
                    Text("Continue")
                        .font(.headline)
                        .frame(width: 340, height: 50)
                        .background(Color(.systemBlue))
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                        .padding()
                }
                .padding(.top, 30)
                .shadow(color: .gray, radius: 10, x: 0, y: 0)
            }
                    
            Spacer()
            
        }
        .ignoresSafeArea()
        
    }
    
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        self.profileImage = Image(uiImage: selectedImage)
    }
    
}


private struct ProfileImageModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color(.systemBlue))
            .scaledToFill()
            .frame(width: 180, height: 180)
            .clipShape(Circle())
        
    }
    
}




struct ProfileSelectoerView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSelectoerView()
    }
}
