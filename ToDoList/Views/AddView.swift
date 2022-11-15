//
//  AddView.swift
//  ToDoList
//
//  Created by KhaleD HuSsien on 15/11/2022.
//

import SwiftUI

struct AddView: View {
    //MARK: - Vars
    @State var showAlert: Bool = false
    @State var titleAlert: String = ""
    @EnvironmentObject var listViewModel: ListViewModel
    @State var text: String = ""
    @Environment(\.presentationMode) var presentationMode
    //MARK: -  Body
    var body: some View {
        ScrollView{
            VStack(spacing: 10){
                TextField("Add an item here...", text: $text)
                    .font(.title2)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .padding(.leading, 10)
                    .background {
                        Color(uiColor: .secondarySystemBackground)
                            .cornerRadius(15)
                    }
                Button {
                    saveButtonPressed()
                } label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background {
                            Color.accentColor.cornerRadius(15)
                        }
                }
                
            }
            .padding(20)
        }
        .navigationTitle("Add an item 🖋️")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    //MARK: - functions
    func saveButtonPressed(){
        if textValied() {
            listViewModel.addItem(title: text)
            presentationMode.wrappedValue.dismiss()
        }
    }
    // textValid
    func textValied()-> Bool{
        if text.count < 3 {
            titleAlert = "Please write 3 Charcters at least 😇"
            showAlert.toggle()
            return false
        }
        return true
    }
    // get Alert
    func getAlert() -> Alert{
        return Alert(title: Text(titleAlert))
    }
    
}
//MARK: - PreviewProvider
struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AddView()
        }
        .environmentObject(ListViewModel())
    }
}
