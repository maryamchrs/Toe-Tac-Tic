//
//  StorageManager.swift
//  ReverseTicTacToe
//
//  Created by Maryam Chrs on 24/10/2023.
//

import Foundation

protocol StorageManager {
    func getIsFirstOpen() -> Bool
    func setIsFirstOpenToFalse()
}

final class UserDefaultsBasedStorageManager: StorageManager, ObservableObject {
    func getIsFirstOpen() -> Bool { !UserDefaults.standard.isFirstOpen }
    func setIsFirstOpenToFalse() { UserDefaults.standard.isFirstOpen = true }
}
