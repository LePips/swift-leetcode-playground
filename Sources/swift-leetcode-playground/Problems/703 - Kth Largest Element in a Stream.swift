//
// Kth Largest Element in a Stream
//
// Difficulty: Easy
// https://leetcode.com/problems/kth-largest-element-in-a-stream
//

class KthLargest {

    private let k: Int
    private var a: [Int]

    init(_ k: Int, _ nums: [Int]) {
        self.k = k
        self.a = nums.sorted().reversed()
    }

    func add(_ val: Int) -> Int {

        for i in 0 ..< a.count {
            if val > a[i] {
                a.insert(val, at: i)
                return a[k - 1]
            }
        }

        a.append(val)

        return a[k - 1]
    }
}

extension KthLargest: Testable {

    var problemTitle: String {
        "703 - Kth Largest Element in a Stream.swift"
    }

    func test() {
        testCase(expected: [4, 5, 5, 8, 8]) {
            let kthLargest = KthLargest(3, [4, 5, 8, 2]);
            return [kthLargest.add(3),
            kthLargest.add(5),
            kthLargest.add(10),
            kthLargest.add(9),
            kthLargest.add(4)]
        }
    }
}
