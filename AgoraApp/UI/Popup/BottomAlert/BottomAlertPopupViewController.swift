//
//  BottomAlertPopupViewController.swift
//  AgoraApp
//
//  Created by Nezih on 4.05.2024.
//

import Foundation
import UIKit
import PanModal
import Lottie

class BottomAlertPopupViewController: BaseViewController, PanModalPresentable {
    
    private let message: String
    private let type: BottomPopupCase
    private let target: Any?
    private let action: Selector?
    
    var panScrollable: UIScrollView?
    
    private var animationLottie : LottieAnimationView
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = 2
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let label : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = AppFont.bold(size: 16)
        label.textColor = .TitleColor()
        return label
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DispatchQueue.main.async { [weak self] in
            self?.animationLottie.play()
        }
    }
    
    init(message: String, type: BottomPopupCase, target: Any? = nil, action: Selector? = nil) {
        self.message = message
        self.type = type
        self.target = target
        self.action = action
        
        let animation = LottieAnimationView(name: type.string)
        animation.loopMode = .playOnce
        animation.translatesAutoresizingMaskIntoConstraints = false
        self.animationLottie = animation
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        setTapGesture()
    }
    
    private func setView() {
        label.text = message
        
        NSLayoutConstraint.activate([
            animationLottie.widthAnchor.constraint(equalToConstant: 100),
            animationLottie.heightAnchor.constraint(equalToConstant: 100)
        ])
        stackView.addArrangedSubview(animationLottie)
        stackView.addArrangedSubview(label)
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -26),
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 16)
        ])
    }
    
    private func setTapGesture() {
        /// If there isn't any selector and target added on vc we dismiss on click
        if let target,
           let action {
            let tapGesture = UITapGestureRecognizer(target: target, action: action)
            tapGesture.cancelsTouchesInView = false
            view.addGestureRecognizer(tapGesture)
        } else {
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
            tapGesture.cancelsTouchesInView = false
            view.addGestureRecognizer(tapGesture)
        }
    }
    
    @objc private func handleTap(_ sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            dismiss(animated: true, completion: nil)
        }
    }
    
    var shortFormHeight: PanModalHeight {
        return .intrinsicHeight
    }

    var longFormHeight: PanModalHeight {
        return .intrinsicHeight
    }
}

enum BottomPopupCase {
    case successful
    case failed
    case warning
    
    var string: String {
        switch self {
        case .successful:
            return "successful"
        case .failed:
            return "failed"
        case .warning:
            return "warning"
        }
    }
}
