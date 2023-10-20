//
//  MainViewModel.swift
//  ToDoList
//
//  Created by Rakesh Kusuma on 20/10/23.
//

import Foundation
import FirebaseAuth

final class MainViewModel: ObservableObject {
    
    @Published var currentUserId: String = "123"
    private var handler: AuthStateDidChangeListenerHandle?
    
    init() {
        self.handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            DispatchQueue.main.async {
                if let uid = user?.uid {
                    self?.currentUserId = uid
                    print("Previoulsy logged user-> \(uid)")
                } else {
                    self?.currentUserId.removeAll()
                }
            }            
        }
    }
    
    var isUserSignedIn: Bool {
        return Auth.auth().currentUser != nil
    }
}
