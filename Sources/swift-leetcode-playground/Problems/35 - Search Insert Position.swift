//
// Search Insert Position
//
// Difficulty: Easy
// https://leetcode.com/problems/search-insert-position
//

struct SearchInsertPosition {
    func input(_ nums: [Int], _ target: Int) -> Int {
        let a = nums.firstIndex { i in
            if i > target {
                return true
            } else if i == target {
                return true
            }
            
            return false
        }
        
        return a ?? nums.count
    }
}

extension SearchInsertPosition: Testable {

    var problemTitle: String {
        "35 - Search Insert Position.swift"
    }

    func test() {
        testCase(expected: 2, with: { input([1,3,5,6], 5) })
        testCase(expected: 1, with: { input([1,3,5,6], 2) })
        testCase(expected: 4, with: { input([1,3,5,6], 7) })
    }
}
