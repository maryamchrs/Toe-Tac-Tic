//
//  PlayerPersonalSetupMainPartView.swift
//  ReverseTicTacToe
//
//  Created by Maryam Chrs on 12/11/2023.
//

import SwiftUI

struct PlayerPersonalSetupMainPartView<ViewModel: PlayerPersonalSetupViewModel>: View {
    
    //MARK: - Properties and Constants
    @ObservedObject var viewModel: PlayerPersonalSetupViewModel
    private let lightTertiary: Color = Color.tertiary.opacity(0.3)
    
    //MARK: - Body
    var body: some View {
        VStack(spacing: 16) {
            LogoAndTitleView()
            Spacer()
                .frame(height: 80 - 16)
            Text("player_personal_setup_description".localize)
                .multilineTextAlignment(.leading)
                .font(.sfPro(ofSize: 16))
                .frame(width: 300, alignment: .topLeading)
                .lineSpacing(6)
                .padding(.bottom, 12)
            
            nickNameTextFeild
            
            optionView
                .padding(.bottom, 52)
            
            CustomButton(text: "start_the_game".localize,
                         imageName: "ForwardArrow",
                         imageSide: .right,
                         completionHandler: {
                viewModel.startGameButtonIsTapped()
            })
            .opacity(viewModel.isStartButtonEnable ? 1 : 0.3)
            .disabled(viewModel.isStartButtonEnable ? false : true)
        }
        .foregroundColor(.black)
        .ignoresSafeArea()
    }
}

//MARK: Private
private extension PlayerPersonalSetupMainPartView {
    var optionView: some View {
        HStack(spacing: 12) {
            LetterOptionButton(text: .xPiece, isChosen: viewModel.selectedPiece == .xPiece) { char in
                viewModel.oneOptionIsChosen(type: .xPiece)
            }
            .frame(width: 32)
            Text("OR")
                .font(Font.sfPro(ofSize: 12))
            LetterOptionButton(text: .oPiece, isChosen: viewModel.selectedPiece == .oPiece) { char in
                viewModel.oneOptionIsChosen(type: .oPiece)
            }
            .frame(width: 32)
        }
    }
    
    var nickNameTextFeild: some View {
        TextField("nickname".localize,
                  text: $viewModel.playerName)
            .disableAutocorrection(true)
            .padding(.leading, 16)
            .frame(width: 300, height: 38)
            .tint(lightTertiary)
            .font(.sfPro(ofSize: 16))
            .foregroundColor(.black)
            .background(Color.lightSecondary)
            .cornerRadius(8)
            .padding(.bottom, 12)
    }
}

//MARK: - Preview
#Preview {
    PlayerPersonalSetupMainPartView(viewModel: PlayerPersonalSetupViewModel(storageManager: StorageManager()))
}
