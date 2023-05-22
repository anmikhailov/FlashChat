//
//  ChatView.swift
//  FlashChat
//
//  Created by Andrey on 22.05.2023.
//

import UIKit

protocol ChatViewDelegate: AnyObject {
    func ChatView(_ view: ChatView, didTapButton button: UIButton)
}

class ChatView: CustomView {
    weak var delegate: ChatViewDelegate?
    
    //MARK: - Variables
    // Add private lazy variables here
    
    //MARK: - setViews
    override func setViews() {
        super.setViews()
        
        // Add subviews here
    }
    
    //MARK: - layoutViews
    override func layoutViews() {
        super.layoutViews()
        
        // Add constraints here
    }
}

//MARK: - Target Actions
private extension ChatView {
    @objc func didTapButton(_ button: UIButton) {
        delegate?.ChatView(self, didTapButton: button)
    }
}

