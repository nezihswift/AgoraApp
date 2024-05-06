//
//  ChannelViewController + AgoreVideoViewerDelegate.swift
//  AgoraApp
//
//  Created by Nezih on 5.05.2024.
//

import Foundation
import AgoraUIKit
import AgoraRtcKit
import AgoraRtmKit
import AgoraRtmControl

extension ChannelViewController: AgoraVideoViewerDelegate {
    func joinedChannel(channel: String) {
        printWithSpace(string: "Joined channel: \(channel)")
    }
    
    func leftChannel(_ channel: String) {
        printWithSpace(string: "Left channel: \(channel)")
    }
    
    func tokenWillExpire(_ engine: AgoraRtcEngineKit, tokenPrivilegeWillExpire token: String) {
        printWithSpace(string: "Token will expire")
    }
    
    func tokenDidExpire(_ engine: AgoraRtcEngineKit) {
        printWithSpace(string: "Token did expire")
    }
    
    func presentAlert(alert: UIAlertController, animated: Bool, viewer: UIView?) {}
    
    func incomingPongRequest(from peerId: String) {
        printWithSpace(string: "Incoming pong request\nPeer ID: \(peerId)")
    }
    
    func rtmStateChanged(from oldState: AgoraRtmControl.AgoraRtmController.RTMStatus, to newState: AgoraRtmControl.AgoraRtmController.RTMStatus) {
        printWithSpace(string: "RTM state changed\nOld state: \(oldState)\nNew State: \(newState)")
    }
    
    func rtmChannelJoined(name: String, channel: AgoraRtmChannel, code: AgoraRtmJoinChannelErrorCode) {
        printWithSpace(string: "RTM channel joined \(name)")
    }
}
