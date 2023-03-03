//
//  ChatView.swift
//  m3taChatAI
//
//  Created by Bekir Kus on 11.02.23.
//

import SwiftUI
import OpenAISwift

enum ChatMessageDirection {
    case left
    case right
}


struct ChatView: View {
    @ObservedObject var viewModel = ViewModel()
    @State var text = ""
    @State var messages: [MessageData] = []
    
    
    var left = false
    
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color(.systemIndigo)
                    .ignoresSafeArea()
                
                VStack{
                    List {
                        ForEach(messages) { message in
                            HStack(){
                                if(message.isResponse){        // <--- left
                                    Text(message.message)
                                        .padding()
                                        .background(.cyan)
                                        .clipShape(RoundedRectangle(cornerRadius: 16.0, style: .continuous))
                                    //                                        .overlay(alignment: .bottomLeading) {
                                    //                                            Image(systemName: "arrowtriangle.down.fill")
                                    //                                                .font(.title)
                                    //                                                .rotationEffect(.degrees(60))
                                    //                                                .offset(x: -10, y: 5)
                                    //                                                .foregroundColor(.green)
                                    //                                        }
                                    Spacer()
                                } else {                        // <--- right
                                    Spacer()
                                    
                                    Text(message.message)
                                        .padding()
                                        .background(.cyan)
                                        .clipShape(RoundedRectangle(cornerRadius: 16.0, style: .continuous))
                                    //                                        .overlay(alignment: .bottomLeading) {
                                    //                                            Image(systemName: "arrowtriangle.down.fill")
                                    //                                                .font(.title)
                                    //                                                .rotationEffect(.degrees(60))
                                    //                                                .offset(x: 125, y: 4)
                                    //                                                .foregroundColor(.green)
                                    //                                        }
                                }
                                
                            }
                            .frame(maxWidth: .infinity)
                        }
                        .listRowBackground(Color(.systemIndigo))
                    }
                    .listStyle(.plain)
                    
                    
                    HStack(alignment: .bottom){
                        TextField("ASK ME SOMETHING...", text: $text)
                            .foregroundColor(.white)
                        Button("GO") {
                            send()
                            text = ""
                        }
                    }
                }
                .onAppear {
                    viewModel.setup()
                }
                .background(Color.indigo)
                .navigationTitle("CHAT WITH AI")
                .foregroundColor(.white)
                .preferredColorScheme(.dark)
                .padding()
                //.background(Color.indigo)
                
                
            }
            
            
            
        }
    }
    
    func send() {
        guard !text.trimmingCharacters(in: .whitespaces).isEmpty else {
            return
        }
        
        messages.append(MessageData(message:"Me: \(text)", isResponse: false))
        viewModel.send(text: text) { response in
            DispatchQueue.main.async {
                self.messages.append(MessageData(message: "M3taAI:"+response, isResponse: true))
                self.text = ""
            }
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
