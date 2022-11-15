//
//  ListRowView.swift
//  ToDoList
//
//  Created by KhaleD HuSsien on 15/11/2022.
//

import SwiftUI

struct ListRowView: View {
    var title: String
    var body: some View {
        HStack{
            Image(systemName: "checkmark.circle")
            Text(title)
            Spacer()
        }
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var previews: some View {
        ListRowView(title: "This is first item!")
    }
}
