//
//  ContentView.swift
//  FancyAnimations
//
//  Created by Jonas Gamburg on 20.10.22.
//

import SwiftUI

struct ContentView: View {
    
    @State var dropdownSelection: Int = 0
    
    var body: some View {
        
        //MARK: Fancy flower thing
//        WhateverThisIs()
        
        
        //MARK: Menu Button
        /*The haburger button turns into an X and back on tap.*/
//        FancyMenuEffect()
        
        
        //MARK: Rotating 3D cube
        /*This can be used on objects as well as a transition between views.*/
//        CubeThing()
        
        
        //MARK: Fancy wave background
//        MovingWaveBackground()
        
        
        //MARK: Extrued and isometric view
        /*This can be really nice and fancy when used in the right context.*/
        IsometricView(active: true, extruded: true, depth:20) {
            Image("Icon")
                .resizable()
        }
        .frame(width: 200, height: 200)
        
        
        
        //MARK: Dropdown menu with options
//        DropdownPicker(stateModel: .init(model: .example), selection: $dropdownSelection)
        
        
        //MARK: Text w/ hastags
        /*You throw in a text and every word with hastags will be marked.*/
//        TextWithHashtags("Hello #world2022", color: .blue)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
