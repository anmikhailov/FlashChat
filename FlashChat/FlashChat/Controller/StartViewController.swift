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

extension StartViewController: StartViewDelegate {
    func StartView(_ view: StartView, didTapButton button: UIButton) {
    }
}
