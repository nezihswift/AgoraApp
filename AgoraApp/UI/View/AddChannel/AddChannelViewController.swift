//
//  AddChannelViewController.swift
//  AgoraApp
//
//  Created by Nezih on 4.05.2024.
//

import Foundation
import UIKit

class AddChannelViewController: BaseViewController {
    
    @IBOutlet private weak var textField: UITextField!
    
    @IBAction private func addChannelAction() {
        guard let channelName = textField.text,
              channelName != "" else {
            showPopup(case: .warning, message: "Kanal adı boş olamaz")
            return
        }
        
        ChannelRepository.shared.addChannel(channel: .init(channelName: channelName, date: Date()))
        
        let storyboard = UIStoryboard(name: "ChannelView", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "ChannelView") as? ChannelViewController {
            vc.viewModel.setChannelName(name: channelName)
            navigationController?.pushViewController(vc, animated: true)
        } else {
            print("Error: Unable to instantiate ChannelViewController")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTitle(text: "Yeni Bir Kanala Katıl")
    }
}
