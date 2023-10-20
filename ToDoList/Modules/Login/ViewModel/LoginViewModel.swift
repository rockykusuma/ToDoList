//
//  LoginViewModel.swift
//  ToDoList
//
//  Created by Rakesh Kusuma on 20/10/23.
//

import Foundation
import Observation
import FirebaseAuth

@Observable
final class LoginViewModel {
    var email: String = ""
    var password: String = ""
    var errorMessage: String?
    
    func login() {
        guard validate() else {
            return
        }
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, error in
            if let error = error {
                self?.errorMessage = error.localizedDescription
            } else {
                print("Logged in User id -> \(result?.user.uid ?? "")")
            }
        }
    }
    
    private func validate() -> Bool {
        errorMessage?.removeAll()
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty, !password.trimmingCharacters(in: .whitespaces).isEmpty else {
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

