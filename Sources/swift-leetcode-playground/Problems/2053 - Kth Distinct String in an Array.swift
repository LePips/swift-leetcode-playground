//
// Kth Distinct String in an Array
//
// Difficulty: Easy
// https://leetcode.com/problems/kth-distinct-string-in-an-array
//

import OrderedCollections

struct KthDistinctStringinanArray {
    func input(_ arr: [String], _ k: Int) -> String {
        arr.reduce(into: OrderedDictionary<String, Int>()) {
            $0[$1, default: 0] += 1
        }
        .filter { $0.value == 1 }
        .dropFirst(k - 1)
        .first?
        .key ?? ""
    }
}

extension KthDistinctStringinanArray: Testable {

    var problemTitle: String {
        "2053 - Kth Distinct String in an Array.swift"
    }

    func test() {

    }
}
