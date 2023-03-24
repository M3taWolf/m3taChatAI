//
//  ListViewModel.swift
//  m3taChatAI
//
//  Created by Bekir Kus on 23.02.23.
//

import Foundation

class ListViewModel: ObservableObject {
    
    @Published var items: [ItemModel] = [] {
        didSet {
            saveItems()
        }
    }
        
       
        
    let itemsKey: String = "items_list"
    
    init() {
        getItems()
    }
    
   func getItems() {
       guard
        let data = UserDefaults.standard.data(forKey: itemsKey),
        let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
       else { return }
       
       self.items = savedItems
   }
    
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
        //saveItems()
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
        //saveItems()
    }
    
    func addItem(title: String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
        //saveItems()
    }
    
    func updateItem(item: ItemModel) {
        
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = item.updateCompletion()
            //saveItems()
        }
    }
    
    func saveItems () {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: "items_list")
            
            
        }
    }
}
