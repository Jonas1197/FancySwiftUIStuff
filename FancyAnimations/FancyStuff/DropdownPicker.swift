//
//  DropdownPicker.swift
//  FancyAnimations
//
//  Created by Jonas Gamburg on 20.10.22.
//

import SwiftUI

struct DropdownModel {
    var title:   String
    var options: [String]
    
    static let example = DropdownModel(title: "Color", options: ["Red", "Green", "Blue"])
}

final class DropdownPickerStateModel: ObservableObject {
    var model: DropdownModel
    
    init(model: DropdownModel) {
        self.model = model
    }
}


struct DropdownPicker: View {
    
    @ObservedObject var stateModel: DropdownPickerStateModel
    @Binding var selection: Int
    @State private var showsOptions = false
    
    var body: some View {
        ZStack {
            HStack {
                Text(stateModel.model.title)
                Spacer()
                Text(stateModel.model.options[selection])
                    .foregroundColor(colorForSelection(index: selection))
                    .foregroundColor(Color.black.opacity(0.6))
                Image(systemName: "chevron.right")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 10, height: 10)
            }
            .font(Font.custom("Avenir Next", size: 16).weight(.medium))
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .background(Color.white)
            .onTapGesture {
                withAnimation(Animation.spring().speed(2)) {
                    showsOptions = true
                }
            }
            
            if showsOptions {
                VStack(alignment: .leading, spacing: 4) {
                    Text(stateModel.model.title)
                        .font(Font.custom("Avenir Next", size: 16).weight(.semibold))
                        .foregroundColor(.white)
                    
                    
                    HStack {
                        Spacer()
                        
                        ForEach(stateModel.model.options.indices, id: \.self) { i in
                            
                            if i == selection {
                                Text(stateModel.model.options[i])
                                    .font(.system(size: 12))
                                    .padding(.vertical, 8)
                                    .padding(.horizontal, 12)
                                    .background(Color.white.opacity(0.2))
                                    .cornerRadius(4)
                                    .onTapGesture {
                                        withAnimation(Animation.spring().speed(2)) {
                                            showsOptions = false
                                        }
                                    }
                                
                            } else {
                                Text(stateModel.model.options[i])
                                    .font(.system(size: 12))
                                    .onTapGesture {
                                        withAnimation(Animation.spring().speed(2)) {
                                            selection = i
                                            showsOptions = false
                                        }
                                    }
                            }
                            
                            Spacer()
                        }
                    }
                    .padding(.vertical, 2)
                    .transition(AnyTransition.move(edge: .top).combined(with: .opacity))
                    
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .background(Color.black)
                .foregroundColor(.white)
                .transition(.opacity)
                
            }
        }
    }
    
    private func colorForSelection(index: Int) -> Color {
        switch stateModel.model.options[index] {
        case "Red":   return .red
        case "Blue":  return .blue
        case "Green": return .green
        default: return .gray
        }
    }
}

struct DropdownPicker_Previews: PreviewProvider {
    static var previews: some View {
        DropdownPicker(stateModel: .init(model: .example), selection: .constant(1))
    }
}
