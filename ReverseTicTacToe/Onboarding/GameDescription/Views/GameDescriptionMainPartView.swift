//
//  GameDescriptionMainPartView.swift
//  ReverseTicTacToe
//
//  Created by Maryam Chrs on 12/11/2023.
//

import SwiftUI
import Combine

struct GameDescriptionMainPartView: View {
    
    // MARK: - Properties and constants
    let subject: PassthroughSubject<Void, Never>
    
    // MARK: - Body
    var body: some View {
        VStack(spacing: 48) {
            LogoAndTitleView()
            Text("onboarding_description".localized())
                .frame(alignment: .topLeading)
                .multilineTextAlignment(.leading)
                .font(.sfPro(ofSize: 16))
                .lineSpacing(6)
                .frame(width: 300)
                .padding(.top, 4)
                .padding(.bottom, 20)
            CustomButton(text: "onboarding_title_button".localized(),
                         imageName: "ForwardArrow",
                         imageSide: .right,
                         completionHandler: {
                subject.send(())
            })
        }
        .ignoresSafeArea()
        .foregroundColor(.black)
    }
} 

// MARK: - PreviewProvider
#Preview {
    GameDescriptionMainPartView(subject: PassthroughSubject<Void, Never>())
}
