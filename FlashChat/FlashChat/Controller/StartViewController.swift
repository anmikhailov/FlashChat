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
    }
}

//MARK: - StartViewDelegate
extension StartViewController: StartViewDelegate {
    func StartView(_ view: StartView, didTapRegisterButton button: UIButton) {
        print("Register button")
    }
    
    func StartView(_ view: StartView, didTapLogInButton button: UIButton) {
        print("LogIn button")
    }
}
