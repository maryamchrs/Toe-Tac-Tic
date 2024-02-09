//
//  TicTacToeTableView.swift
//  ReverseTicTacToe
//
//  Created by Maryam Chrs on 12/11/2023.
//

import SwiftUI

struct TicTacToeTableView: View {
    
    var body: some View {
        table
            .ignoresSafeArea()
    }
}

private extension TicTacToeTableView {
    var horizenLinies: some View {
        HStack {
            Spacer()
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 2, height: .infinity)
                .background(.black)
            Spacer()
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 2, height: .infinity)
                .background(.black)
            Spacer()
        }
    }
    
    var verticalLines: some View {
        VStack {
            Spacer()
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 2, height: .infinity)
                .background(.black)
                .rotationEffect(Angle(degrees: -90))
            Spacer()
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 2, height: .infinity)
                .background(.black)
                .rotationEffect(Angle(degrees: -90))
            Spacer()
        }
    }
    
    var table: some View {
        GeometryReader { reader in
            
            let width: CGFloat = reader.size.width
            let height: CGFloat = reader.size.height
            let oneThirdOfHeight: CGFloat = height / 3
            let twoThirdOfHeight: CGFloat = height * 2 / 3
            let oneThirdOfWidth: CGFloat = width / 3
            let twoThirdOfWidth: CGFloat = width * 2 / 3
            
            Path { path in
                path.move(to: CGPoint(x: 0, y: oneThirdOfHeight))
                path.addLine(to: CGPoint(x: 0, y: oneThirdOfHeight))
                path.addLine(to: CGPoint(x: width, y: oneThirdOfHeight))
            }
            .stroke(.black, lineWidth: 2)
            
            Path { path in
                path.move(to: CGPoint(x: 0, y: twoThirdOfHeight))
                path.addLine(to: CGPoint(x: 0, y: twoThirdOfHeight))
                path.addLine(to: CGPoint(x: width, y: twoThirdOfHeight))
            }
            .stroke(.black, lineWidth: 2)
            
            Path { path in
                path.move(to: CGPoint(x: oneThirdOfWidth, y: 0))
                path.addLine(to: CGPoint(x: oneThirdOfWidth, y: 0))
                path.addLine(to: CGPoint(x: oneThirdOfWidth, y: height))
            }
            .stroke(.black, lineWidth: 2)
        
            Path { path in
                path.move(to: CGPoint(x: twoThirdOfWidth, y: 0))
                path.addLine(to: CGPoint(x: twoThirdOfWidth, y: 0))
                path.addLine(to: CGPoint(x: twoThirdOfWidth, y: height))
            }
            .stroke(.black, lineWidth: 2)
        }
    }
}
#Preview {
    TicTacToeTableView()
        .previewLayout(.sizeThatFits)
        .frame(width: 304, height: 304)
}
