//
//  Array+Extension.swift
//  ReverseTicTacToe
//
//  Created by Maryam Chrs on 16/11/2023.
//

import Foundation

extension Array where Element == Int {
    
    func removingCommonElements(with secendArray: [Int]) -> [Int] {
        var uniqueElementArray = [Int]()
        let aSet = Set(secendArray)
        
        for number in self where !aSet.contains(number) {
            uniqueElementArray.append(number)
        }
        
        return uniqueElementArray
    }
}

extension Array where Element: Equatable {
    mutating func remove(object: Element) {
        guard let index = firstIndex(of: object) else {return}
        remove(at: index)
    }
}
