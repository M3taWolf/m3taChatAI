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
                            .foregroundColor(.white)
                            .background(Color.cyan.opacity(0.4))
                            .cornerRadius(20)
                        
                        SecureField("Password", text: $viewModel.password)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.cyan.opacity(0.4))
                            .cornerRadius(20)
                        
                        Button {
                            viewModel.signIn()
                           
                        } label: {
                            NavigationLink("Log in", destination: ContentView())
                            //Text("Sign In")
                            
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(Color.cyan)
                            .cornerRadius(20)

                        }
            
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
                .environmentObject(ListViewModel())
                .environmentObject(SignInViewModel())
        }
    }
}
