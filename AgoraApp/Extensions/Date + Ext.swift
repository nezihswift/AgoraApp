//
//  Date + Ext.swift
//  AgoraApp
//
//  Created by Nezih on 5.05.2024.
//

import Foundation

extension Date {
    private func getTimeString(for value: Int, unit: String) -> String {
        return "\(value) \(unit) önce"
    }

    func getTimeDifferenceString() -> String {
        let now = Date()
        let diffInSeconds = Int(now.timeIntervalSince(self))

        if diffInSeconds < 60 {
            return getTimeString(for: diffInSeconds, unit: "saniye")
        }

        let diffInMinutes = diffInSeconds / 60
        if diffInMinutes < 60 {
            return getTimeString(for: diffInMinutes, unit: "dakika")
        }

        let diffInHours = diffInMinutes / 60
        if diffInHours < 24 {
            return getTimeString(for: diffInHours, unit: "saat")
        }

        let diffInDays = diffInHours / 24
        if diffInDays < 30 {
            return getTimeString(for: diffInDays, unit: "gün")
        }

        let diffInMonths = diffInDays / 30
        if diffInMonths < 12 {
            return getTimeString(for: diffInMonths, unit: "ay")
        }

        let diffInYears = diffInMonths / 12
        return getTimeString(for: diffInYears, unit: "yıl")
    }
}
