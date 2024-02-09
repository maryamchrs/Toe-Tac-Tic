//
//  Array+Extension.swift
//  ReverseTicTacToe
//
//  Created by Maryam Chrs on 16/11/2023.
//

import Foundation

extension Array where Element == Int {
    
    func removeCommonElements(secendArray: [Int]) -> [Int] {
        // Convert both arrays to sets for efficient intersection checking
        let set1 = Set(self)
        let set2 = Set(secendArray)
        
        // Calculate the intersection of the two sets
        let commonElements = set1.intersection(set2)
        
        // Create new arrays containing elements unique to each array
        let uniqueElementArray = Array(set1.subtracting(commonElements))
        
        return uniqueElementArray
    }
}

extension Array where Element: Equatable {
    mutating func remove(object: Element) {
        guard let index = firstIndex(of: object) else {return}
        remove(at: index)
    }
}
