//
//  AppDelegate.swift
//  AgoraApp
//
//  Created by Nezih on 2.05.2024.
//

import UIKit
import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    static let shared = UIApplication.shared.delegate as? AppDelegate

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        setupIQKeyboard()
        return true
    }
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
          let configuration = UISceneConfiguration(name: nil, sessionRole: connectingSceneSession.role)
          if connectingSceneSession.role == .windowApplication {
              configuration.delegateClass = SceneDelegate.self
          }
          return configuration
      }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    private func setupIQKeyboard() {
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.keyboardDistanceFromTextField = 15
        IQKeyboardManager.shared.enableAutoToolbar = true
        IQKeyboardManager.shared.toolbarConfiguration.doneBarButtonConfiguration = .init(title: "Done")
        IQKeyboardManager.shared.toolbarConfiguration.manageBehavior = .bySubviews
        IQKeyboardManager.shared.resignOnTouchOutside = true;
        IQKeyboardManager.shared.toolbarConfiguration.placeholderConfiguration.showPlaceholder = true
        IQKeyboardManager.shared.toolbarConfiguration.previousNextDisplayMode = .alwaysShow
    }
}

