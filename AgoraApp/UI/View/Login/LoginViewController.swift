//
//  LoginViewController.swift
//  AgoraApp
//
//  Created by Nezih on 2.05.2024.
//

import Foundation
import UIKit

class LoginViewController: BaseViewController {
    
    @IBOutlet private weak var textField: UITextField!
    
    @IBAction private func loginButtonAction() {
        
        guard let username = textField.text,
              username.count > 5 else {
            showPopup(case: .warning, message: "Kullanıcı adı minimum 6 karakter içermeli")
            return
        }
        
        guard username.hasLetterAndNumber() else {
            showPopup(case: .warning, message: "Kullanıcı adı en az bir karakter ve rakam içermeli")
            return
        }
        
        UsernameManager.shared.saveUsername(username)
        NavigationManager.shared.openHome(username: username)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTitle(text: "Giriş Yap")
    }
}
