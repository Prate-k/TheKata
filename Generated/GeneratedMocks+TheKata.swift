// MARK: - Mocks generated from file: 'TheKata/IDestination.swift'

import Cuckoo
import Foundation

class MockIDestination: IDestination, Cuckoo.ProtocolMock {
    typealias MocksType = IDestination
    typealias Stubbing = __StubbingProxy_IDestination
    typealias Verification = __VerificationProxy_IDestination

    // Original typealiases

    let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    private var __defaultImplStub: (any IDestination)?

    func enableDefaultImplementation(_ stub: any IDestination) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }

    
    func writeChar(c p0: Character) {
        return cuckoo_manager.call(
            "writeChar(c p0: Character)",
            parameters: (p0),
            escapingParameters: (p0),
            superclassCall: Cuckoo.MockManager.crashOnProtocolSuperclassCall(),
            defaultCall: __defaultImplStub!.writeChar(c: p0)
        )
    }
    
    func writeChars(values p0: String) {
        return cuckoo_manager.call(
            "writeChars(values p0: String)",
            parameters: (p0),
            escapingParameters: (p0),
            superclassCall: Cuckoo.MockManager.crashOnProtocolSuperclassCall(),
            defaultCall: __defaultImplStub!.writeChars(values: p0)
        )
    }

    struct __StubbingProxy_IDestination: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager
    
        init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        func writeChar<M1: Cuckoo.Matchable>(c p0: M1) -> Cuckoo.ProtocolStubNoReturnFunction<(Character)> where M1.MatchedType == Character {
            let matchers: [Cuckoo.ParameterMatcher<(Character)>] = [wrap(matchable: p0) { $0 }]
            return .init(stub: cuckoo_manager.createStub(for: MockIDestination.self,
                method: "writeChar(c p0: Character)",
                parameterMatchers: matchers
            ))
        }
        
        func writeChars<M1: Cuckoo.Matchable>(values p0: M1) -> Cuckoo.ProtocolStubNoReturnFunction<(String)> where M1.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: p0) { $0 }]
            return .init(stub: cuckoo_manager.createStub(for: MockIDestination.self,
                method: "writeChars(values p0: String)",
                parameterMatchers: matchers
            ))
        }
    }

    struct __VerificationProxy_IDestination: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
    
        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
        
        
        @discardableResult
        func writeChar<M1: Cuckoo.Matchable>(c p0: M1) -> Cuckoo.__DoNotUse<(Character), Void> where M1.MatchedType == Character {
            let matchers: [Cuckoo.ParameterMatcher<(Character)>] = [wrap(matchable: p0) { $0 }]
            return cuckoo_manager.verify(
                "writeChar(c p0: Character)",
                callMatcher: callMatcher,
                parameterMatchers: matchers,
                sourceLocation: sourceLocation
            )
        }
        
        
        @discardableResult
        func writeChars<M1: Cuckoo.Matchable>(values p0: M1) -> Cuckoo.__DoNotUse<(String), Void> where M1.MatchedType == String {
            let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: p0) { $0 }]
            return cuckoo_manager.verify(
                "writeChars(values p0: String)",
                callMatcher: callMatcher,
                parameterMatchers: matchers,
                sourceLocation: sourceLocation
            )
        }
    }
}

class IDestinationStub:IDestination {


    
    func writeChar(c p0: Character) {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    func writeChars(values p0: String) {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
}




// MARK: - Mocks generated from file: 'TheKata/ISource.swift'

import Cuckoo
import Foundation

class MockISource: ISource, Cuckoo.ProtocolMock {
    typealias MocksType = ISource
    typealias Stubbing = __StubbingProxy_ISource
    typealias Verification = __VerificationProxy_ISource

    // Original typealiases

    let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    private var __defaultImplStub: (any ISource)?

    func enableDefaultImplementation(_ stub: any ISource) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }

    
    func readChar() -> Character {
        return cuckoo_manager.call(
            "readChar() -> Character",
            parameters: (),
            escapingParameters: (),
            superclassCall: Cuckoo.MockManager.crashOnProtocolSuperclassCall(),
            defaultCall: __defaultImplStub!.readChar()
        )
    }
    
    func readChars(count p0: Int) -> String {
        return cuckoo_manager.call(
            "readChars(count p0: Int) -> String",
            parameters: (p0),
            escapingParameters: (p0),
            superclassCall: Cuckoo.MockManager.crashOnProtocolSuperclassCall(),
            defaultCall: __defaultImplStub!.readChars(count: p0)
        )
    }

    struct __StubbingProxy_ISource: Cuckoo.StubbingProxy {
        private let cuckoo_manager: Cuckoo.MockManager
    
        init(manager: Cuckoo.MockManager) {
            self.cuckoo_manager = manager
        }
        
        func readChar() -> Cuckoo.ProtocolStubFunction<(), Character> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return .init(stub: cuckoo_manager.createStub(for: MockISource.self,
                method: "readChar() -> Character",
                parameterMatchers: matchers
            ))
        }
        
        func readChars<M1: Cuckoo.Matchable>(count p0: M1) -> Cuckoo.ProtocolStubFunction<(Int), String> where M1.MatchedType == Int {
            let matchers: [Cuckoo.ParameterMatcher<(Int)>] = [wrap(matchable: p0) { $0 }]
            return .init(stub: cuckoo_manager.createStub(for: MockISource.self,
                method: "readChars(count p0: Int) -> String",
                parameterMatchers: matchers
            ))
        }
    }

    struct __VerificationProxy_ISource: Cuckoo.VerificationProxy {
        private let cuckoo_manager: Cuckoo.MockManager
        private let callMatcher: Cuckoo.CallMatcher
        private let sourceLocation: Cuckoo.SourceLocation
    
        init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
            self.cuckoo_manager = manager
            self.callMatcher = callMatcher
            self.sourceLocation = sourceLocation
        }
        
        
        @discardableResult
        func readChar() -> Cuckoo.__DoNotUse<(), Character> {
            let matchers: [Cuckoo.ParameterMatcher<Void>] = []
            return cuckoo_manager.verify(
                "readChar() -> Character",
                callMatcher: callMatcher,
                parameterMatchers: matchers,
                sourceLocation: sourceLocation
            )
        }
        
        
        @discardableResult
        func readChars<M1: Cuckoo.Matchable>(count p0: M1) -> Cuckoo.__DoNotUse<(Int), String> where M1.MatchedType == Int {
            let matchers: [Cuckoo.ParameterMatcher<(Int)>] = [wrap(matchable: p0) { $0 }]
            return cuckoo_manager.verify(
                "readChars(count p0: Int) -> String",
                callMatcher: callMatcher,
                parameterMatchers: matchers,
                sourceLocation: sourceLocation
            )
        }
    }
}

class ISourceStub:ISource {


    
    func readChar() -> Character {
        return DefaultValueRegistry.defaultValue(for: (Character).self)
    }
    
    func readChars(count p0: Int) -> String {
        return DefaultValueRegistry.defaultValue(for: (String).self)
    }
}


