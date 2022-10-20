//
//  MovingWaveBackground.swift
//  FancyAnimations
//
//  Created by Jonas Gamburg on 20.10.22.
//

import SwiftUI

struct MovingWaveBackground: View {
    
    @State private var firstWavePhase:  Angle = .init(degrees: 0)
    @State private var secondWavePhase: Angle = .init(degrees: 170)
    
    
    private let timer = Timer.publish(every: 0.003, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                ZStack {
                    Wave(waveHeight: 25, phase: firstWavePhase)
                        .opacity(0.5)
                        .foregroundColor(.blue)
                        .ignoresSafeArea()
                    
                    Wave(waveHeight: 25, phase: secondWavePhase)
                        .opacity(0.5)
                        .foregroundColor(.green)
                        .ignoresSafeArea()
                }
                .frame(height: UIScreen.main.bounds.height / 1.8)
            }
        }
        .onReceive(timer) { _ in
            firstWavePhase.degrees  += 0.1
            secondWavePhase.degrees -= 0.1
        }
    }
}

struct MovingWaveBackground_Previews: PreviewProvider {
    static var previews: some View {
        MovingWaveBackground()
    }
}
