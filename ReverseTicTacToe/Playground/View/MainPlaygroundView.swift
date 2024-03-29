//
//  MainPlaygroundView.swift
//  ReverseTicTacToe
//
//  Created by Maryam Chrs on 12/11/2023.
//

import SwiftUI

struct MainPlaygroundView<ViewModel: MainPlaygroundViewModelProtocol>: View {
    
    // MARK: - Properties and Constants
    @EnvironmentObject var coordinator: Coordinator
    @ObservedObject var viewModel: ViewModel
    
    // MARK: - Body
    var body: some View {
        ZStack {
            PlaygroundBackground(opacity: 0.1)
            VStack {
                LogoAndTitleView()
                
                Spacer()
                
                messagesText
                
                board
                
                Spacer()
                
                CustomButton(text: "new_game".localized(),
                             imageName: "ForwardArrow",
                             imageSide: .right,
                             completionHandler: {
                    coordinator.routeBack()
                })
            }
            .padding(.top, Constants.topSpacing)
            .padding(.bottom, 16)
        }
        .onAppear {
            viewModel.showStartingMessage()
        }
        .ignoresSafeArea(edges: [.horizontal])
        .toolbar(.hidden, for: .navigationBar)
    }
}

// MARK: - Private Methods and Properties
private extension MainPlaygroundView {
    var board: some View {
        VStack(spacing: 16) {
            ZStack {
                TicTacToeTableView()
                    .frame(width: 304, height: 304)
                BoxesView(viewModel: viewModel)
                    .frame(width: 304, height: 304)
            }
        }
    }
    
    var messagesText: some View {
        VStack(spacing: 0) {
            Group {
                Text(viewModel.titleMessage)
                    .font(.sfPro(ofSize: 24,
                                 weight: .bold))
                    .isHidden(viewModel.titleMessage.isEmpty)
                Text(viewModel.message)
                    .font(.sfPro(ofSize: 16,
                                 weight: .regular))
                    .lineLimit(2)
                    .isHidden(viewModel.message.isEmpty)
            }
            .transition(.opacity)
            .foregroundStyle(getTheRightColorForTextMessage())
            .multilineTextAlignment(.center)
        }
        .frame(height: 48)
    }
    
    func getTheRightColorForTextMessage() -> Color {
        return viewModel.playerSelectedPiece.relatedMessageColor
    }
}

// #Preview {
//    MainPlaygroundView(viewModel: MainPlaygroundViewModel(playerNickName: "", playerSelectedPiece: .oPiece))
// }
