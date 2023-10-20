//
//  ToDoListItemViewModel.swift
//  ToDoList
//
//  Created by Rakesh Kusuma on 20/10/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class ToDoListItemViewModel: ObservableObject {
    
    
    func toggleCheckMark(item: ToDoListItem) {
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let id = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(id)
            .collection("todos")
            .document(item.id)
            .updateData(itemCopy.asDictionary())
    }
}
