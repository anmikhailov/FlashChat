//
//  MessageCellTableViewCell.swift
//  FlashChat
//
//  Created by Andrey on 24.05.2023.
//

import UIKit

class MessageCell: UITableViewCell {

    static let identifier = "MessageCell"
    
    private lazy var messageHStackView: UIStackView = {
        let element = UIStackView()
        element.axis = .horizontal
        element.spacing = 20
        element.distribution = .fill
        element.alignment = .center
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    lazy var messageView: UIView = {
        let element = UIView()
        element.backgroundColor = Resources.Colors.purple
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    lazy var messageLabel: UILabel = {
        let element = UILabel()
        element.text = "LabelLabelLabelLabelLabelLabelLabelLabelLabel"
        element.numberOfLines = 0
        element.font = UIFont.systemFont(ofSize: 17)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    lazy var avatarMeImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.image = Resources.Avatars.me
        image.layer.cornerRadius = 12
        image.layer.masksToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var avatarYouImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.image = Resources.Avatars.you
        image.layer.cornerRadius = 12
        image.layer.masksToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.addSubview(messageHStackView)
        messageHStackView.addArrangedSubview(avatarYouImageView)
        messageHStackView.addArrangedSubview(messageView)
        messageHStackView.addArrangedSubview(avatarMeImageView)
        messageView.addSubview(messageLabel)
        
        NSLayoutConstraint.activate([
            messageHStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            messageHStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            messageHStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            messageHStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            messageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            messageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
            messageLabel.centerYAnchor.constraint(equalTo: messageView.centerYAnchor),
            messageLabel.leadingAnchor.constraint(equalTo: messageView.leadingAnchor, constant: 20),
            messageLabel.trailingAnchor.constraint(equalTo: messageView.trailingAnchor, constant: -20),
            messageLabel.bottomAnchor.constraint(equalTo: messageView.bottomAnchor, constant: -8),
            
            avatarMeImageView.heightAnchor.constraint(equalToConstant: 40),
            avatarMeImageView.widthAnchor.constraint(equalToConstant: 40),
            
            avatarYouImageView.heightAnchor.constraint(equalToConstant: 40),
            avatarYouImageView.widthAnchor.constraint(equalToConstant: 40),
        ])

    }

}
