//
//  ChatView.swift
//  FlashChat
//
//  Created by Andrey on 22.05.2023.
//

import UIKit

protocol ChatViewDelegate: AnyObject {
    func ChatView(_ view: ChatView, didTapSendMessageButton button: UIButton)
    func ChatView(_ view: ChatView, didTapLogOutButton button: UIButton)
}

class ChatView: CustomView {
    weak var delegate: ChatViewDelegate?
    
    //MARK: - Variables
    lazy var logOutBarButton: UIBarButtonItem = {
        let element = UIBarButtonItem(title: "Log Out", style: .plain, target: self, action: #selector(didTapLogOutButton(_:)))
        return element
    }()
    
    lazy var chatTableView: UITableView = {
        let element = UITableView()
        element.register(MessageCell.self, forCellReuseIdentifier: MessageCell.identifier)
        element.separatorStyle = .none
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    lazy var messageView: UIView = {
        let element = UIView()
        element.backgroundColor = Resources.Colors.purple
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    lazy var messageTextField: UITextField = {
        let element = UITextField()
        element.placeholder = "Write a message"
        element.backgroundColor = .white
        element.layer.cornerRadius = 5
        element.font = UIFont.systemFont(ofSize: 18)
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 30))
        element.leftView = paddingView
        element.leftViewMode = .always
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var sendMessageButton: UIButton = {
        let element = UIButton()
        element.setImage(Resources.Images.sendMessageIcon, for: .normal)
        element.tintColor = .white
        element.translatesAutoresizingMaskIntoConstraints = false
        element.addTarget(self, action: #selector(didTapSendMessageButton(_:)), for: .touchUpInside)
        return element
    }()

    //MARK: - setViews
    override func setViews() {
        super.setViews()
        
        backgroundColor = Resources.Colors.blue
        
        self.addSubview(chatTableView)
        self.addSubview(messageView)
        
        messageView.addSubview(messageTextField)
        messageView.addSubview(sendMessageButton)
    }
    
    //MARK: - layoutViews
    override func layoutViews() {
        super.layoutViews()
        
        NSLayoutConstraint.activate([
            chatTableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            chatTableView.bottomAnchor.constraint(equalTo: messageView.topAnchor),
            chatTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            chatTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            messageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            messageView.heightAnchor.constraint(equalToConstant: 90),
            messageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            messageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            messageTextField.topAnchor.constraint(equalTo: messageView.topAnchor, constant: 10),
            messageTextField.heightAnchor.constraint(equalToConstant: 40),
            messageTextField.leadingAnchor.constraint(equalTo: messageView.leadingAnchor, constant: 20),
            messageTextField.trailingAnchor.constraint(equalTo: sendMessageButton.leadingAnchor, constant: -20),
            
            sendMessageButton.topAnchor.constraint(equalTo: messageView.topAnchor, constant: 10),
            sendMessageButton.heightAnchor.constraint(equalToConstant: 40),
            sendMessageButton.trailingAnchor.constraint(equalTo: messageView.trailingAnchor, constant: -20),
            sendMessageButton.widthAnchor.constraint(equalToConstant: 40),
        ])
    }
}

//MARK: - Target Actions
private extension ChatView {
    @objc func didTapSendMessageButton(_ button: UIButton) {
        delegate?.ChatView(self, didTapSendMessageButton: button)
    }
    
    @objc func didTapLogOutButton(_ button: UIButton) {
        delegate?.ChatView(self, didTapLogOutButton: button)
    }
}

