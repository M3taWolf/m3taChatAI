//
//  ListRowView.swift
//  m3taChatAI
//
//  Created by Bekir Kus on 23.02.23.
//

import SwiftUI

struct ListRowView: View {
    
    let item: ItemModel
    
    var body: some View {
        ZStack{
            Color(.systemIndigo)
                .ignoresSafeArea()
            HStack {
                Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                    .foregroundColor(item.isCompleted ? .green : .red)
                Text(item.title)
                Spacer()
            }
            .font(.title2)
            .padding(.vertical, 8)
            .foregroundColor(.white)
        }
        .preferredColorScheme(.dark)
        .listRowBackground(Color(.systemIndigo))
    }
}

struct ListRowView_Previews: PreviewProvider {
    
    static var item1 = ItemModel(title: "First item!", isCompleted: false)
    static var item2 = ItemModel(title: "Second item!", isCompleted: true)
    
    static var previews: some View {
        
        Group {
            ListRowView(item: item1)
            ListRowView(item: item2)
        }
        //.previewLayout(.sizeThatFits)
    }
}
