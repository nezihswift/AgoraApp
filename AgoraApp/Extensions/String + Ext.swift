//
//  String + Ext.swift
//  AgoraApp
//
//  Created by Nezih on 4.05.2024.
//

import Foundation

extension String {
    
    func hasLetterAndNumber() -> Bool {
        let letterCharacterSet = CharacterSet.letters
        let numberCharacterSet = CharacterSet.decimalDigits
        let hasLetter = rangeOfCharacter(from: letterCharacterSet) != nil
        let hasNumber = rangeOfCharacter(from: numberCharacterSet) != nil
        return hasLetter && hasNumber
    }
}
