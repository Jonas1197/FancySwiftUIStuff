//
//  FancyMenuEffect.swift
//  FancyAnimations
//
//  Created by Jonas Gamburg on 20.10.22.
//

import SwiftUI

struct FancyMenuEffect: View {
    
    @State private var isRotating = false
    @State private var isHidden   = false
    @State private var NSFW       = false
    
    var body: some View {
        VStack(spacing: 14) {
            Rectangle()
                .frame(width: 64, height: 10)
                .cornerRadius(4)
                .rotationEffect(.degrees(isRotating ? 48 : 0), anchor: NSFW ? .trailing : .leading)
            
            Rectangle()
                .frame(width: 64, height: 10)
                .cornerRadius(4)
                .scaleEffect((isHidden && !NSFW) ? 0 : 1, anchor: (isHidden && !NSFW) ? .trailing : .leading)
                .opacity((isHidden && !NSFW) ? 0 : 1)
            
            Rectangle()
                .frame(width: 64, height: 10)
                .cornerRadius(4)
                .rotationEffect(.degrees((isRotating && !NSFW) ? -48 : 0), anchor: .leading)
        }
        .onTapGesture {
            withAnimation(.interpolatingSpring(stiffness: 300, damping: 15)) {
                isRotating.toggle()
                isHidden.toggle()
            }
        }
    }
}

struct FancyMenuEffect_Previews: PreviewProvider {
    static var previews: some View {
        FancyMenuEffect()
    }
}
