//
//  View+Extension.swift
//  ReverseTicTacToe
//
//  Created by Maryam Chrs on 15/11/2023.
//

import SwiftUI

extension View {
    
    @ViewBuilder func isHidden(_ hidden: Bool) -> some View {
        if hidden {
            self.hidden()
        } else {
            self
        }
    }
    
}
