//
//  Player.swift
//  ReverseTicTacToe
//
//  Created by Maryam Chrs on 01/02/2024.
//

import Foundation

/// Represents the Player.
enum Player {
    case user
    case userOpponent
}

extension Player: CustomStringConvertible {
    var description: String {
        switch self {
        case .user:
            return "user"
        case .userOpponent:
            return "userOpponent"
        }
    }
}

/// Extension to provide additional functionality for the `Player` enum.
extension Player {
    /// Returns the opponent  based on the player
    var oppositePlayer: Player {
        switch self {
        case .user:
            return .userOpponent
        case .userOpponent:
            return .user
        }
    }
}
