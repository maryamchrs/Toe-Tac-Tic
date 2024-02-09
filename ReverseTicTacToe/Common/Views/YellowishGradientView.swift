//
//  YellowishGradientView.swift
//  ReverseTicTacToe
//
//  Created by Maryam Chrs on 24/10/2023.
//

import SwiftUI

struct YellowishGradientView: View {
    var body: some View {
        ZStack {
            Group {
                Color.white
                LinearGradient(
                    gradient: Gradient(
                        colors: [Color.paleYellow,
                                 Color.royalBlue]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing)
            }
        }
        .ignoresSafeArea()
    }
}

struct YellowishGradientView_Previews: PreviewProvider {
    static var previews: some View {
        YellowishGradientView()
    }
}
