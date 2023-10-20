//
//  ToDoListView.swift
//  ToDoList
//
//  Created by Rakesh Kusuma on 20/10/23.
//

import SwiftUI
import FirebaseFirestoreSwift

struct ToDoListView: View {
    @StateObject var viewModel: ToDoListViewModel
    @FirestoreQuery var items: [ToDoListItem]
    
    init(userId: String) {
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        self._viewModel = StateObject(wrappedValue: ToDoListViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                if items.isEmpty {
                    NoItemsView()
                        .transition(AnyTransition.opacity.animation(.easeIn))
                } else {
                    listView
                }
            }
            .navigationTitle("Todo List 📝")
            .navigationViewStyle(.stack)
            .toolbar {
                Button {
                    viewModel.shouldShowItemSheet = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.shouldShowItemSheet) {
                ItemView()
            }
        }
    }
    
    var listView: some View {
        List(items) { item in
            ToDoListItemView(item: item)
                .swipeActions {
                    Button {
                        viewModel.deleteItem(id: item.id)
                    } label: {
                        Text("Delete")
                    }
                    .tint(.red)
                }
        }
        .listStyle(.plain)
    }
}

#Preview {
    ToDoListView(userId: "F4dRgBQOHoNZMXTSht8rR18wfzp1")
}
