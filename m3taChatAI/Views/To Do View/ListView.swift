//
//  SwiftUIView.swift
//  m3taChatAI
//
//  Created by Bekir Kus on 23.02.23.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
        
   
    var body: some View {
        NavigationStack {
            VStack {
                //Text("To Do")
                
                
                
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
            .navigationTitle("24H TO DO")
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

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
            
                
            
        }
        .environmentObject(ListViewModel())
        
    }
}
