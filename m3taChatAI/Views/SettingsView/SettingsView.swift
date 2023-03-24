//
//  SettingsView.swift
//  m3taChatAI
//
//  Created by Bekir Kus on 20.02.23.
//

import SwiftUI


    
struct SettingsView: View {
    
    let personalURL = URL(string: "https://www.github.com/M3taWolf")!
    let apiURL = URL(string: "https://openai.com/")!
    @State var currentBackgroundColor = Color("")
    
    var backgroundColors = [Color("Main"), Color("Dark"), Color("Orange")]
    
    var body: some View {
        
        NavigationView {
            ZStack {
                currentBackgroundColor
                    .ignoresSafeArea()
                
                
                Form {
                    
                    
                    Section(header: Text("Display"),
                            footer: Text("System settings will override Dark mode and use the current device theme")) {
                        
                        
                        Toggle(isOn: .constant(false),
                               label: {
                            Text("Dark mode")
                            
                        })
                        
                        
                        Toggle(isOn: .constant(false),
                               label: {
                            Text("Use system settings")
                        })
                        
                        HStack{
                            Text("Change Theme")
                            Spacer()
                            Image(systemName: "pencil.and.outline")
                                .onTapGesture {
                                    if let random = backgroundColors.randomElement() { // App storage
                                        withAnimation{
                                            currentBackgroundColor = random
                                       }
                                  }
                             }
                        }
                    }
                    
                    Section {
                        //Label("Go check my GitHub Account", systemImage: "link")
                        Link("Visit my personal GitHub", destination: personalURL)
                        
                            .foregroundColor(.cyan)
                            .font(.system(size: 16, weight: .semibold))
                    }
                    Section {
                        Link("This API is powered by OpenAI", destination: apiURL)
                    }
                    
                    .foregroundColor(.cyan)
                    .font(.system(size: 16, weight: .semibold))
                    
                }
                
                .background(Color.cyan)
                .navigationTitle("Settings")
                
            }
            
            
            
        }
    }
}

    struct SettingsView_Previews: PreviewProvider {
        static var previews: some View {
            SettingsView()
        }
    }
