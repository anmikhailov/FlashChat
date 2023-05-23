//
//  ChatViewController.swift
//  FlashChat
//
//  Created by Andrey on 22.05.2023.
//

import UIKit

class ChatViewController: CustomViewController<ChatView> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customView.delegate = self
        title = "⚡️FlashChat"
        navigationItem.hidesBackButton = true
        navigationItem.rightBarButtonItem = customView.logOutBarButton
    }
}

extension ChatViewController: ChatViewDelegate {
    func ChatView(_ view: ChatView, didTapSendMessageButton button: UIButton) {
        print("Send message")
    }
    
    func ChatView(_ view: ChatView, didTapLogOutButton button: UIButton) {
        FirebaseManager.shared.logOut {
            self.navigationController?.popToRootViewController(animated: true)
        }
    }
}
