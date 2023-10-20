//
//  MainViewModel.swift
//  ToDoList
//
//  Created by Rakesh Kusuma on 20/10/23.
//

import Foundation
import FirebaseAuth

final class MainViewModel: ObservableObject {
    
    @Published var currentUserId: String = ""
    private var handler: AuthStateDidChangeListenerHandle?
    
    init() {
        self.handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            DispatchQueue.main.async {
                print("Previoulsy logged user-> \(user?.uid ?? "")")
                self?.currentUserId = user?.uid ?? ""
            }            
        }
    }
    
    var isUserSignedIn: Bool {
        return Auth.auth().currentUser != nil
    }
}
