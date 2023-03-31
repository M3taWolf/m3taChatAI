//
//  SignInViewModel.swift
//  m3taChatAI
//
//  Created by Bekir Kus on 30.03.23.
//

import Foundation

final class SignInViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    
    func signIn() {
        guard !email.isEmpty, !password.isEmpty else {
            print("No email or password found.")
            return
        }
        
        Task {
            do {
                let returnedUserData = try await AuthenticationManager.shared.createUser(email: email, password: password)
                print("Success")
                print(returnedUserData)
            } catch {
              print("Error: \(error)")
                
            }
        }
    }
}
