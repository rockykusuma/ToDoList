//
//  ProfileViewModel.swift
//  ToDoList
//
//  Created by Rakesh Kusuma on 20/10/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

final class ProfileViewModel: ObservableObject {
    
    @Published var user: User?
    
    func fetchUser() {
        guard let id = Auth.auth().currentUser?.uid else {
            return
        }
        let db = Firestore.firestore()
        db.collection("users").document(id).getDocument { [weak self] snapshot, error in
            guard let data = snapshot?.data(), error == nil else {
                print(error?.localizedDescription ?? "No Error")
                return
            }
            DispatchQueue.main.async {
                self?.user = User(id: data["id"] as? String ?? "",
                                  name: data["name"] as? String ?? "",
                                  email: data["email"] as? String ?? "",
                                  joined: data["joined"] as? TimeInterval ?? 0
                )
            }
        }
    }
    
    
    func logout() {
        do {
            try Auth.auth().signOut()
            } catch let err {
                print(err)
        }
    }
}
