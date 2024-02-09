//
//  PlayerPersonalSetupViewModel.swift
//  ReverseTicTacToe
//
//  Created by Maryam Chrs.
//

import Foundation
import Combine

final class PlayerPersonalSetupViewModel: ObservableObject {
    
    // MARK: - Properties and Constants
    @Published var playerName: String = ""
    @Published var selectedPiece: GamePiece?
    @Published var isStartButtonEnable: Bool  = false
    
    let storageManager: StorageManager
    var startButtonPublisher = PassthroughSubject<Bool, Never>()
    var selectedOption: GamePiece? {
        return selectedPiece
    }
    private var bag = Set<AnyCancellable>()
    
    // MARK: - LifeTime of Class
    init(storageManager: StorageManager) {
        Logger.log(text: "PlayerPersonalSetupViewModel was inited.")
        self.storageManager = storageManager
        startObservers()
    }
    
    deinit {
        bag.removeAll()
        Logger.log(text: "PlayerPersonalSetupViewModel was deinited.")
    }
}

// MARK: - Public Methods
extension PlayerPersonalSetupViewModel {
    func oneOptionIsChosen(type: GamePiece) {
        selectedPiece = type
    }
    
    func startGameButtonIsTapped() {
        startButtonPublisher.send(true)
    }
}
// MARK: - Private Methods

private extension PlayerPersonalSetupViewModel {
    func startObservers() {
        Publishers
            .CombineLatest($playerName, $selectedPiece)
            .sink { [weak self] name, selectedOption in
                guard let self else { return }
                self.isStartButtonEnable = !name.isEmpty && selectedOption != nil
            }
            .store(in: &bag)
    }
}
