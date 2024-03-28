//
//  Constants.swift
//  ReverseTicTacToe
//
//  Created by Maryam Chrs on 25/11/2023.
//

import Foundation

enum Constants {
    
    static let topSpacing: CGFloat = 64
    
    static let delayOfThinkingInNanoseconds: UInt64 = 1_000_000_000
    
    static let winingStates = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8],
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8],
        [0, 4, 8],
        [2, 4, 6]
    ]
    
}
