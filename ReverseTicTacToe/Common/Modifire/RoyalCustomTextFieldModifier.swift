//
//  RoyalCustomTextField.swift
//  ReverseTicTacToe
//
//  Created by Maryam Chrs on 26/10/2023.
//

import SwiftUI

struct RoyalCustomTextFieldModifier: ViewModifier {
    var foregroundColor: Color
    
    func body(content: Content) -> some View {
        ZStack {
            content
                .autocorrectionDisabled()
                .foregroundColor(foregroundColor)
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 10.0)
                    .strokeBorder(Color.royalBlue,
                                  style: StrokeStyle(lineWidth: 1.0)))
        }
    }
}

extension View {
    func royalCustomTextFieldModifier(foregroundColor: Color = .royalBlue) -> some View {
        modifier(RoyalCustomTextFieldModifier(foregroundColor: foregroundColor))
    }
}
