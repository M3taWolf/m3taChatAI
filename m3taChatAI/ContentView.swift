//
//  ContentView.swift
//  m3taChatAI
//
//  Created by Bekir Kus on 10.02.23.
//

import SwiftUI
import OpenAISwift

    
    struct ContentView: View {
        
        @State var selectedTab = "house.fill"
        @ObservedObject var viewModel = ViewModel()
        
        
        var body: some View {
                ZStack {
                    Color(.systemIndigo)
                        .ignoresSafeArea()
                    
                    VStack{
                        
                        if selectedTab == "house.fill" {
                            Home()
                        }

                        if selectedTab == "message.fill" {
                            ChatView()
                        }
                        
                        if selectedTab == "list.bullet" {
                            ListView()
                        }
                        
                        if selectedTab == "gearshape.fill" {
                            SettingsView()
                        }
                       
                        Spacer()
                        CustomTabBar(selectedTab: $selectedTab)
                        
                }
            }
        }
    }
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
                .environmentObject(ListViewModel())
        }
        
    }

