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
        @State var currentBackgroundColor = Color("Main")
        private var backgroundColors = [Color("Main"), Color("Dark"), Color("Orange")]
        
        
        
        var body: some View {
                ZStack {
                    
                    currentBackgroundColor
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
                .navigationBarBackButtonHidden(true)
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
                .environmentObject(ListViewModel())
        }
        
    }

