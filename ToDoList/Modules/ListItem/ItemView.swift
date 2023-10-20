//
//  ItemView.swift
//  ToDoList
//
//  Created by Rakesh Kusuma on 20/10/23.
//

import SwiftUI

struct ItemView: View {
    
    @StateObject var viewModel: ItemViewModel = ItemViewModel()
    @Binding var newItemPresented: Bool
    
    var body: some View {
        VStack {
            Text("New Item")
                .font(.headline)
                .padding()
            Form {
                TextField("Title", text: $viewModel.title)
                
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(.automatic)
                
                TDLButton(title: "Save", backgroundColor: .purple) {
                    if viewModel.canSave {
                        viewModel.save()
                        newItemPresented = false
                    } else {
                        viewModel.showAlert = true
                    }
                }
                .padding(.top, 20)
                .padding(.bottom, 10)
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text("Error"), message: Text("Please fill all fields"))
            }
        }
    }
}

#Preview {
    ItemView(newItemPresented: .constant(false))
}
