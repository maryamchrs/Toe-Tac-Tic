//
//  String+Extension.swift
//  ReverseTicTacToe
//
//  Created by Maryam Chrs on 24/10/2023.
//

import Foundation

extension String {
    
    func localized() -> String {
        NSLocalizedString(self, tableName: "Localizable", bundle: Bundle.main, value: "", comment: "")
    }
    
    func localized(withArgs args: [CVarArg]) -> String {
        String(format: self.localized(), arguments: args)
    }
    
    func localized(withLang lang: String) -> String {
        NSLocalizedString(self, tableName: lang, bundle: Bundle.main, value: "", comment: "")
    }
    
    func localized(withLang lang: String, andArgs args: [CVarArg]) -> String {
        String(format: self.localized(withLang: lang), args)
    }
    
}
