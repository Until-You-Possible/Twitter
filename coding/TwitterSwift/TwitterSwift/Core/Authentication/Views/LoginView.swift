//
//  LoginView.swift
//  TwitterSwift
//
//  Created by Ray on 2022/11/2.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        
        
        // MARK: parnet container
        VStack {
            
            // MARK: header view
            VStack(alignment: .leading) {
                
                HStack { Spacer () }
                
                Text("Hello")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                
                Text("Welcome Back")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
            }
//            .frame(width: UIScreen.main.bounds.width, height: 260)
            .frame(height: 260)
            .padding(.leading)
            .background(Color(.systemBlue))
            .foregroundColor(.white)
            .clipShape(RoundedShape(corners: [.bottomRight]))
            
            // MARK: form
            VStack(spacing: 40) {
                
                TextField("Email", text: $email)
                TextField("Password", text: $password)
                
            }
            .padding(.top, 44)
            .padding(.horizontal, 32)
            
            // MARK: reset password
            HStack {
                Spacer()
                NavigationLink {
                    Text("reset the password")
                } label: {
                    Text("Forget password?")
                }
            }
            .padding(.vertical, 30)
            .padding(.trailing)
            
            // MARK: login button
            Button {
                print("login")
            } label: {
                Text("Sign In")
                    .font(.headline)
                    .frame(width: 340, height: 50)
                    .background(Color(.systemBlue))
                    .foregroundColor(.white)
                    .clipShape(Capsule())
                    .padding()
            }
            .shadow(color: .gray, radius: 10, x: 0, y: 0)
            
            Spacer()
            
            // MARK: bottom message
            NavigationLink {
                RegistrationView()
                    .navigationBarHidden(true)
            } label: {
                HStack {
                    Text("Don't have an account?")
                    Text("Sign In")
                        .font(.headline)
                }
                .foregroundColor(Color(.systemBlue))
                .padding(.bottom, 40)
            }
        }
        .ignoresSafeArea()
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
