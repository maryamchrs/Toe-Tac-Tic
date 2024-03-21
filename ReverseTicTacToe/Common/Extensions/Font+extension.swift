//
//  Font+extension.swift
//  ReverseTicTacToe
//
//  Created by Maryam Chrs on 24/10/2023.
//

import SwiftUI

extension Font {
    static func sfPro(ofSize size: CGFloat) -> Font {
        return Font.custom("SF Pro Display", size: size)
    }
    
    static func sfPro(ofSize size: CGFloat, weight: Font.Weight) -> Font {
        Font.system(size: size, weight: weight)
    }
}
