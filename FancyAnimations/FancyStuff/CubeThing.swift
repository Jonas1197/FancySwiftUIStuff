//
//  CubeThing.swift
//  FancyAnimations
//
//  Created by Jonas Gamburg on 20.10.22.
//

import SwiftUI

/**
 Basically a cube transition animation.
 */

struct CubeThing: View {
    
    @State private var index = 0
    @State private var timer = Timer.publish(every: 1.3, on: .main, in: .common).autoconnect()
    
    var colors: [Color] = [.red, .green, .blue, .yellow]
    
    var body: some View {
        ZStack {
            ForEach(colors.indices) { i in
                if index == i {
                    colors[i]
                        .transition(.cubeRotation)
                }
            }
        }
        .frame(width: 200, height: 200, alignment: .center)
        .onReceive(timer) { _ in
            withAnimation(.easeInOut(duration: 1.3)) {
                index = (index + 1) % colors.count
            }
        }
    }
}

struct CubeThing_Previews: PreviewProvider {
    static var previews: some View {
        CubeThing()
    }
}
