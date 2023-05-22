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
    // Add private lazy variables here
    
    //MARK: - setViews
    override func setViews() {
        super.setViews()
        
        backgroundColor = .systemBackground
        
        // Add subviews here
    }
    
    //MARK: - layoutViews
    override func layoutViews() {
        super.layoutViews()
        
        // Add constraints here
    }
}

//MARK: - Target Actions
private extension StartView {
    @objc func didTapButton(_ button: UIButton) {
        delegate?.StartView(self, didTapButton: button)
    }
}
