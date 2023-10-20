//
//  NoItemsView.swift
//  ToDoList
//
//  Created by Rakesh Kusuma on 20/10/23.
//

import SwiftUI

struct NoItemsView: View {
    
    @State var animate: Bool = false
    @State var shouldShowItemSheet: Bool = false
    @State var secondaryAccentColor = Color("SecondaryAccentColor")
 
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                Text("There are no items!")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .bold()
                Text("Would you like to be Productive? You are at the right place. Click the add buttton below and start adding Todos")
                    .padding(.bottom, 20)
                Button(action: {
                    shouldShowItemSheet = true
                }, label: {
                    Text("Add Something  ✍🏽")
                        .foregroundStyle(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        .background(animate ? secondaryAccentColor : Color.accentColor)
                        .cornerRadius(10)
                })
                .padding(.horizontal, animate ? 30 : 50)
                .shadow(color: animate ? secondaryAccentColor.opacity(0.7) : Color.accentColor.opacity(0.7),
                        radius: animate ? 30 : 10,
                        x: 0,
                        y: animate ? 50 : 30)
                .scaleEffect(animate ? 1.1 : 1.0)
                .offset(y: animate ? -7 : 0)
            }
            .frame(maxWidth: 400)
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
        .sheet(isPresented: $shouldShowItemSheet) {
            ItemView()
        }
    }
    
    func addAnimation() {
        guard !animate else {
            return
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(.easeInOut(duration: 2.0).repeatForever() ) {
                animate.toggle()
            }
        }
    }
}

#Preview {
    NavigationStack {
        NoItemsView()
            .navigationTitle("Title")
    }
    
}
