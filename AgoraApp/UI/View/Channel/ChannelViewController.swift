//
//  ChannelViewController.swift
//  AgoraApp
//
//  Created by Nezih on 5.05.2024.
//

import Foundation
import AgoraUIKit
import AgoraRtcKit

class ChannelViewController: BaseViewController {
    
    let viewModel = ChannelViewModel()
    
    @IBOutlet private weak var videoView: AgoraVideoViewer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTitle(text: viewModel.getChannelName())
        setVideoView()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        videoView.delegate = self
        videoView.exit()
    }
    
    private func setVideoView() {
        
        /// Setting UI Settings
        var agSettings = AgoraSettings()
        agSettings.enabledButtons = [.cameraButton, .micButton, .flipButton]
        agSettings.buttonPosition = .right
        AgoraVideoViewer.printLevel = .verbose
        videoView.style = .pinned
        
        /// Setting Connection Data
        videoView.agConnection = AgoraConnectionData(
            appId: Constants.appId,
            rtcToken: viewModel.getToken()
        )
        
        /// Join Channel
        // Since we don't have any token server we gave our channel name static
        videoView.join(channel: Constants.staticChannelName,
                       as: .broadcaster)
    }
}
