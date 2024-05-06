//
//  UsernameManager.swift
//  AgoraApp
//
//  Created by Nezih on 5.05.2024.
//

import Foundation

class UsernameManager: NSObject {
    
    static let shared = UsernameManager()
    
    typealias StringNoResult = (NoErrorResult<String>) -> Void
    private let USERNAME_DEFAULTS_KEY = "username"
    
    func saveUsername(_ username: String) {
        UserDefaults.standard.set(username, forKey: USERNAME_DEFAULTS_KEY)
    }

    func deleteUsername() {
        UserDefaults.standard.removeObject(forKey: USERNAME_DEFAULTS_KEY)
    }

    func isUsernameExists(completion: @escaping StringNoResult) {
        if let username = UserDefaults.standard.string(forKey: USERNAME_DEFAULTS_KEY) {
            completion(.success(username))
        } else {
            completion(.failure)
        }
    }
}
