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
    }
}

extension ChatViewController: ChatViewDelegate {
    func ChatView(_ view: ChatView, didTapButton button: UIButton) {
    }
}
