//
//  HomeTableCell.swift
//  AgoraApp
//
//  Created by Nezih on 5.05.2024.
//

import Foundation
import UIKit

class HomeTableCell: UITableViewCell {
    
    @IBOutlet private weak var channelLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    
    func configure(with channel: Channel) {
        channelLabel.text = channel.channelName
        dateLabel.text = channel.date.getTimeDifferenceString()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        channelLabel.text = ""
        dateLabel.text = ""
    }
}
