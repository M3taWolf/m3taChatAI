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
        
        var body: some View {
            
            NavigationView {
                ZStack {
                    Color(.systemIndigo)
                        .ignoresSafeArea()
                    
                    
                    Form {
                        
                        
                        Section(header: Text("Display"),
                                footer: Text("System settings will override Dark mode and use the current device theme")) {
                            
                            
                            Toggle(isOn: .constant(true),
                                   label: {
                                Text("Dark mode")
                                
                            })
                            
                            
                            Toggle(isOn: .constant(true),
                                   label: {
                                Text("Use system settings")
                            })
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
