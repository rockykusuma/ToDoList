//
//  RegistrationViewModel.swift
//  ToDoList
//
//  Created by Rakesh Kusuma on 20/10/23.
//


import Foundation
import Observation
import FirebaseAuth
import FirebaseFirestore

@Observable
final class RegistrationViewModel {
    var name = ""
    var email = ""
    var password = ""
    var errorMessage: String?
    
    func registration() {
        guard validate() else {
            return
        }
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            if let error = error {
                self?.errorMessage = error.localizedDescription
            } else {
                guard let userId = result?.user.uid else {
                    return
                }                
                self?.insertUserRecord(id: userId)
            }
        }
    }
    
    private func insertUserRecord(id: String) {
        let user = User(id: id, name: name, email: email, joined: Date().timeIntervalSince1970)
        let db = Firestore.firestore()
        db.collection("users")
            .document(id)
            .setData(user.asDictionary())
    }
    
    private func validate() -> Bool {
        errorMessage?.removeAll()
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty, !email.trimmingCharacters(in: .whitespaces).isEmpty, !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please fill all the fields"
            return false
        }
        guard email.isValidEmail() else {
            errorMessage = "Please enter valid email."
            return false
        }
        return true
    }
}
