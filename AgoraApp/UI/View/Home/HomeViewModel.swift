//
//  HomeViewModel.swift
//  AgoraApp
//
//  Created by Nezih on 4.05.2024.
//

import Foundation
import Combine

class HomeViewModel: BaseViewModel {
    
    private var username: String = ""
    
    @Published private (set) var channels: [Channel] = []
    private var cancellables : Set<AnyCancellable> = []
    
    override init() {
        super.init()
        ChannelRepository.shared.$channels
            .receive(on: RunLoop.main)
            .sink { [weak self] channels in
                guard let self else {
                    return
                }
                self.channels = channels
            }
            .store(in: &cancellables)
    }
    
    func getChannel(at index: Int) -> Channel? {
        guard index < channels.count else {
            return nil
        }
        return channels[index]
    }
    
    func setUsername(username: String) {
        self.username = username
    }
    
    func getUsername() -> String { username }
}
