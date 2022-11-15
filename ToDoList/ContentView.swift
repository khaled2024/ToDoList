//
//  ContentView.swift
//  ToDoList
//
//  Created by KhaleD HuSsien on 15/11/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            VStack {
                Image(systemName: "flame.fill")
                    .imageScale(.large)
                    .foregroundColor(.orange)
            }
            .padding()
            .navigationTitle("ToDo List")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ContentView()
        }
    }
}
