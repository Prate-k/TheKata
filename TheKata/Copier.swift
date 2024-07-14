//
//  Copier.swift
//  The-Kata
//
//  Created by Prateek on 2024/07/14.
//

import Foundation

class Copier {
    
    let source: ISource
    let dest: IDestination
    
    init(source: ISource, dest: IDestination) {
        self.source = source
        self.dest = dest
    }
    
    func copy() {
        var nextChar = source.readChar()
        while !nextChar.isNewline {
            dest.writeChar(c: nextChar)
            nextChar = source.readChar()
        }
    }
}
