//
//  ChannelViewModel.swift
//  AgoraApp
//
//  Created by Nezih on 5.05.2024.
//

import Foundation

class ChannelViewModel: BaseViewModel {
    
    private let token = "007eJxTYNB/kTAhh/VPz2/z2ot3Z/9JMOU/fGr7/89e+xZZ1PTOX7xZgcHIKMXC2DLFyMgiKcUkydg8KcXQwiDFONnELCk5xczE0KfQPK0hkJFhwfc3TIwMEAjiszMkZyTm5aXmMDAAAK51JA8="
    private var channelName = ""
    
    func setChannelName(name: String) { self.channelName = name }
    func getChannelName() -> String { channelName }
    func getToken() -> String { token }
}
