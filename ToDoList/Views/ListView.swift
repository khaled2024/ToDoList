//
//  ListView.swift
//  ToDoList
//
//  Created by KhaleD HuSsien on 15/11/2022.
//

import SwiftUI

struct ListView: View {
    var items: [String] = ["This is first item!","This is second item!","This is third item!"]
    var body: some View {
        List{
            ForEach(items, id: \.self) { item in
                ListRowView(title: item)
            }
        }
        .listStyle(.plain)
        .navigationTitle("Todo List📝")
        .navigationBarItems(leading: EditButton(),
                            trailing: NavigationLink("Add", destination: AddView()))
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ListView()
        }
    }
}


