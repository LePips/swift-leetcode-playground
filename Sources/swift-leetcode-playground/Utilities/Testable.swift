import Foundation

protocol Testable {
    var problemTitle: String { get }
    func test()
}

func testCase<Expected: Equatable>(expected: Expected, with input: () -> Expected) {
    
    let before = Date.now
    let output = input()
    let runtime = Date.now.timeIntervalSince(before)
    
    if expected == output {
        let printout = "✅ - output: \(output)"
            .appending(if: shouldTime, aString: ", runtime: \(runtime)")
        print(printout)
    } else {
        let printout = "❌ - Expected: \(expected), output: \(output)"
            .appending(if: shouldTime, aString: ", runtime: \(runtime)")
        print(printout)
    }
}

func testCase<Expected: Equatable>(expected: Expected, with input: @autoclosure () -> Expected) {
    testCase(expected: expected, with: { input() })
}

extension String {
    
    func appending(if condition: Bool, aString: any StringProtocol) -> Self {
        if condition {
            return self.appending(aString)
        } else {
            return self
        }
    }
}
