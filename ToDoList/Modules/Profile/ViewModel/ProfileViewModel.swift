//
//  ProfileViewModel.swift
//  ToDoList
//
//  Created by Rakesh Kusuma on 20/10/23.
//

import Foundation
import FirebaseAuth

final class ProfileViewModel {
    
    
    func logout() {
        do {
            try Auth.auth().signOut()
            } catch let err {
                print(err)
        }
    }
}
