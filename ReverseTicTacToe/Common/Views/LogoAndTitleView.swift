//
//  LogoAndTitleView.swift
//  ReverseTicTacToe
//
//  Created by Maryam Chrs on 12/11/2023.
//

import SwiftUI

struct LogoAndTitleView: View {
    var body: some View {
        VStack(spacing: 16) {
            Image("Logo")
            Image("ToeTacTic")
        }
        .ignoresSafeArea()
    }
}

#Preview {
    LogoAndTitleView()
}
