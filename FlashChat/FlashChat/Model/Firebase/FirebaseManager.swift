//
//  FirebaseManager.swift
//  FlashChat
//
//  Created by Andrey on 23.05.2023.
//

import Foundation
import Firebase
import FirebaseFirestore

class FirebaseManager {
    
    static let shared = FirebaseManager()
    
    private init() {}
    
    let db = Firestore.firestore()
    
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
    
    func getCurrentUser() -> String? {
        return Auth.auth().currentUser?.email
    }
    
    func addDataToDb(sender: String, message: String) {
        if message != "" {
            db.collection(FStoreConstants.collectionName).addDocument(data: [
                FStoreConstants.senderField: sender,
                FStoreConstants.bodyField: message,
                FStoreConstants.dateField: Date().timeIntervalSince1970
            ]) { err in
                if err != nil {
                    print(err ?? "")
                }
            }
        }
    }
    
    func readDataFromDb(complition: @escaping ([Message]) -> ()) {
        db.collection(FStoreConstants.collectionName).order(by: FStoreConstants.dateField).addSnapshotListener { querySnp, err in
            if err == nil {
                if let snpDocuments = querySnp?.documents {
                    var messages: [Message] = []
                    
                    for doc in snpDocuments {
                        let data = doc.data()
                        if let messageSender = data[FStoreConstants.senderField] as? String, let messageBody = data[FStoreConstants.bodyField] as? String {
                            let newMessage = Message(sender: messageSender, content: messageBody)
                            messages.append(newMessage)
                            complition(messages)
                        }
                    }
                }
            } else {
                print(err ?? "")
            }
        }
    }
}
