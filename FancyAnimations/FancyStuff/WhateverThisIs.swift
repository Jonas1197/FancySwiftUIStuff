//
//  WhateverThisIs.swift
//  FancyAnimations
//
//  Created by Jonas Gamburg on 20.10.22.
//

import SwiftUI

struct WhateverThisIs: View {
    
    let angleOffset  = 60.0
    let centralGap   = 45.0
    let deviceWidth  = UIScreen.main.bounds.width
    let deviceHeight = UIScreen.main.bounds.height
    
    
    var body: some View {
        ZStack {
            ForEach(0 ..< 7) {
                Image(systemName: "circle.hexagongrid.fill")
                    .renderingMode(.original)
                    .resizable()
                    .frame(width: deviceWidth, height: deviceHeight)
                    .offset(y: centralGap * 4)
                    .rotationEffect(.degrees(Double($0) * angleOffset))
                    .opacity(0.5)
                    .blendMode(.hardLight)
            }
        }
    }
}

struct WhateverThisIs_Previews: PreviewProvider {
    static var previews: some View {
        WhateverThisIs()
            .preferredColorScheme(.dark)
    }
}
