//
//  AuthViewController.swift
//  FlashChat
//
//  Created by Andrey on 22.05.2023.
//

import UIKit

enum AuthorizationType: Int {
    case registration
    case logIn
}

class AuthViewController: CustomViewController<AuthView> {
    
    init(type: AuthorizationType) {
        super.init(nibName: nil, bundle: nil)
        customView.configureView(type: type)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customView.delegate = self
    }

}

//MARK: - AuthViewDelegate
extension AuthViewController: AuthViewDelegate {
    func AuthView(_ view: AuthView, didTapRegistrationButton button: UIButton) {
        let email = customView.emailText
        let password = customView.passwordText
        
        FirebaseManager.shared.registration(withEmail: email, password: password) { [weak self] err in
            if err == nil {
                let chatVC = ChatViewController()
                self?.navigationController?.pushViewController(chatVC, animated: true)
            } else {
                print(err?.localizedDescription)
            }
        }
    }
    
    func AuthView(_ view: AuthView, didTapLogInButton button: UIButton) {
        let email = customView.emailText
        let password = customView.passwordText
        
        FirebaseManager.shared.logIn(withEmail: email, password: password) { [weak self] err in
            if err == nil {
                let chatVC = ChatViewController()
                self?.navigationController?.pushViewController(chatVC, animated: true)
            } else {
                print(err?.localizedDescription)
            }
        }
    }
}
