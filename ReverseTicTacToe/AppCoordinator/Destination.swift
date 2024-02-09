//
//  Destination.swift
//  ReverseTicTacToe
//
//  Created by Maryam Chrs on 04/01/2024.
//

import Foundation

enum Destination {
    case onboarding
    case playground(PlayerInfoModel)
    case personalSetup
}

extension Destination: Hashable {
    func hash(into hasher: inout Hasher) {
        switch self {
        case .onboarding, .personalSetup:
            break
        case .playground(let info):
            hasher.combine(info.name)
        }
    }
}
