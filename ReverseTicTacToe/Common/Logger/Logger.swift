//
//  Logger.swift
//  ReverseTicTacToe
//
//  Created by Maryam Chrs on 24/10/2023.
//

import Foundation

final class Logger {
    
    private static let separator = " ---> "
    
    class func logInit(owner: String) {
        let string = "LifeCycle" + separator + owner + " init"
        print(string)
    }
    
    class func logDeinit(prefix: String? = nil, owner: String) {
        let string = "LifeCycle" + separator + owner + " deinit"
        print(string)
    }
    
    class func log(prefix: String? = nil, text: String) {
        print(text)
    }
}

private extension Logger {
    
    class func print(_ string: String) {
        var string = string
        appendPrefix(string: &string)
        debugPrint(string)
    }
    
    class func appendPrefix(string: inout String) {
        string = separator + string
    }
}
