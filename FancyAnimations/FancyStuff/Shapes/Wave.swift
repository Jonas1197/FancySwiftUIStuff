//
//  Wave.swift
//  FancyAnimations
//
//  Created by Jonas Gamburg on 20.10.22.
//

import SwiftUI


struct Wave: Shape {
    var waveHeight: CGFloat
    var phase:      Angle
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: .init(x: 0, y: rect.maxY))
        
        for x in stride(from: 0, through: rect.width, by: 1) {
            let relativeX: CGFloat = x / 50 // Wave length
            let sine:      CGFloat = sin(relativeX + CGFloat(phase.radians))
            let y = waveHeight * sine // + rect.midY ??
            path.addLine(to: .init(x: x, y: y))
        }
        
        path.addLine(to: .init(x: rect.maxX, y: rect.midY))
        path.addLine(to: .init(x: rect.maxX, y: rect.maxY))
        
        return path
    }
}
