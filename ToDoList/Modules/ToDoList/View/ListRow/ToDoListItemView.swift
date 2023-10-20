//
//  ToDoListItemView.swift
//  ToDoList
//
//  Created by Rakesh Kusuma on 20/10/23.
//

import SwiftUI

struct ToDoListItemView: View {
    let item: ToDoListItem
    @StateObject var viewModel: ToDoListItemViewModel = ToDoListItemViewModel()
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.body)
                    .bold()
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundStyle(Color.secondary)
            }
            Spacer()
            Button {
                withAnimation(.linear) {
                    viewModel.toggleCheckMark(item: item)
                }                
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                    .foregroundStyle(item.isDone ? .green : .red)
            }
        }
    }
}

#Preview {
    ToDoListItemView(item: ToDoListItem(id: "123", title: "Get Curd", dueDate: Date().timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: false))
        .previewLayout(.sizeThatFits)
}
