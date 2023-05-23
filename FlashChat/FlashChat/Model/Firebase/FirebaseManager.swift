//
//  FirebaseManager.swift
//  FlashChat
//
//  Created by Andrey on 23.05.2023.
//

import Foundation
import Firebase

class FirebaseManager {
    
    static let shared = FirebaseManager()
    
    private init() {}
    
    func registration(withEmail email: String, password: String, complition: @escaping (Error?) -> ()) {
        Auth.auth().createUser(withEmail: email, password: password) { result, err in
            if err == nil {
                complition(nil)
            } else {
                complition(err)
            }
        }
    }
    
    func logIn(withEmail email: String, password: String, complition: @escaping (Error?) -> ()) {
        Auth.auth().signIn(withEmail: email, password: password) { result, err in
            if err == nil {
                complition(nil)
            } else {
                complition(err)
            }
        }
    }
    
    func logOut(complition: @escaping () -> ()) {
        do {
            try Auth.auth().signOut()
            complition()
        } catch {
            
        }
    }
}
