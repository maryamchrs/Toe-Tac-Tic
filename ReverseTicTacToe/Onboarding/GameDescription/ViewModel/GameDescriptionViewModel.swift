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
    let continueFlowSubject = PassthroughSubject<Void, Never>()
    
    // MARK: - LifeTime of Class
    init(storageManager: StorageManager) {
        CustomLogger.log(text: "OnboardingViewModel was inited.")
        self.storageManager = storageManager
    }
    
    deinit {
        CustomLogger.log(text: "OnboardingViewModel was deinited.")
    }
}
