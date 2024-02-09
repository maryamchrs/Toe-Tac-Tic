//
//  PlaygroundBackground.swift
//  ReverseTicTacToe
//
//  Created by Maryam Chrs 24/10/2023.
//

import SwiftUI

struct PlaygroundBackground: View {
    
    // MARK: - Properties
    var strokeColor: Color = .lightBackgroundGray
    var strokeWidth: CGFloat = 4
    var secondCellStartPoint: CGFloat = 100
    var opacity: CGFloat = 1
    
    private let topPaddingOfOImage: CGFloat = 600
    
    // MARK: - Body
    var body: some View {
        ZStack {
            xIconView
                .opacity(opacity)
            playgroundBackgroundLines
            oIconView
                .opacity(opacity)
        }
        .ignoresSafeArea()
    }
}

private extension PlaygroundBackground {
    var xIconView: some View {
        VStack(alignment: .leading) {
            HStack {
                Image("HalfX")
                Spacer()
            }
            Spacer()
        }
    }
    
    var oIconView:  some View {
        GeometryReader { geometry in
            Image("HalfO")
                .padding(.top, topPaddingOfOImage)
        }
    }
    
    var playgroundBackgroundLines: some View {
        GeometryReader { reader in
            let maxWidth: CGFloat = 420
            let maxHeight: CGFloat = 892
            let firstRowHeight: CGFloat = 252
            let secondRowHeight: CGFloat = 316 + firstRowHeight
            let thirdRowHeight: CGFloat = maxHeight
            
            Path { path in
                path.move(to: CGPoint(x: secondCellStartPoint, y: 0))
                path.addLine(to: CGPoint(x: secondCellStartPoint, y: 0))
                path.addLine(to: CGPoint(x: secondCellStartPoint, y: firstRowHeight))
                path.addLine(to: CGPoint(x: 0, y: firstRowHeight))
            }
            .stroke(strokeColor, lineWidth: strokeWidth)
            
            Path { path in
                path.move(to: CGPoint(x: secondCellStartPoint, y: 0))
                path.addLine(to: CGPoint(x: secondCellStartPoint, y: 0))
                path.addLine(to: CGPoint(x: secondCellStartPoint, y: firstRowHeight))
                path.addLine(to: CGPoint(x: maxWidth, y: firstRowHeight))
            }
            .stroke(strokeColor, lineWidth: strokeWidth)
            
            Path { path in
                path.move(to: CGPoint(x: secondCellStartPoint, y: firstRowHeight))
                path.addLine(to: CGPoint(x: secondCellStartPoint, y: firstRowHeight))
                path.addLine(to: CGPoint(x: secondCellStartPoint, y: secondRowHeight))
                path.addLine(to: CGPoint(x: 0, y: secondRowHeight))
            }
            .stroke(strokeColor, lineWidth: strokeWidth)
            
            Path { path in
                path.move(to: CGPoint(x: secondCellStartPoint, y: firstRowHeight))
                path.addLine(to: CGPoint(x: secondCellStartPoint, y: firstRowHeight))
                path.addLine(to: CGPoint(x: secondCellStartPoint, y: secondRowHeight))
                path.addLine(to: CGPoint(x: maxWidth, y: secondRowHeight))
            }
            .stroke(strokeColor, lineWidth: strokeWidth)
            
            Path { path in
                path.move(to: CGPoint(x: secondCellStartPoint, y: firstRowHeight))
                path.addLine(to: CGPoint(x: secondCellStartPoint, y: firstRowHeight))
                path.addLine(to: CGPoint(x: secondCellStartPoint, y: thirdRowHeight))
            }
            .stroke(strokeColor, lineWidth: strokeWidth)
            
            Path { path in
                path.move(to: CGPoint(x: secondCellStartPoint, y: firstRowHeight))
                path.addLine(to: CGPoint(x: secondCellStartPoint, y: firstRowHeight))
                path.addLine(to: CGPoint(x: secondCellStartPoint, y: thirdRowHeight))
            }
            .stroke(strokeColor, lineWidth: strokeWidth)
        }
    }
}


#Preview {
    PlaygroundBackground()
}
