//
//  StorageManager.swift
//  ReverseTicTacToe
//
//  Created by Maryam Chrs on 24/10/2023.
//

import Foundation

protocol StorageManagerProtocol {
    func getIsFirstOpen() -> Bool
    func setIsFirstOpenToFalse()
}

final class StorageManager: StorageManagerProtocol, ObservableObject {
    func getIsFirstOpen() -> Bool { !UserDefaults.standard.isFirstOpen }
    func setIsFirstOpenToFalse() { UserDefaults.standard.isFirstOpen = true }
}
