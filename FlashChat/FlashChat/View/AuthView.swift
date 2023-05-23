//
//  AuthView.swift
//  FlashChat
//
//  Created by Andrey on 22.05.2023.
//

import UIKit

protocol AuthViewDelegate: AnyObject {
    func AuthView(_ view: AuthView, didTapRegistrationButton button: UIButton)
    func AuthView(_ view: AuthView, didTapLogInButton button: UIButton)
}

class AuthView: CustomView {
    weak var delegate: AuthViewDelegate?
    
    //MARK: - Public variables
    var emailText: String {
        return emailTextField.text ?? ""
    }
    
    var passwordText: String {
        return passwordTextField.text ?? ""
    }
    
    //MARK: - Variables
    private lazy var emailView: UIView = {
        let element = UIView()
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var emailTextFieldImageView: UIImageView = {
        let element = UIImageView()
        element.image = Resources.Images.textFieldBg
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var emailTextField: UITextField = {
        let element = UITextField()
        element.placeholder = "Email"
        element.textAlignment = .center
        element.font = UIFont.systemFont(ofSize: 25)
        element.textColor = Resources.Colors.blue
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()

    private lazy var passwordView: UIView = {
        let element = UIView()
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var passwordTextFieldImageView: UIImageView = {
        let element = UIImageView()
        element.image = Resources.Images.textFieldBg
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var passwordTextField: UITextField = {
        let element = UITextField()
        element.placeholder = "Password"
        element.textAlignment = .center
        element.font = UIFont.systemFont(ofSize: 25)
        element.isSecureTextEntry = true
        element.textColor = Resources.Colors.blue
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var authButton: UIButton = {
        let element = UIButton()
        element.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    //MARK: - setViews
    override func setViews() {
        super.setViews()
        
        self.addSubview(emailView)
        emailView.addSubview(emailTextFieldImageView)
        emailView.addSubview(emailTextField)
        
        self.addSubview(passwordView)
        emailView.addSubview(passwordTextFieldImageView)
        emailView.addSubview(passwordTextField)
        
        self.addSubview(authButton)
    }
    
    //MARK: - layoutViews
    override func layoutViews() {
        super.layoutViews()
        
        NSLayoutConstraint.activate([
            emailView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            emailView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            emailView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            emailView.heightAnchor.constraint(equalToConstant: 130),
            
            emailTextFieldImageView.topAnchor.constraint(equalTo: emailView.topAnchor),
            emailTextFieldImageView.bottomAnchor.constraint(equalTo: emailView.bottomAnchor),
            emailTextFieldImageView.leadingAnchor.constraint(equalTo: emailView.leadingAnchor),
            emailTextFieldImageView.trailingAnchor.constraint(equalTo: emailView.trailingAnchor),
            
            emailTextField.topAnchor.constraint(equalTo: emailView.topAnchor, constant: 20),
            emailTextField.bottomAnchor.constraint(equalTo: emailView.bottomAnchor, constant: -55),
            emailTextField.leadingAnchor.constraint(equalTo: emailView.leadingAnchor, constant: 40),
            emailTextField.trailingAnchor.constraint(equalTo: emailView.trailingAnchor, constant: -40),
            
            passwordView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 100),
            passwordView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            passwordView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            passwordView.heightAnchor.constraint(equalToConstant: 130),
            
            passwordTextFieldImageView.topAnchor.constraint(equalTo: passwordView.topAnchor),
            passwordTextFieldImageView.bottomAnchor.constraint(equalTo: passwordView.bottomAnchor),
            passwordTextFieldImageView.leadingAnchor.constraint(equalTo: passwordView.leadingAnchor),
            passwordTextFieldImageView.trailingAnchor.constraint(equalTo: passwordView.trailingAnchor),
            
            passwordTextField.topAnchor.constraint(equalTo: passwordView.topAnchor, constant: 20),
            passwordTextField.bottomAnchor.constraint(equalTo: passwordView.bottomAnchor, constant: -55),
            passwordTextField.leadingAnchor.constraint(equalTo: passwordView.leadingAnchor, constant: 40),
            passwordTextField.trailingAnchor.constraint(equalTo: passwordView.trailingAnchor, constant: -40),
            
            authButton.topAnchor.constraint(equalTo: passwordView.bottomAnchor, constant: -30),
            authButton.heightAnchor.constraint(equalToConstant: 50),
            authButton.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            authButton.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
        ])
    }
    
    func configureView(type: AuthorizationType) {
        switch type {
        case .registration:
            backgroundColor = Resources.Colors.lightBlue
            authButton.setTitle("Registration", for: .normal)
            authButton.setTitleColor(Resources.Colors.blue, for: .normal)
            authButton.addTarget(self, action: #selector(didTapRegistrationButton(_:)), for: .touchUpInside)
        case .logIn:
            backgroundColor = Resources.Colors.blue
            authButton.setTitle("Log In", for: .normal)
            authButton.setTitleColor(.white, for: .normal)
            authButton.addTarget(self, action: #selector(didTapLogInButton(_:)), for: .touchUpInside)
        }
    }
}

//MARK: - Target Actions
private extension AuthView {
    @objc func didTapRegistrationButton(_ button: UIButton) {
        delegate?.AuthView(self, didTapRegistrationButton: button)
    }
    
    @objc func didTapLogInButton(_ button: UIButton) {
        delegate?.AuthView(self, didTapLogInButton: button)
    }
}
