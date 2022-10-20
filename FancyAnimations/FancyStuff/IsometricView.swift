//
//  IsometricView.swift
//  FancyAnimations
//
//  Created by Jonas Gamburg on 20.10.22.
//

import SwiftUI

struct IsometricView<Content: View>: View {
    
    var active:   Bool
    var content:  Content
    var extruded: Bool
    var depth:    CGFloat
    
    init(active: Bool, extruded: Bool = false, depth: CGFloat = 20, @ViewBuilder content: ()-> Content) {
        self.active   = active
        self.extruded = extruded
        self.depth    = depth
        self.content  = content()
    }
    
    @ViewBuilder var body: some View {
        if active {
            if extruded {
                content
                    .modifier(ExtrudeModifier(depth: depth, texture: content))
                    .modifier(IsometricViewModifier(active: active))
                    .animation(.easeInOut)
            } else {
                content
                    .modifier(IsometricViewModifier(active: active))
                    .animation(.easeInOut)
            }
        } else {
            content
                .animation(.easeInOut)
        }
        
    }
}
