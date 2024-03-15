//
//  MainPlaygroundViewModel.swift
//  ReverseTicTacToe
//
//  Created by Maryam Chrs on 12/11/2023.
//

import Foundation

/*
 MainPlaygroundViewModelProtocol has been created for the sake of extending options in the future.
 */
@MainActor
protocol MainPlaygroundViewModelProtocol: ObservableObject {
    var playerNickName: String { get set }
    var playerSelectedPiece: GamePiece { get set }
    var titleMessage: String { get }
    var message: String { get }
    var currentPlayer: Player { get }
    var boxesInfo: [BoxInfo]  { get }
    var isBoardEnable: Bool { get }
    
    func showStartingMessage()
    func checkMove(index: Int)
}

@MainActor
final class MainPlaygroundViewModel: MainPlaygroundViewModelProtocol {
    
    enum Message {
        case alreadyExists
        case someoneLost
        case someoneWon
        case gameFinished
        case waiting(playerNickName: String, piece: String)
        case noOneWonTheGame
        
        var description: String {
            switch self {
            case .alreadyExists:
                "this_bos_is_already_selected".localize
            case .someoneLost:
                "losing_message_description".localize
            case .someoneWon:
                "wining_message_description".localize
            case .gameFinished:
                "tied_game_message".localize
            case .waiting(let playerNickName, let piece):
                "waiting_message".localizedWithArgs([playerNickName, piece])
            case .noOneWonTheGame:
                "tied_game_message".localize
            }
        }
    }
    
    // MARK: - Properties and Outlet
    // MARK: Public
    @Published var titleMessage: String = ""
    @Published var message: String = ""
    @Published var currentPlayer: Player = .user
    @Published var boxesInfo: [BoxInfo] = BoxInfo.initialStates
    @Published var isBoardEnable: Bool = true
    var playerSelectedPiece: GamePiece
    var playerNickName: String
    
    // MARK: Private
    private let winningStates = Constants.winingStates
    private var userMoves: [Int] = []
    private var userOpponentMoves: [Int] = []
    private var isGameFinished: Bool = false
    
    // MARK: - ViewModel cycle
    init(playerNickName: String, playerSelectedPiece: GamePiece) {
        CustomLogger.log(text: "MainPlaygroundViewModel is inited.")
        self.playerNickName = playerNickName
        self.playerSelectedPiece = playerSelectedPiece
    }
    
    deinit {
        CustomLogger.log(text: "MainPlaygroundViewModel is deinited.")
    }
}

// MARK: - Public Methods
extension MainPlaygroundViewModel {
    func showStartingMessage() {
        message = Message.waiting(playerNickName: playerNickName,
                                  piece: playerSelectedPiece.rawValue).description
    }
    
    func checkMove(index: Int) {
        Task {
            clearMessages()
            guard !isTheGameEnded() else { return }
            
            if isAlreadyExists(index) {
                message = Message.alreadyExists.description
                return
            }
            
            addMove(for: .user, index: index)
            
            let (isSomeoneLostTheGame, lossMessageTitle, lossMessageDescription) = checkIfSomeoneLostTheGame(currentPlayer: currentPlayer)
            if isSomeoneLostTheGame {
                titleMessage = lossMessageTitle
                message = lossMessageDescription
                finisheTheGame()
                return
            }
            
            if checkForFinishingTheGame() {
                message = Message.gameFinished.description
                finisheTheGame()
                return
            }
            
            changeCurrentPlayer()
            await makeMoveForBot()
        }
    }
}

// MARK: - Private Methods
private extension MainPlaygroundViewModel {
    
    func makeMoveForBot() async {
        guard !isTheGameEnded() else { return }
        updateBoardEnablingStatus(false)
        let (safeMoves, possibleMoves) = availableMoves()
        try? await Task.sleep(nanoseconds: Constants.delayOfThinking)
        
        let botIndex: Int = !safeMoves.isEmpty ? (safeMoves.randomElement()!) : (possibleMoves.randomElement()!)
        addMove(for: .userOpponent, index: botIndex)
        
        let (isSomeoneLostTheGame, losingTitleMessage, losingDescriptionMessage) = checkIfSomeoneLostTheGame(currentPlayer: currentPlayer)
        if isSomeoneLostTheGame {
            titleMessage = losingTitleMessage
            message = losingDescriptionMessage
            return
        }
        
        if checkForFinishingTheGame() {
            message = Message.gameFinished.description
            return
        }
        
        changeCurrentPlayer()
        updateBoardEnablingStatus(true)
        message = Message.waiting(playerNickName: playerNickName,
                                  piece: playerSelectedPiece.rawValue).description
    }
    
    func clearMessages() {
        titleMessage = ""
        message = ""
    }
    
    func isTheGameEnded() -> Bool {
        isGameFinished
    }
    
    func addMove(for player: Player, index: Int) {
        switch player {
        case .user:
            // User
            userMoves.append(index)
            createBoxInfo(index: index)
        case .userOpponent:
            // Bot
            createBoxInfo(index: index)
            userOpponentMoves.append(index)
        }
    }
    
    func finisheTheGame() {
        isGameFinished = true
        updateBoardEnablingStatus(false)
    }
    
    func updateBoardEnablingStatus(_ status: Bool) {
        isBoardEnable = status
    }
    
    func isAlreadyExists(_ moveIndex: Int) -> Bool {
        return userMoves.contains(where: {$0 == moveIndex}) || userOpponentMoves.contains(where: {$0 == moveIndex})
    }
    
    func checkIfSomeoneLostTheGame(currentPlayer: Player) -> (Bool, String, String) {
        var moves: [Int] = []
        var titleMessage: String = ""
        var message: String = ""
        switch currentPlayer {
        case .user:
            moves = userMoves
            titleMessage = "losing_message_title".localizedWithArgs([playerNickName])
            message = Message.someoneLost.description
        case .userOpponent:
            moves = userOpponentMoves
            titleMessage = "wining_message_title".localizedWithArgs([playerNickName])
            message = Message.someoneWon.description
        }
        return (checkForBecomingLostStatus(moves: moves), titleMessage, message)
    }
    
    func checkForBecomingLostStatus(moves: [Int]) -> Bool {
        for combination in winningStates {
            let intersection = Set(combination).intersection(moves)
            if intersection.count == 3 {
                return true
            }
        }
        return false
    }
    
    func changeCurrentPlayer() {
        switch currentPlayer {
        case .user:
            currentPlayer = .userOpponent
        case .userOpponent:
            currentPlayer = .user
        }
    }
    
    func createBoxInfo(index: Int) {
        if let indexToUpdate = boxesInfo.firstIndex(where: { $0.id == index }) {
            boxesInfo[indexToUpdate] = BoxInfo(id: index, status: findRelatedStatusForBox())
        }
    }
    
    func findRelatedStatusForBox() -> GamePiece {
        switch currentPlayer {
        case .user:
            return playerSelectedPiece
        case .userOpponent:
            return playerSelectedPiece.opponentChoice
        }
    }
    
    func findOptionsWithProbabilityOfWinning(moves: [Int]) -> [Int] {
        var options: [[Int]] = []
        for combination in Constants.winingStates {
            let intersection = Set(combination).intersection(moves)
            if intersection.count == 2 {
                // If two moves are already made in this combination, add it to successful options
                options.append(Array(Set(combination).subtracting(intersection)))
            }
        }
        
        return options.flatMap({$0})
    }
    
    func availableMoves() -> ([Int], [Int]) {
        var moves: [Int] = (0..<9).map{$0}
        moves = moves.removeCommonElements(secendArray: userMoves)
        moves = moves.removeCommonElements(secendArray: userOpponentMoves)
        var safeMoves = moves
        let movesToLeadUserSuccess = findOptionsWithProbabilityOfWinning(moves: userMoves)
        let movesToLeadBotSuccess = findOptionsWithProbabilityOfWinning(moves: userOpponentMoves)
        let wholeSuccessfulMoves = Array(Set(movesToLeadUserSuccess + movesToLeadBotSuccess))
        safeMoves = safeMoves.filter { !wholeSuccessfulMoves.contains($0) }
        return (safeMoves, moves)
    }
    
    func checkForFinishingTheGame() -> Bool {
        let wholeMoves = Array(Set(userMoves + userOpponentMoves))
        return wholeMoves.count == 9 ? true : false
    }
}
