//
//  TDLButton.swift
//  ToDoList
//
//  Created by Rakesh Kusuma on 20/10/23.
//

import SwiftUI

struct TDLButton: View {
    
    let title: String
    let backgroundColor: Color
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(backgroundColor)
                Text(title)
                    .foregroundStyle(Color.white)
                    .bold()
            }
        }
        .frame(height: 44)
    }
}

#Preview {
    TDLButton(title: "Log In", backgroundColor: .teal) {
        
    }
}
