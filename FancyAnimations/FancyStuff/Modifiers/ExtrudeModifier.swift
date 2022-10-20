//
//  ExtrudeModifier.swift
//  FancyAnimations
//
//  Created by Jonas Gamburg on 20.10.22.
//

import SwiftUI

struct ExtrudeModifier<Texture: View> : ViewModifier {
    
    var depth: CGFloat
    var texture: Texture
    
    func body(content: Content) -> some View {
        content
            // Front Left Side
            .overlay(
                GeometryReader { reader in
                    texture
                        .brightness(-0.05)
                        .scaleEffect(x: 1, y: reader.size.height * reader.size.height, anchor: .bottom)
                        .frame(height: depth, alignment: .top) // Step 4
                        .mask(Rectangle())
                        .rotation3DEffect(
                            Angle(degrees: 180),
                            axis: (x: 1.0, y: 0.0, z: 0.0),
                            anchor: .center,
                            anchorZ: 0.0,
                            perspective: 1.0
                        )
                        .projectionEffect(ProjectionTransform(CGAffineTransform(a: 1, b: 0, c: 1, d: 1, tx: 0, ty: 0)))
                        .offset(x: 0, y: reader.size.height)
                    
                }
                , alignment: .center)
        
            // Front Right Side
            .overlay(
                GeometryReader { geo in
                    texture
                        .brightness(-0.1)
                        .scaleEffect(x: geo.size.width * geo.size.width, y: 1.0, anchor: .trailing)
                        .frame(width: depth, alignment: .leading)
                        .clipped()
                        .rotation3DEffect(
                            Angle(degrees: 180),
                            axis: (x: 0.0, y: 1.0, z: 0.0),
                            anchor: .leading,
                            anchorZ: 0.0,
                            perspective: 1.0
                        )
                        .projectionEffect(ProjectionTransform(CGAffineTransform(a: 1, b: 1, c: 0, d: 1, tx: 0, ty: 0)))
                        .offset(x: geo.size.width + depth, y: 0 + depth)
                }
                , alignment: .center)
        
    }
}
