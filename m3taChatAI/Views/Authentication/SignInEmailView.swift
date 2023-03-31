//
//  SignInEmailView.swift
//  m3taChatAI
//
//  Created by Bekir Kus on 30.03.23.
//

import SwiftUI

@MainActor
struct SignInEmailView: View {
    
    @State var currentBackgroundColor = Color("Main")
    @StateObject private var viewModel = SignInViewModel()
    
    
    var body: some View {
        ZStack {
            currentBackgroundColor
                .ignoresSafeArea()
            VStack {
                HeaderView(title1: "Hey Human.", title2: "Please sign in.")
                    .ignoresSafeArea()
                Spacer()
                VStack {
                    TextField("eMail", text: $viewModel.email)
                        .padding()
                        .foregroundColor(.green)
                        .background(Color.cyan.opacity(0.4))
                        .cornerRadius(30)
                    
                    SecureField("Password", text: $viewModel.password)
                        .padding()
                        .foregroundColor(.green)
                        .background(Color.cyan.opacity(0.4))
                        .cornerRadius(30)
                    
                    Button {
                        viewModel.signIn()
                    } label: {
                        Text("Sign In")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.cyan)
                        .cornerRadius(30)
                    
                }
                    //Spacer()
                    
                }
                .padding()
            }
        }
    }
}

struct SignInEmailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SignInEmailView()
        }
    }
}