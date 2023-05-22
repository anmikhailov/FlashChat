//
//  StartView.swift
//  FlashChat
//
//  Created by Andrey on 22.05.2023.
//

import UIKit

protocol StartViewDelegate: AnyObject {
    func StartView(_ view: StartView, didTapButton button: UIButton)
}

class StartView: CustomView {
    weak var delegate: StartViewDelegate?
    
    //MARK: - Variables
    private lazy var titleLabel: UILabel = {
        let element = UILabel()
        element.text = "⚡️FlashChat"
        element.font = UIFont.systemFont(ofSize: 50, weight: .black)
        element.textColor = Resources.Colors.blue
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var registerButton: UIButton = {
        let element = UIButton()
        element.backgroundColor = Resources.Colors.lightBlue
        element.setTitle("Register", for: .normal)
        element.setTitleColor(Resources.Colors.blue, for: .normal)
        element.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        element.translatesAutoresizingMaskIntoConstraints = false
//        element.addTarget(self, action: #selector(<#selector#>), for: .touchUpInside)
        return element
    }()
    
    private lazy var logInButton: UIButton = {
        let element = UIButton()
        element.backgroundColor = .systemTeal
        element.setTitle("Log In", for: .normal)
        element.setTitleColor(.white, for: .normal)
        element.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        element.translatesAutoresizingMaskIntoConstraints = false
//        element.addTarget(self, action: #selector(<#selector#>), for: .touchUpInside)
        return element
    }()
    
    //MARK: - setViews
    override func setViews() {
        super.setViews()
        
        backgroundColor = .systemBackground
        
        self.addSubview(titleLabel)
        self.addSubview(registerButton)
        self.addSubview(logInButton)
    }
    
    //MARK: - layoutViews
    override func layoutViews() {
        super.layoutViews()
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 60),
            
            registerButton.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            registerButton.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            registerButton.bottomAnchor.constraint(equalTo: logInButton.topAnchor, constant: -10),
            registerButton.heightAnchor.constraint(equalToConstant: 50),
            
            logInButton.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            logInButton.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            logInButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            logInButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}

//MARK: - Target Actions
private extension StartView {
    @objc func didTapButton(_ button: UIButton) {
        delegate?.StartView(self, didTapButton: button)
    }
}
