//
//  NoErrorResult.swift
//  AgoraApp
//
//  Created by Nezih on 5.05.2024.
//

import Foundation

enum NoErrorResult<T> {
    case success(T)
    case failure
}
