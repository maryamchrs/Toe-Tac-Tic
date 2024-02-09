//
//  MoodyTextModifier.swift
//  ReverseTicTacToe
//
//  Created by Maryam Chrs on 24/10/2023.
//

import SwiftUI

struct MoodyTextModifier: ViewModifier {
    var fontSize: CGFloat
    
    func body(content: Content) -> some View {
        ZStack {
            content
                .font(.moody(ofSize: fontSize))
                .foregroundColor(.black)
                .opacity(0.6)
        }
    }
}

extension View {
    func moodyTextStyle(fontSize: CGFloat) -> some View {
        modifier(MoodyTextModifier(fontSize: fontSize))
    }
}
