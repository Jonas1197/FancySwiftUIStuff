//
//  IsometricViewModifier.swift
//  FancyAnimations
//
//  Created by Jonas Gamburg on 20.10.22.
//

import SwiftUI

struct IsometricViewModifier: ViewModifier {
    
    let active: Bool
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(.init(degrees: active ? 45 : 0), anchor: .center)
            .scaleEffect(x: 1.0, y: active ? 0.5 : 1.0, anchor: .center)
    }
}
