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
    //@Binding var currentBackgroundColor: Color
    @State var currentBackgroundColor = Color("Main")
    @StateObject private var viewModel = SettingsViewModel()
    //@Binding var showSignInView: Bool
    
    var backgroundColors = [Color("Main"), Color("Dark"), Color("Orange")]
    @State var showLogOut: Bool = false
    
    var body: some View {
        
        ZStack {
            currentBackgroundColor
                .ignoresSafeArea()
            VStack {
                HeaderView(title1: "Your App.", title2: "Your Preferences.")
                    .ignoresSafeArea()
               VStack {
                    
                    Toggle(isOn: .constant(false),
                           label: {
                        Text("Dark mode")
                            .font(.system(size: 18, weight: .semibold))
                        
                    })
                    .padding()
                    
                    Toggle(isOn: .constant(false),
                           label: {
                        Text("Use system settings")
                            .font(.system(size: 18, weight: .semibold))
                    })
                    .padding()
                    HStack{
                        Text("Change Theme")
                            .font(.system(size: 18, weight: .semibold))
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
                    .padding()
                    
                   //Label("Go check my GitHub Account", systemImage: "link")
                   
                    Link("Visit my personal GitHub", destination: personalURL)
                       .foregroundColor(.white)
                       .font(.system(size: 16, weight: .semibold))
                       .background(RoundedRectangle(cornerRadius: 20).fill(.cyan).frame(width: 250, height: 50))
                       
                       .padding(.top, 30)
                   

                    Link("This API is powered by OpenAI", destination: apiURL)
                        .foregroundColor(.cyan)
                        .font(.system(size: 16, weight: .semibold))
                        .background(RoundedRectangle(cornerRadius: 20).frame(width: 250, height: 50))
                        .padding(.top, 30)
                    
                    Button("Log out") {
                        Task {
                            do {
                                try viewModel.signOut()
                                
                                showLogOut = true
                                
                                
                                //showSignInView = true
                            } catch {
                                print()
                            }
                        }
                    }
                    .background(RoundedRectangle(cornerRadius: 20).frame(width: 250, height: 50))
                    .padding(.top, 30)
                   
                    
                    
                }
                //.sheet(isPresented: $showLogOut, content: AuthenticationView())
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            }
        }
        .navigationDestination(isPresented: $showLogOut) {
            AuthenticationView()
        }
    }
}

    struct SettingsView_Previews: PreviewProvider {
        static var previews: some View {
            //@State var color = Color
            NavigationStack {
                SettingsView()
                //SettingsView(currentBackgroundColor: $color)
                    .environmentObject(ListViewModel())
                    .environmentObject(SignInViewModel())
                    .environmentObject(SettingsViewModel())
                    
            }
        }
    }
