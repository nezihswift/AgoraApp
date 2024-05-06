//
//  UIColor + Ext.swift
//  AgoraApp
//
//  Created by Nezih on 2.05.2024.
//

import Foundation
import UIKit

extension UIColor {
    static func BackgroundColor() -> UIColor {
        return UIColor(named: "BackgroundColor") ?? UIColor.white
    }
    
    static func RedColor() -> UIColor {
        return UIColor(named: "RedColor") ?? UIColor.white
    }
        
    static func WhiteColor() -> UIColor {
        return UIColor(named: "WhiteColor") ?? UIColor.white
    }
    
    static func AccentColor() -> UIColor {
        return UIColor(named: "AccentColor") ?? UIColor.white
    }
    
    static func BorderColor() -> UIColor {
        return UIColor(named: "BorderColor") ?? UIColor.white
    }
    
    static func UnselectedColor() -> UIColor {
        return UIColor(named: "UnselectedColor") ?? UIColor.white
    }
    
    static func TitleColor() -> UIColor {
        return UIColor(named: "TitleColor") ?? UIColor.white
    }
}
