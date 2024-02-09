//
//  GameDescriptionViewModel.swift
//  ReverseTicTacToe
//
//  Created by Maryam Chrs on 24/10/2023.
//

import Foundation
import Combine

final class GameDescriptionViewModel: ObservableObject {
    
    let storageManager: StorageManager
    var continueFlowPublisher = PassthroughSubject<Void, Never>()
    
    // MARK: - LifeTime of Class
    init(storageManager: StorageManager) {
        Logger.log(text: "OnboardingViewModel was inited.")
        self.storageManager = storageManager
    }
    
    deinit {
        Logger.log(text: "OnboardingViewModel was deinited.")
    }
}
