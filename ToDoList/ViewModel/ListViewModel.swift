//
//  ListViewModel.swift
//  ToDoList
//
//  Created by KhaleD HuSsien on 15/11/2022.
//

import Foundation
class ListViewModel: ObservableObject{
    @Published var items: [ItemModel] = [] {
        didSet{
            saveItems()
        }
    }
    let itemKey: String = "items_list"
    init() {
        getData()
    }
    //MARK: - Functions
    // getData
    func getData(){
        guard
            let data = UserDefaults.standard.data(forKey: itemKey),
            let savedItem = try? JSONDecoder().decode([ItemModel].self, from: data)
        else{return}
        self.items = savedItem
    }
    // delete
    func deleteItem(indexSet: IndexSet){
        items.remove(atOffsets: indexSet)
    }
    // move
    func moveItem(from: IndexSet , to: Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    // add
    func addItem(title: String){
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    // Update
    func updateItem(item: ItemModel){
        if let index = items.firstIndex(where: { $0.id == item.id }){
            // run code here
            items[index] = item.updateCompletion()
        }
    }
    // save items
    func saveItems(){
        // encode the whole Struct to json and decode it to data again
        if let encodedData = try? JSONEncoder().encode(items){
            UserDefaults.standard.set(encodedData, forKey: itemKey)
        }
    }
    
}
