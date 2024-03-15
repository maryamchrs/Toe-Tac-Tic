//
//  CustomLogger.swift
//  ReverseTicTacToe
//
//  Created by Maryam Chrs on 24/10/2023.
//

import Foundation
import OSLog

protocol LoggerProtocol {
    
}

class CustomLogger {
    
    /*
     Subsystem is typically a bundle identifire which helps identify a message coming from your app.
     You can use category to further distinguish a message coming from different part of your program.
     */
    
    private static var logger = Logger(subsystem: "com.demo.app.ReverseTicTacToe",
                                       category: "ToeTacTic")
    
    class func logInit(owner: String) {
        logger.debug("LifeCycle + ---> + \(owner, privacy: .public) +  init")
    }
    
    class func logDeinit(owner: String) {
        logger.debug("LifeCycle + ---> + \(owner, privacy: .public) +  deinit")
    }
    
    class func log(text: String) {
        logger.debug("\(text, privacy: .public)")
    }
}

