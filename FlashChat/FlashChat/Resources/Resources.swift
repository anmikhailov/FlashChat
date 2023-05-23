//
//  Resources.swift
//  FlashChat
//
//  Created by Andrey on 22.05.2023.
//

import Foundation
import UIKit

enum Resources {
    enum Colors {
        static var purple = UIColor(named: "BrandPurple")
        static var lightPurple = UIColor(named: "BrandLightPurple")
        static var blue = UIColor(named: "BrandBlue")
        static var lightBlue = UIColor(named: "BrandLightBlue")
    }
    
    enum Avatars {
        static var me = UIImage(named: "MeAvatar")
        static var you = UIImage(named: "YouAvatar")
    }
    
    enum Images {
        static var textFieldBg = UIImage(named: "textfield")
        static var sendMessageIcon = UIImage(systemName: "paperplane.fill")
    }
}
