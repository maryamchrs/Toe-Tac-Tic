//
//  PlayerPersonalSetupView.swift
//  ReverseTicTacToe
//
//  Created by Maryam Chrs on 12/11/2023.
//

import SwiftUI

struct PlayerPersonalSetupView: View {
    
    // MARK: - Properties and Constants
    @EnvironmentObject var coordinator: Coordinator
    @ObservedObject var viewModel: PlayerPersonalSetupViewModel
    
    // MARK: - Body
    var body: some View {
        ZStack {
            PlaygroundBackground()
            VStack {
                PlayerPersonalSetupMainPartView(viewModel: viewModel)
                Spacer()
            }
            .padding(.top, Constants.topSpacing)
            .padding(.horizontal, 32)
            
        }
        .onReceive(viewModel.startButtonPublisher, 
                   perform: { _ in
            let playerModelInfo = PlayerInfoModel(name: viewModel.playerName,
                                                  selectedOption: viewModel.selectedOption ?? .xPiece)
            coordinator.routeToPlayground(info: playerModelInfo)
        })
        .toolbar(.hidden, for: .navigationBar)
    }
}

// MARK: - Preview
#Preview {
    PlayerPersonalSetupView(viewModel: PlayerPersonalSetupViewModel(storageManager: UserDefaultsBasedStorageManager()))
}
