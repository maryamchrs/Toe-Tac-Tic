//
//  XIconView.swift
//  ReverseTicTacToe
//
//  Created by Maryam Chrs on 11/11/2023.
//

import SwiftUI

struct XIconView: View {
    var body: some View {
        Text("X")
            .foregroundColor(.lightFantasyGreen)
            .font(.sfPro(ofSize: 80, weight: .bold))
    }
}

#Preview {
    XIconView()
}
