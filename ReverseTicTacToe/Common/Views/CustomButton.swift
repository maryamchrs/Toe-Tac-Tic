//
//  CustomButton.swift
//  ReverseTicTacToe
//
//  Created by Maryam Chrs on 24/10/2023.
//

import SwiftUI

enum ImageSidePlace {
    case left
    case right
}

struct CustomButton: View {
    
    var text: String
    var dominanteColor: Color = .middleGreen
    var backgroundColor: Color = .white
    var cornerRadius: CGFloat = 8
    var imageName: String = ""
    var imageSide: ImageSidePlace? = .right
    var width: CGFloat? = 152
    var height: CGFloat? = 36
    var completionHandler: (() -> Void)?
    
    var body: some View {
        Button {
            completionHandler?()
        } label: {
            HStack(alignment: .center, spacing: 8) {
                Spacer()
                if !imageName.isEmpty, let imageSide, imageSide == .left {
                    Image(imageName)
                }
                Text(text)
                    .font(.sfPro(ofSize: 14))
                if !imageName.isEmpty, let imageSide, imageSide == .right {
                    Image(imageName)
                }
                Spacer()
            }
            .padding(.vertical, 8)
            .foregroundStyle(dominanteColor)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(dominanteColor, lineWidth: 1)
            )
            
        }
        .background(backgroundColor)
        .frame(width: width, height: height)
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton(text: "Tap")
    }
}
