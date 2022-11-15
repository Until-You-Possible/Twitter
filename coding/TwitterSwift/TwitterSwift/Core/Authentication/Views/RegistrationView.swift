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
    
    @State public var pushActive = true
    
    
    var body: some View {
        
        NavigationView {
            VStack {
                
                NavigationLink(destination: ProfileSelectoerView(),
                               isActive: $pushActive,
                               label: {}
                )
                
                // main register form
                 mainRegisterBody

            }
            .ignoresSafeArea()
        }

    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}


extension RegistrationView {
    
    // ViewBuilder allowing those closures to provide multiple child views
    // 不使用@ViewBuilder时你只能传递一个View在闭包里，使用@ViewBuilder你可以传递多个View到闭包里面
    
    @ViewBuilder
    var mainRegisterBody: some View  {
        
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
                Text("Sign In")
                    .font(.headline)
            }
            .foregroundColor(Color(.systemBlue))
            .padding(.bottom, 40)
        }
    }
    
}
