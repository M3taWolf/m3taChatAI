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
    
    init() {
        FirebaseApp.configure()
        
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                
                ContentView()
            }
            .environmentObject(listViewModel)
        }
    }
}
