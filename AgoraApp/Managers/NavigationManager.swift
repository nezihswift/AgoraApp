//
//  NavigationManager.swift
//  AgoraApp
//
//  Created by Nezih on 2.05.2024.
//

import Foundation
import UIKit

class NavigationManager: NSObject {
    
    static let shared = NavigationManager()
    weak var delegate: NavigationManagerDelegate?
    
    func openLogin() {
        delegate?.openLogin()
    }
    
    func openHome(username: String) {
        delegate?.openHome(username: username)
    }
}

protocol NavigationManagerDelegate: AnyObject {
    func openLogin()
    func openHome(username: String)
}
