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
    @State var messages: [MessageData] = [MessageData(message: "M3taAI: Hey how are you feeling today?", isResponse: true)]
    @State var currentBackgroundColor = Color("Main")
    
    
    var left = false
    
    
    var body: some View {
            ZStack{
                currentBackgroundColor
                   .ignoresSafeArea()
                VStack(alignment: .leading) {
                    HeaderView(title1: "Hey Bekir.", title2: "Ask me anything.")
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
                                      
                                        
                                        Spacer()
                                    } else {                        // <--- right
                                        Spacer()
                                        
                                        Text(message.message)
                                            .padding()
                                            .background(.cyan)
                                            .clipShape(RoundedRectangle(cornerRadius: 16.0, style: .continuous))
                                   
                                    }
                                }
                            }
                            .listRowBackground(currentBackgroundColor)
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
                    .foregroundColor(.white)
                    .preferredColorScheme(.dark)
                    .padding()

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
