//
//  RegistrationView.swift
//  TwitterSwift
//
//  Created by Ray on 2022/11/2.
//

import SwiftUI

struct RegistrationView: View {
    
    @State private var email = ""
    @State private var username = ""
    @State private var fullname = ""
    @State private var password = ""
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    
    
    var body: some View {
        
        VStack {
            
            NavigationLink(destination: ProfileSelectoerView(),
                           isActive: $viewModel.didAuthenticateUser,
                           label: {})
            
            
            // MARK: header view
            RoundedHeaderView(firstLine: "Get Started", secondLine: "Create your account")
            
            // MARK: form
            VStack(spacing: 40) {
                
                customInputField(imageName: "envelope",
                                 placeholdertext: "Email",
                                 text: $email)
            
                customInputField(imageName: "person",
                                 placeholdertext: "Username",
                                 text: $username)
                
                customInputField(imageName: "person",
                                 placeholdertext: "fullname",
                                 text: $fullname)
                
                customInputField(imageName: "lock",
                                 placeholdertext: "Password",
                                 isSecureField: true,
                                 text: $password)
                
            }
            .padding(.top, 44)
            .padding(.horizontal, 32)
            
            Button {
                print("Register")
                viewModel.register(withEmail: email, password: password, fullname: fullname, username: username)
            } label: {
                Text("Sign Up")
                    .font(.headline)
                    .frame(width: 340, height: 50)
                    .background(Color(.systemBlue))
                    .foregroundColor(.white)
                    .clipShape(Capsule())
                    .padding()
            }
            .padding(.top, 30)
            .shadow(color: .gray, radius: 10, x: 0, y: 0)
            
            Spacer()
            
            NavigationLink {
                LoginView()
                    .navigationBarHidden(true)
            } label: {
                HStack {
                    Text("Already have an account?")
                    Text("Sign Up")
                        .font(.headline)
                }
                .foregroundColor(Color(.systemBlue))
                .padding(.bottom, 40)
            }
        }
        .ignoresSafeArea()

    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
