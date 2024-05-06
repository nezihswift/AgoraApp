//
//  SceneDelegate.swift
//  AgoraApp
//
//  Created by Nezih on 2.05.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        UsernameManager.shared.isUsernameExists { [weak self] result in
            guard let self else {
                return
            }
            
            switch result {
            case .success(let username):
                let storyboard = UIStoryboard(name: "HomeView", bundle: nil)
                let rootController = storyboard.instantiateInitialViewController() as! HomeViewController
                rootController.viewModel.setUsername(username: username)
                let navigation = BaseNavigationController(rootViewController: rootController)
                window = UIWindow(windowScene: windowScene)
                window?.rootViewController = navigation
                window?.makeKeyAndVisible()
            case .failure:
                let storyboard = UIStoryboard(name: "LoginView", bundle: nil)
                let rootController = storyboard.instantiateInitialViewController() as! LoginViewController
                let navigation = BaseNavigationController(rootViewController: rootController)
                window = UIWindow(windowScene: windowScene)
                window?.rootViewController = navigation
                window?.makeKeyAndVisible()
            }
        }
        NavigationManager.shared.delegate = self
    }
    
    private func navigateToViewController(_ viewController: UIViewController) {
        if let navigation = window?.rootViewController as? UINavigationController {
            navigation.setViewControllers([viewController], animated: false)
        }
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
}

extension SceneDelegate: NavigationManagerDelegate {
    func openLogin() {
        let storyboard = UIStoryboard(name: "LoginView", bundle: nil)
        if let loginViewController = storyboard.instantiateViewController(withIdentifier: "LoginView") as? LoginViewController {
            navigateToViewController(loginViewController)
        } else {
            print("Error: Unable to instantiate LoginViewController")
        }
    }
    
    func openHome(username: String) {
        let storyboard = UIStoryboard(name: "HomeView", bundle: nil)
        if let homeViewController = storyboard.instantiateViewController(withIdentifier: "HomeView") as? HomeViewController {
            homeViewController.viewModel.setUsername(username: username)
            navigateToViewController(homeViewController)
        } else {
            print("Error: Unable to instantiate HomeViewController")
        }
    }
}

