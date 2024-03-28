//
//  GameDescriptionView.swift
//  ReverseTicTacToe
//
//  Created by Maryam Chrs on 24/10/2023.
//

import SwiftUI
import Combine

struct GameDescriptionView<ViewModel: GameDescriptionViewModel>: View {
    
    // MARK: - Properties and Constants
    @EnvironmentObject var coordinator: Coordinator
    @ObservedObject var viewModel: GameDescriptionViewModel
    
    // MARK: - Body
    var body: some View {
        ZStack {
            PlaygroundBackground()
            VStack {
                GameDescriptionMainPartView(subject: viewModel.continueFlowSubject)
                Spacer()
            }
            .padding(.top, Constants.topSpacing)
        }
        .onReceive(viewModel.continueFlowSubject) { _ in
            coordinator.routeToPlayerPersonalSetupView()
        }
        .toolbar(.hidden, for: .navigationBar)
    }
}

// MARK: - Private methods
private extension GameDescriptionView {}

// MARK: - PreviewProvider
struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        GameDescriptionView(viewModel: GameDescriptionViewModel(storageManager: UserDefaultsBasedStorageManager()))
    }
}
