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
                Text("Settings")
                    .font(.title)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    .padding(.leading)
                
                Toggle(isOn: .constant(false),
                       label: {
                    Text("Dark mode")
                    
                })
                .padding()
                
                Toggle(isOn: .constant(false),
                       label: {
                    Text("Use system settings")
                })
                .padding()
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
                .padding()
                
                //Label("Go check my GitHub Account", systemImage: "link")
                Link("Visit my personal GitHub", destination: personalURL)
                
                    .foregroundColor(.cyan)
                    .font(.system(size: 16, weight: .semibold))
                
                    .background(RoundedRectangle(cornerRadius: 20).frame(width: 250, height: 50))
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
                                    withAnimation(.default) {
                                        showLogOut = true
                                         NavigationLink("Log out", destination: AuthenticationView())
                                    }
                                   
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
        
        
        //NavigationView {
//            VStack {
//                Text("Settings")
//                currentBackgroundColor
//                    .ignoresSafeArea()
//
//
//
//
//               // Form {
//
//
//                    Section(header: Text("Display"),
//                            footer: Text("System settings will override Dark mode and use the current device theme")) {
//
//
//                        Toggle(isOn: .constant(false),
//                               label: {
//                            Text("Dark mode")
//
//                        })
//
//
//                        Toggle(isOn: .constant(false),
//                               label: {
//                            Text("Use system settings")
//                        })
//
//                        HStack{
//                            Text("Change Theme")
//                            Spacer()
//                            Image(systemName: "pencil.and.outline")
//                                .onTapGesture {
//                                    if let random = backgroundColors.randomElement() { // App storage
//                                        withAnimation{
//                                            currentBackgroundColor = random
//                                        }
//                                    }
//                                }
//                        }
//                    }
//
//                    Section {
//                        //Label("Go check my GitHub Account", systemImage: "link")
//                        Link("Visit my personal GitHub", destination: personalURL)
//
//                            .foregroundColor(.cyan)
//                            .font(.system(size: 16, weight: .semibold))
//                    }
//                    Section {
//                        Link("This API is powered by OpenAI", destination: apiURL)
//                    }
//
//                    .foregroundColor(.cyan)
//                    .font(.system(size: 16, weight: .semibold))
//
//                    Section {
//                        Button("Log out") {
//                            Task {
//                                do {
//                                    try viewModel.signOut()
//                                    NavigationLink("Log out", destination: AuthenticationView())
//                                    // showSignInView = true
//                                } catch {
//                                    print()
//                                }
//                            }
//                        }
//                    //}
//
//                    .foregroundColor(.cyan)
//                    .font(.system(size: 16, weight: .semibold))
//
//
//
//               // }
//                .background(Color.cyan)
//                .navigationTitle("Settings")
//
//            }
//
//
//
//        }
//            .background(currentBackgroundColor)
    }
        
}

    struct SettingsView_Previews: PreviewProvider {
        static var previews: some View {
            SettingsView()
                .environmentObject(ListViewModel())
                .environmentObject(SignInViewModel())
                .environmentObject(SettingsViewModel())
        }
    }
