//
//  AppFonts.swift
//  AgoraApp
//
//  Created by Nezih on 2.05.2024.
//

import Foundation
import UIKit

class AppFont {
    static func regular(size: CGFloat) -> UIFont {
        UIFont(name: "Sen-Regular", size: size)!
    }
    
    static func medium(size: CGFloat) -> UIFont {
        UIFont(name: "Sen-Medium", size: size)!
    }
    
    static func semiBold(size: CGFloat) -> UIFont {
        UIFont(name: "Sen-Semibold", size: size)!
    }
    
    static func bold(size: CGFloat) -> UIFont {
        UIFont(name: "Sen-Bold", size: size)!
    }
    
    static func extraBold(size: CGFloat) -> UIFont {
        UIFont(name: "Sen-ExtraBold", size: size)!
    }
}
