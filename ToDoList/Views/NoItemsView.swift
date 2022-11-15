//
//  NoItemsView.swift
//  ToDoList
//
//  Created by KhaleD HuSsien on 15/11/2022.
//

import SwiftUI

struct NoItemsView: View {
    @State var animate: Bool = false
    let sceondryAccentColor = Color("SecondryAccentColor")
    var body: some View {
        ScrollView{
            VStack(spacing: 10){
                Text("There are No Items!")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Are you productive person? I think you should click the add button and add a bunch of items to your Todo List ")
                    .padding(.bottom, 20)
                NavigationLink(destination: AddView()) {
                    Text("Add Somthing 🥳")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background {
                            animate ? sceondryAccentColor : Color.accentColor
                        }
                        .cornerRadius(10)
                }
                .padding(.horizontal, animate ? 30 : 50)
                .shadow(color: animate ? sceondryAccentColor.opacity(0.7) : Color.accentColor.opacity(0.7),
                        radius: animate ? 30 : 10,
                        x: 0,
                        y: animate ? 40 : 20)
                .scaleEffect(animate ? 1.1 : 1.0)
                .offset(y:animate ? -7 : 0)
            }
            .frame(maxWidth: 400)
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    // functions
    func addAnimation(){
        // if animate == false  excuted
        // if animate == true  not excuted
        guard !animate else{return}
        DispatchQueue.main.asyncAfter(deadline: .now()+1.5, execute: {
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ) {
                animate.toggle()
            }
        })
    }
}
struct NoItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            NoItemsView()
                .navigationTitle("Title:)")
        }
    }
}
