//
//  LetterOptionButton.swift
//  ReverseTicTacToe
//
//  Created by Maryam Chrs.
//

import SwiftUI

struct LetterOptionButton: View {
    
    // MARK: - Properties and Constants
    var text: GamePiece
    var isChosen: Bool
    var completionHandler: ((GamePiece) -> Void)?
    
    // MARK: - Body
    var body: some View {
        
        Group {
            Button(action: {
                completionHandler?(text)
            }, label: {
                ZStack  {
                    Text(text.rawValue)
                        .font(
                            Font.custom("SF Pro Display", 
                                        size: 20)
                                .weight(.bold)
                        )
                        .foregroundColor(.white)
                        .padding(.horizontal, 4)
                        .padding(.vertical, 0)
                        .frame(width: 32,
                               height: 32,
                               alignment: .center)
                        .background(getCorrectColor())
                        .cornerRadius(4)
                        .overlay(
                            RoundedRectangle(cornerRadius: 4)
                                .inset(by: 0.5)
                                .stroke(isChosen ? .black : .black.opacity(0.3), lineWidth: 1)
                            
                        )
                }
            })
        }
    }
}

// MARK: - Private Methods
private extension LetterOptionButton {
    func getCorrectColor() -> Color {
        !isChosen ? text.relatedColor.opacity(0.2) : text.relatedColor
    }
}

// MARK: - Preview
#Preview {
    LetterOptionButton(text: .xPiece, isChosen: false)
}
