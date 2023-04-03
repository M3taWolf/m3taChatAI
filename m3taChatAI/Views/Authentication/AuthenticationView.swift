//
//  AuthenticationView.swift
//  m3taChatAI
//
//  Created by Bekir Kus on 30.03.23.
//

import SwiftUI

struct AuthenticationView: View {
    
    @State var currentBackgroundColor = Color("Main")
    
    var body: some View {
        ZStack {
            currentBackgroundColor
                .ignoresSafeArea()
            VStack {
                HeaderView(title1: "Hey Human.", title2: "Please sign in.")
                    .ignoresSafeArea()
                Spacer()
                NavigationLink {
                    SignInEmailView()
                } label: {
                    Text("Sign In with eMail")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.cyan)
                        .cornerRadius(20)
                }
                 
                .padding()
                Spacer()
            }
        }
    }
}


struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            AuthenticationView()
        }
    }
}
