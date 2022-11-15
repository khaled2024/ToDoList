//
//  AddView.swift
//  ToDoList
//
//  Created by KhaleD HuSsien on 15/11/2022.
//

import SwiftUI

struct AddView: View {
    @State var text: String = ""
    var body: some View {
        ScrollView{
            VStack(spacing: 10){
                TextField("Add an item here...", text: $text)
                    .font(.title2)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .padding(.leading, 10)
                    .background {
                        Color.gray.brightness(0.3)
                            .cornerRadius(15)
                    }
                Button {
                    
                } label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background {
                            Color.blue.cornerRadius(15)
                        }
                }
                
            }
            .padding(20)
        }
        .navigationTitle("Add an item 🖋️")
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AddView()
        }
    }
}
