//
//  TheKataTests.swift
//  TheKataTests
//
//  Created by Prateek on 2024/07/14.
//

import XCTest
import Cuckoo
import Foundation
@testable import TheKata

final class TheKataTests: XCTestCase {
    
    var serviceUnderTest: Copier!
    var mockSource: MockISource!
    var mockDest: MockIDestination!
    let testInputStream: String = "This is a test string input for copier.\n"
    var testOutputStream: String!
    
    override func setUpWithError() throws {
        mockSource = MockISource()
        mockDest = MockIDestination()
        testOutputStream = ""
        
        stub(mockSource) { stub in
            var counter = 0
            
            var char: Character {
                return testInputStream[testInputStream.index(testInputStream.startIndex, offsetBy: counter)]
            }
            
            func string(ofSize size: Int) -> String {
                let endBlockIndex = (counter + size > testInputStream.count) ? testInputStream.count : (counter + size)
                var stringBlock = ""
                (counter..<endBlockIndex).forEach { _ in stringBlock.append(readCharFunction()) }
                return stringBlock
            }
            
            let readCharFunction: () -> Character = {
                defer { counter += 1 }
                return char
            }
            
            let readCharsFunction: (Int) -> String = { readSize in
                return string(ofSize: readSize)
            }
            
            when(stub.readChar()).then {
                readCharFunction()
            }
            
            when(stub.readChars(count: anyInt())).then { readSize in
                readCharsFunction(readSize)
            }
        }
        
        stub(mockDest) { stub in
            when(stub.writeChar(c: anyCharacter())).then { [self] char in
                self.testOutputStream.append(char)
            }
            when(stub.writeChars(values: anyString())).then { [self] string in
                self.testOutputStream.append(string)
            }
        }
    }
    
    override func tearDownWithError() throws {
        mockSource = nil
        mockDest = nil
        serviceUnderTest = nil
        testOutputStream = nil
    }
    
    ///
    ///Test - Single character copy
    ///Given - That copy is called
    ///When - Copier class is used
    ///Then - Copier should copy one character at a time from ISource to IDestination calling readChar() and writeChar() multiple times (length of input string - 1)
    ///
    func testSingleCharacterCopy() {
        serviceUnderTest = Copier(source: mockSource, dest: mockDest)
        serviceUnderTest.copy()
        
        // Verify that ISource:readChar() and IDestination:writeChar() is called multiple times per character
        verify(mockSource, times(testInputStream.count)).readChar()
        verify(mockDest, times(testInputStream.count-1)).writeChar(c: anyCharacter())
        // Check that input and output strings are the same (excluding `\n`)
        XCTAssertEqual(String(testInputStream.dropLast(1)), testOutputStream)
    }
    
    ///
    ///Test - Multiple character copy
    ///Given - That copy is called
    ///When - MultipleCopier class is used and the copy block size is within the test input string length
    ///Then - Copier should copy multiple characters at a time from ISource to IDestination correctly
    ///
    func testMultipleCharacterCopyInAValidRangeForTheCopySize() {
        let characterCopySize = 5
        serviceUnderTest = MultipleCopier(source: mockSource, dest: mockDest, multipleCopySize: characterCopySize)
        serviceUnderTest.copy()
        
        // Verify that ISource:readChar() and IDestination:writeChar() is called multiple times per character
        verify(mockSource, times(testInputStream.count/characterCopySize)).readChars(count: anyInt())
        verify(mockDest, times(testInputStream.count/characterCopySize)).writeChars(values: anyString())
        // Check that input and output strings are the same (excluding `\n`)
        XCTAssertEqual(String(testInputStream.dropLast(1)), testOutputStream)
    }
    
    ///
    ///Test - Multiple character copy
    ///Given - That copy is called
    ///When - MultipleCopier class is used and the copy block size is outside the test input string length
    ///Then - Copier should copy multiple characters at a time from ISource to IDestination correctly
    ///
    func testMultipleCharacterCopyInAnInvalidRangeForTheCopySize() {
        let characterCopySize = testInputStream.count + 10
        serviceUnderTest = MultipleCopier(source: mockSource, dest: mockDest, multipleCopySize: characterCopySize)
        serviceUnderTest.copy()
        
        // Verify that ISource:readChar() and IDestination:writeChar() is called multiple times per character
        let invocationTimes = ceil(Double(testInputStream.count)/Double(characterCopySize))
        verify(mockSource, times(Int(invocationTimes))).readChars(count: anyInt())
        verify(mockDest, times(Int(invocationTimes))).writeChars(values: anyString())
        // Check that input and output strings are the same (excluding `\n`)
        XCTAssertEqual(String(testInputStream.dropLast(1)), testOutputStream)
    }
    
    ///
    ///Test - Multiple character copy
    ///Given - That copy is called
    ///When - MultipleCopier class is used and the copy block size is almost the test input string length
    ///Then - Copier should copy multiple characters at a time from ISource to IDestination correctly
    ///
    func testMultipleCharacterCopyInAValidEdgeRangeForTheCopySize() {
        let characterCopySize = testInputStream.count - 10
        serviceUnderTest = MultipleCopier(source: mockSource, dest: mockDest, multipleCopySize: characterCopySize)
        serviceUnderTest.copy()
        
        // Verify that ISource:readChar() and IDestination:writeChar() is called multiple times per character
        let invocationTimes = ceil(Double(testInputStream.count)/Double(characterCopySize))
        verify(mockSource, times(Int(invocationTimes))).readChars(count: anyInt())
        verify(mockDest, times(Int(invocationTimes))).writeChars(values: anyString())
        // Check that input and output strings are the same (excluding `\n`)
        XCTAssertEqual(String(testInputStream.dropLast(1)), testOutputStream)
    }
    
    ///
    ///Test - Multiple character copy
    ///Given - That copy is called
    ///When - MultipleCopier class is used and the copy block size is a single character
    ///Then - Copier should behave the same as the single copier class
    ///
    func testMultipleCharacterCopyInACopySizeOfOne() {
        let characterCopySize = 1
        serviceUnderTest = MultipleCopier(source: mockSource, dest: mockDest, multipleCopySize: characterCopySize)
        serviceUnderTest.copy()
        
        // Verify that ISource:readChar() and IDestination:writeChar() is called multiple times per character
        verify(mockSource, times(testInputStream.count)).readChars(count: anyInt())
        verify(mockDest, times(testInputStream.count-1)).writeChars(values: anyString())
        // Check that input and output strings are the same (excluding `\n`)
        XCTAssertEqual(String(testInputStream.dropLast(1)), testOutputStream)
    }
}

/// Returns a matcher matching any Character value.
public func anyCharacter() -> ParameterMatcher<Character> {
    return ParameterMatcher()
}
