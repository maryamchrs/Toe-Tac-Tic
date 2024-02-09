//
//  ReverseTicTacToeApp.swift
//  ReverseTicTacToe
//
//  Created by Maryam Chrs on 24/10/2023.
//

import SwiftUI

@main
struct ReverseTicTacToeApp: App {
    
    @ObservedObject var coordinator = Coordinator()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $coordinator.path) {
                ViewFactory.MakeGameDescriptionView()
                    .navigationDestination(for: Destination.self) { destination in
                        ViewFactory.createView(destination)
                    }
            }
            .environmentObject(coordinator)
        }
    }
}
