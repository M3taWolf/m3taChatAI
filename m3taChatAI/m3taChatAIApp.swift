//
//  m3taChatAIApp.swift
//  m3taChatAI
//
//  Created by Bekir Kus on 10.02.23.
//

import SwiftUI

@main
struct m3taChatAIApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                
                ContentView()
            }
            .environmentObject(listViewModel)
        }
    }
}
