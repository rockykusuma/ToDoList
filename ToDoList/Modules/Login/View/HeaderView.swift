//
//  HeaderView.swift
//  ToDoList
//
//  Created by Rakesh Kusuma on 20/10/23.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let subTitle: String
    let angle: Double
    let backgroundColor: Color
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundStyle(backgroundColor)
                .rotationEffect(.degrees(angle))
                .offset(y: -100)
            VStack {
                Text(title)
                    .font(.system(size: 50))
                    .foregroundStyle(Color.white)
                    .fontWeight(.heavy)
                Text(subTitle)
                    .font(.headline)
                    .foregroundStyle(Color.white)
                    .bold()
            }
            .padding(.top, -50)
        }
        .ignoresSafeArea()
        .frame(width: UIScreen.main.bounds.size.width * 3, height: 300)
    }
}

#Preview {
    HeaderView(title: "To Do List", subTitle: "Note it down", angle: -40, backgroundColor: .teal)
}
