//
//  Home.swift
//  m3taChatAI
//
//  Created by Bekir Kus on 11.02.23.
//

import SwiftUI

struct Home: View {
   
    @State var header = HeaderView.self
    
    var body: some View {
        ZStack(alignment: .bottom, content: {
//            Color(.systemIndigo)
//                  .ignoresSafeArea()
            VStack(alignment: .leading) {
                HeaderView(title1: "The Future is now.", title2: "Ask the AI.")
                    .ignoresSafeArea()
                Spacer()
                HStack {
                    Image(systemName: "")
                    
                }
                
                
                
            }
        })
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

