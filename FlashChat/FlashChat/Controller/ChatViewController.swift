//
//  ChatViewController.swift
//  FlashChat
//
//  Created by Andrey on 22.05.2023.
//

import UIKit

class ChatViewController: CustomViewController<ChatView> {
    
    var messages: [Message] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customView.delegate = self
        customView.chatTableView.delegate = self
        customView.chatTableView.dataSource = self
        
        configureNavBar()
        updateMessages()
    }
    
    func configureNavBar() {
        navigationController?.navigationBar.backgroundColor = Resources.Colors.blue
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = Resources.Colors.blue
        appearance.titleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 25, weight: .bold), NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.standardAppearance = appearance;
        navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance

        title = "⚡️FlashChat"
        navigationItem.hidesBackButton = true
        navigationItem.rightBarButtonItem = customView.logOutBarButton
        navigationItem.rightBarButtonItem?.tintColor = .white
    }
    
    func updateMessages() {
        FirebaseManager.shared.readDataFromDb { messages in
            self.messages = messages
            
            DispatchQueue.main.async {
                self.customView.chatTableView.reloadData()
                let indexPath = IndexPath(row: messages.count - 1, section: 0)
                self.customView.chatTableView.scrollToRow(at: indexPath, at: .top, animated: false)
            }
        }
    }
}

//MARK: - ChatViewDelegate
extension ChatViewController: ChatViewDelegate {
    func ChatView(_ view: ChatView, didTapSendMessageButton button: UIButton) {
        if let messageBody = customView.messageTextField.text, let messageSender = FirebaseManager.shared.getCurrentUser() {
            FirebaseManager.shared.addDataToDb(sender: messageSender, message: messageBody)
            customView.messageTextField.text = ""
        }
    }
    
    func ChatView(_ view: ChatView, didTapLogOutButton button: UIButton) {
        FirebaseManager.shared.logOut {
            self.navigationController?.popToRootViewController(animated: true)
        }
    }
}

//MARK: - UITableViewDataSource
extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MessageCell.identifier, for: indexPath) as? MessageCell else {
            fatalError("Error")
        }
        cell.isUserInteractionEnabled = false
        cell.messageView.layer.cornerRadius = 20
        cell.messageLabel.text = messages[indexPath.row].content
        
        if messages[indexPath.row].sender == FirebaseManager.shared.getCurrentUser() {
            cell.avatarMeImageView.isHidden = false
            cell.avatarYouImageView.isHidden = true
            cell.messageView.backgroundColor = Resources.Colors.lightPurple
            cell.messageLabel.textColor = Resources.Colors.purple
            cell.messageLabel.textAlignment = .right
        } else {
            cell.avatarMeImageView.isHidden = true
            cell.avatarYouImageView.isHidden = false
            cell.messageView.backgroundColor = Resources.Colors.purple
            cell.messageLabel.textColor = Resources.Colors.lightPurple
            cell.messageLabel.textAlignment = .left
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
}

extension ChatViewController: UITableViewDelegate {
    
}
