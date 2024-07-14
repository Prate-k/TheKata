//
//  MultipleCopier.swift
//  TheKata
//
//  Created by Prateek on 2024/07/14.
//

import Foundation

class MultipleCopier: Copier {
    
    let multipleCopySize: Int
    
    init(source: ISource, dest: IDestination, multipleCopySize: Int) {
        self.multipleCopySize = multipleCopySize
        super.init(source: source, dest: dest)
    }
    
    override func copy() {
        var nextChars = source.readChars(count: multipleCopySize)
        while !nextChars.isEmpty && nextChars != "\n" {
            let hasNewLine = nextChars.last!.isNewline
            dest.writeChars(values: hasNewLine ? String(nextChars.dropLast(1)) : nextChars )
            nextChars = hasNewLine ? "" : source.readChars(count: multipleCopySize)
        }
    }
}
