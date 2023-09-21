//
// Excel Sheet Column Number
//
// Difficulty: Easy
// https://leetcode.com/problems/excel-sheet-column-number
//

struct ExcelSheetColumnNumber {
    func input(_ columnTitle: String) -> Int {
        columnTitle
            .unicodeScalars
            .reduce(0, { $0 * 26 + Int($1.value) - 64 })
    }
}

extension ExcelSheetColumnNumber: Testable {

    var problemTitle: String {
        "171 - Excel Sheet Column Number.swift"
    }

    func test() {
        testCase(expected: 1, with: input("A"))
        testCase(expected: 28, with: input("AB"))
        testCase(expected: 701, with: input("ZY"))
    }
}
