//
//  ISource.swift
//  The-Kata
//
//  Created by Prateek on 2024/07/14.
//

import Foundation

protocol ISource {
    
    func readChar() -> Character
    func readChars(count: Int) -> String
}
