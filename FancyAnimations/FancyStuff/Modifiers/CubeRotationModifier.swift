//
//  CubeRotationModifier.swift
//  FancyAnimations
//
//  Created by Jonas Gamburg on 20.10.22.
//

import SwiftUI

struct CubeRotationModifier: AnimatableModifier {
    
    enum SlideDirection {
        case enter
        case exist
    }
    
    var pct:       Double
    var direction: SlideDirection
    
    var animatableData: Double {
        get { pct }
        set { pct = newValue }
    }
    
    func body(content: Content) -> some View {
        GeometryReader { reader in
            content
                .rotation3DEffect(
                    Angle(degrees: calcRotation()),
                    axis: (x: 0, y: 1, z: 0),
                    anchor: direction == .enter ? .leading : .trailing,
                    anchorZ: 0,
                    perspective: 1
                ).transformEffect(.init(translationX: calcTranslation(geometryReader: reader), y: 0))
        }
    }
    
    func calcRotation() -> Double {
        if direction == .enter {
            return 89.9 - (pct * 89.9)
        } else {
            return -1 * (pct * 89.9)
        }
    }
    
    func calcTranslation(geometryReader reader: GeometryProxy) -> CGFloat {
        if direction == .enter {
            return reader.size.width - (CGFloat(pct) * reader.size.width)
        } else {
            return -1.0 * (CGFloat(pct) * reader.size.width)
        }
    }
}

//MARK: - AnyTransition
extension AnyTransition {
    static var cubeRotation: AnyTransition {
        get {
            AnyTransition.asymmetric(insertion: .modifier(active: CubeRotationModifier(pct: 0, direction: .enter),
                                                          identity: CubeRotationModifier(pct: 1, direction: .enter)),
                                     removal: .modifier(active: CubeRotationModifier(pct: 1, direction: .exist),
                                                        identity: CubeRotationModifier(pct: 0, direction: .exist)))
        }
    }
}
