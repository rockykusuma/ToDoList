//
//  ProfileView.swift
//  ToDoList
//
//  Created by Rakesh Kusuma on 20/10/23.
//

import SwiftUI

struct ProfileView: View {
    var viewModel: ProfileViewModel = ProfileViewModel()
    var body: some View {
        NavigationStack {
            VStack {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                TDLButton(title: "SignOut", backgroundColor: Color.red) {
                    viewModel.logout()
                }
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
            }
            .navigationTitle("To Do List")
        }
    }
}

#Preview {
    ProfileView()
}
