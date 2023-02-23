//
//  HeaderView.swift
//  m3taChatAI
//
//  Created by Bekir Kus on 11.02.23.
//

import SwiftUI

struct HeaderView: View {
    let title1: String
    let title2: String
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack { Spacer() } // Trick for stretch
            
            Text(title1)
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            Text(title2)
                .font(.largeTitle)
                .fontWeight(.semibold)
        }
        .frame(height: 260)
        .padding(.leading)
        .background(Color(.systemCyan))
        .foregroundColor(.white)
        .clipShape(RoundedShape(corners: [.bottomRight]))
    }
}

struct AuthHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(title1: "The Future is now.", title2: "Ask the AI")
    }
}
