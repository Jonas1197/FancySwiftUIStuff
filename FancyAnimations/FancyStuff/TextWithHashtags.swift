//
//  TextWithHashtags.swift
//  FancyAnimations
//
//  Created by Jonas Gamburg on 20.10.22.
//

import SwiftUI

func TextWithHashtags(_ text: String, color: Color) -> Text {
    let words = text.split(separator: " ")
    var output: Text = Text("")

    for word in words {
        if word.hasPrefix("#") {
            output = output + Text(" ") + Text(String(word))
                .foregroundColor(color)
                .bold()
            
        } else {
            output = output + Text(" ") + Text(String(word))
        }
    }
    return output
}
