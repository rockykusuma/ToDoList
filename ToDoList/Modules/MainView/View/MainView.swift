//
//  ContentView.swift
//  ToDoList
//
//  Created by Rakesh Kusuma on 20/10/23.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var viewModel: MainViewModel = MainViewModel()
    
    var body: some View {
        if viewModel.isUserSignedIn, !viewModel.currentUserId.isEmpty {
            accountView
        } else {
            NavigationStack {
                LoginView()
            }            
        }
    }
    
    private var accountView: some View {
        TabView {
            ToDoListView(userId: viewModel.currentUserId)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
        }
    }
}

#Preview {
    MainView()
}
