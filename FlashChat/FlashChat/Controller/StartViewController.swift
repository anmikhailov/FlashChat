//
//  StartViewController.swift
//  FlashChat
//
//  Created by Andrey on 22.05.2023.
//

import UIKit

class StartViewController: CustomViewController<StartView> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customView.delegate = self
        
        customView.titleLabelText = ""
        var charIndex = 0.0
        let titleText = "⚡️FlashChat"
        for letter in titleText {
            Timer.scheduledTimer(withTimeInterval: 0.1 * charIndex, repeats: false) { (timer) in
                self.customView.titleLabelText.append(letter)
            }
            charIndex += 1
        }
    }
}

//MARK: - StartViewDelegate
extension StartViewController: StartViewDelegate {
    func StartView(_ view: StartView, didTapRegisterButton button: UIButton) {
        let authVC = AuthViewController(type: .registration)
        navigationController?.pushViewController(authVC, animated: true)
    }
    
    func StartView(_ view: StartView, didTapLogInButton button: UIButton) {
        let authVC = AuthViewController(type: .logIn)
        navigationController?.pushViewController(authVC, animated: true)
    }
}
