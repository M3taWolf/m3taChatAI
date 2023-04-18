//
//  SwiftUIView.swift
//  m3taChatAI
//
//  Created by Bekir Kus on 23.02.23.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    @State var currentBackgroundColor = Color("Main")

        
   
    var body: some View {
        NavigationStack {
            ZStack {
                currentBackgroundColor
                    .ignoresSafeArea()
                VStack(alignment: .leading) {
                    HeaderView(title1: "24 Hours.", title2: "Challenge accepted.")
                        .ignoresSafeArea()
                    
                    VStack {
                        if listViewModel.items.isEmpty {
                            NoItemsView()
                                .transition(AnyTransition.opacity
                                    .animation(.easeIn))
                        } else {
                            List {
                                ForEach(listViewModel.items) { item in
                                    ListRowView(item: item)
                                        .onTapGesture {
                                            withAnimation(.linear) {
                                                listViewModel.updateItem(item: item)
                                        }
                                    }
                                }
                                .onDelete(perform: listViewModel.deleteItem)
                                .onMove(perform: listViewModel.moveItem)
                                
                            }
                            .background(Color.indigo)
                            .listStyle(PlainListStyle())
                            
                        }
                    }
                    
                    .preferredColorScheme(.dark)
                    .foregroundColor(.cyan)
                    .navigationBarItems(
                        leading: EditButton()
                            .foregroundColor(.cyan),
                        trailing:
                            NavigationLink("Add", destination: AddView())
                        
                            .foregroundColor(.cyan)
                        
                    )
                }
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
      
        }
        .environmentObject(ListViewModel())
    }
}

   
