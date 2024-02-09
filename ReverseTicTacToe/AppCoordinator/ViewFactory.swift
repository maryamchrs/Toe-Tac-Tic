//
//  ViewFactory.swift
//  ReverseTicTacToe
//
//  Created by Maryam Chrs on 24/10/2023.
//

import SwiftUI

final class ViewFactory {
    
    static let storageManager: StorageManager = StorageManager()
    
    @ViewBuilder
    static func MakeGameDescriptionView() -> some View {
        GameDescriptionView(viewModel: GameDescriptionViewModel(storageManager: ViewFactory.storageManager))
    }
    
    @MainActor @ViewBuilder
    static func createView(_ destination: Destination) -> some View {
        switch destination {
        case .onboarding:
            GameDescriptionView(viewModel: GameDescriptionViewModel(storageManager: ViewFactory.storageManager))
        case .playground(let info):
            MainPlaygroundView(viewModel: MainPlaygroundViewModel(playerNickName: info.name,
                                                                  playerSelectedPiece: info.selectedOption))
        case .personalSetup:
            PlayerPersonalSetupView(viewModel: PlayerPersonalSetupViewModel(storageManager: storageManager))
        }
    }
}
