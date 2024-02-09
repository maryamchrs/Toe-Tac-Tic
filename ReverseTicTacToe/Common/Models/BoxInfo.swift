//
//  BoxInfo.swift
//  ReverseTicTacToe
//
//  Created by Maryam Chrs on 14/01/2024.
//

import Foundation

/// Represents the informaton for each box in the game.
struct BoxInfo {
    var id: Int
    var status: GamePiece?
}

/// Establish the initial game state.
extension BoxInfo {
    static var initialStates: [BoxInfo] = (0..<9).map { BoxInfo(id: $0, status: nil) }
}
