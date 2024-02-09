//
//  AppCoordinator.swift
//  ReverseTicTacToe
//
//  Created by Maryam Chrs on 24/10/2023.
//

import SwiftUI

/// Coordinator is a class  that can handle the whole routing in the app.
final class Coordinator: ObservableObject {
    @Published var path = NavigationPath()
    
    func routeToOnboarding() {
        path.append(Destination.onboarding)
    }
    
    func routeToPlayerPersonalSetupView() {
        path.append(Destination.personalSetup)
    }
    
    func routeToPlayground(info: PlayerInfoModel) {
        path.append(Destination.playground(info))
    }
    
    func routeBack() {
        path.removeLast()
    }
}

