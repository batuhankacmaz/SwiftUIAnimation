//
//  String-Extension.swift
//  SwiftUIAnimation
//
//  Created by Batuhan Kacmaz on 13.04.2023.
//

import Foundation

extension String {
    func capitalizedWithSpaces() -> String {
        var result = ""
        var previousCharacterIsUppercase = false
        
        for character in self {
            if character.isUppercase {
                if !previousCharacterIsUppercase {
                    result += " "
                }
                previousCharacterIsUppercase = true
            } else {
                previousCharacterIsUppercase = false
            }
            result.append(character)
        }
        
        let words = result.split(separator: " ")
        return words.map { $0.capitalized }.joined(separator: " ")
    }
}
