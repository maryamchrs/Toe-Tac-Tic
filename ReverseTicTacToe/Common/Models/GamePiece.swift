//
//  BoxStatus.swift
//  ReverseTicTacToe
//
//  Created by Maryam Chrs on 11/11/2023.
//

import SwiftUI

/// Represents the possible game pieces.
enum GamePiece: String, Hashable {
    case xPiece = "X"
    case oPiece = "O"
}

/// Extension to provide additional functionality for the `GamePiece` enum.
extension GamePiece {
     /// Returns the opponent's choice based on the current game piece.
    var opponentChoice: GamePiece {
        self == .xPiece ? .oPiece : .xPiece
    }
}

// MARK: - Color
extension GamePiece {
    /// Returns the color based on the Piece
    var relatedColor: Color {
        switch self {
        case .xPiece:
            return Color.lightFantasyGreen
        case .oPiece:
            return Color.defaultPurple
        }
    }
    
    /// Returns the color for showing messages based on the Piece
    var relatedMessageColor: Color {
        switch self {
        case .xPiece:
            return Color.darkFansyGreen
        case .oPiece:
            return Color.defaultPurple
        }
    }
}
