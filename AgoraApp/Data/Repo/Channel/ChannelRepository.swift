//
//  ChannelRepository.swift
//  AgoraApp
//
//  Created by Nezih on 5.05.2024.
//

import Foundation

class ChannelRepository {
    
    static let shared = ChannelRepository()
    
    @Published private (set) var channels : [Channel] = []
    
    func addChannel(channel: Channel) {
        channels.insert(channel, at: 0)
    }
}
