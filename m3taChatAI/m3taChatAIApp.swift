//
//  m3taChatAIApp.swift
//  m3taChatAI
//
//  Created by Bekir Kus on 10.02.23.
//

import SwiftUI
import Firebase

@main
struct m3taChatAIApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    @StateObject private var viewModel = SignInViewModel()
    
    init() {
        FirebaseApp.configure()
        
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                if(viewModel.hasUser) {
                    ContentView()
                } else {
                    SignInEmailView().environmentObject(viewModel)
                }
                //SignInEmailView()
                //ContentView()
            }
            .environmentObject(listViewModel)
        }
    }
}
