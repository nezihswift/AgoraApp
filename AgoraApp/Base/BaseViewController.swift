//
//  BaseViewController.swift
//  AgoraApp
//
//  Created by Nezih on 2.05.2024.
//

import Foundation
import UIKit

class BaseViewController : UIViewController {
    
    // Navigation Items
    var navigationLeftStack : UIStackView = {
        var stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 10
        stackView.alignment = .center
        stackView.axis = .horizontal
        return stackView
    }()
    
    var navigationRightStack : UIStackView = {
        var stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 10
        stackView.alignment = .center
        stackView.axis = .horizontal
        return stackView
    }()
    
    fileprivate var rightWidthValue : CGFloat = 0.0
    fileprivate var leftWidthValue: CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.interactivePopGestureRecognizer?.delegate = self
        view.backgroundColor = .BackgroundColor()
    }
    
    func setTitle(text: String) {
        let label = UILabel()
        label.font = AppFont.bold(size: 20)
        label.textColor = .TitleColor()
        label.text = text
        label.sizeToFit()
        navigationLeftStack.arrangedSubviews.forEach { view in
            view.removeFromSuperview()
        }
        if canGoBack() {
            addBackButton()
        }
        navigationLeftStack.addArrangedSubview(label)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: navigationLeftStack)
    }
    
    func addButton(to: NavigationBarButtonCaseEnum, selector: Selector?, icon: UIImage, target: Any) {
        let button = UIButton(frame: .init(x: 0, y: 0, width: 30, height: 44))
        button.widthAnchor.constraint(equalToConstant: 30).isActive = true
        button.backgroundColor = .clear
        button.setImage(icon, for: .normal)
        if let selector {
            button.addTarget(self, action: selector, for: .touchUpInside)
        }
        
        switch to {
        case .left:
            navigationLeftStack.insertArrangedSubview(button, at: 0)
            let itemCount : CGFloat = CGFloat(navigationLeftStack.arrangedSubviews.count)
            if itemCount > 0 {
                leftWidthValue += 40
            } else {
                leftWidthValue += 30
            }
            navigationItem.leftBarButtonItem = UIBarButtonItem(customView: navigationLeftStack)
            self.navigationItem.leftBarButtonItem?.customView?.layoutIfNeeded()
        case .right:
            navigationRightStack.addArrangedSubview(button)
            let itemCount : CGFloat = CGFloat(navigationRightStack.arrangedSubviews.count)
            if itemCount > 0 {
                rightWidthValue += 40
            } else {
                rightWidthValue += 30
            }
            navigationItem.rightBarButtonItem = UIBarButtonItem(customView: navigationRightStack)
            self.navigationItem.rightBarButtonItem?.customView?.layoutIfNeeded()
        }
    }
    
    func showPopup(case popupCase: BottomPopupCase, message: String, target: Any? = nil, action: Selector? = nil) {
        let vc = BottomAlertPopupViewController(message: message,
                                                type: popupCase,
                                                target: target,
                                                action: action)
        presentPanModal(vc)
    }
    
    fileprivate func canGoBack() -> Bool {
        if let navigationController = self.navigationController,
            navigationController.viewControllers.count > 1 {
            // There is at least one view controller before the current one
            return true
        }
        return false
    }
    
    func addBackButton() {
        if let image = UIImage(systemName: "chevron.backward")?.withTintColor(.TitleColor(), renderingMode: .alwaysOriginal) {
            addButton(to: .left, selector: #selector(backButtonClicked), icon: image, target: self)
        }
    }
    
    @objc func backButtonClicked() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func printWithSpace(string: String) {
        print("\n\n\(string)\n\n")
    }
}

extension BaseViewController: UIGestureRecognizerDelegate {
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        // Allow simultaneous recognition of the back gesture
        return true
    }
}

enum NavigationBarButtonCaseEnum {
    case left
    case right
}
