//
//  ProfileView.swift
//  ToDoList
//
//  Created by Rakesh Kusuma on 20/10/23.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel: ProfileViewModel = ProfileViewModel()
    var body: some View {
        NavigationStack {
            VStack {
                if let user = viewModel.user {
                    Image(systemName: "person.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.yellow)
                        .frame(width: 100, height: 100)
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Name: ")
                            Text(user.name)
                        }
                        HStack {
                            Text("Email: ")
                            Text(user.email)
                        }
                        HStack {
                            Text("Member Since: ")
                            Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
                        }
                    }
                    Spacer()
                    TDLButton(title: "Log Out", backgroundColor: Color.red) {
                        viewModel.logout()
                    }
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                    Spacer()
                } else {
                    Text("Fetching Profile data...")
                }
            }
            .navigationTitle("Profile")
            .navigationViewStyle(.stack)
            .onAppear {
                viewModel.fetchUser()
            }
        }        
    }
}

#Preview {
    ProfileView()
}
