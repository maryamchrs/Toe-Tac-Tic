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
    
    private let storageManager: StorageManager
    private var startButtonSubject = PassthroughSubject<Void, Never>()
    var startButtonPublisher: AnyPublisher<Void, Never> { startButtonSubject.eraseToAnyPublisher() }
    var selectedOption: GamePiece? {
        selectedPiece
    }
    private var bag = Set<AnyCancellable>()
    
    // MARK: - LifeTime of Class
    init(storageManager: StorageManager) {
        CustomLogger.log(text: "PlayerPersonalSetupViewModel was inited.")
        self.storageManager = storageManager
        startObservers()
    }
    
    deinit {
        CustomLogger.log(text: "PlayerPersonalSetupViewModel was deinited.")
    }
}

// MARK: - Public Methods
extension PlayerPersonalSetupViewModel {
    func oneOptionIsChosen(type: GamePiece) {
        selectedPiece = type
    }
    
    func startGameButtonIsTapped() {
        startButtonSubject.send()
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
