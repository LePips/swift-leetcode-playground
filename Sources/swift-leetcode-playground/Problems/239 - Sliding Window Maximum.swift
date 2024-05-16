//
// Sliding Window Maximum
//
// Difficulty: Hard
// https://leetcode.com/problems/sliding-window-maximum
//

struct SlidingWindowMaximum {
    func input(_ nums: [Int], _ k: Int) -> [Int] {
        
        var q = nums.prefix(k)
            .enumerated()
            .sorted(by: { $0.element > $1.element })
        
        var t: [Int] = [q[0].element]
        
        for i in k ..< nums.count {
            
            let n = nums[i]
//            let o = nums[i - k]
            
            if let f = q.firstIndex(where: { $0.element < n }) {
                q.removeSubrange(f ..< q.count)
            }
            
            if let o = q.firstIndex(where: { $0 == (i - k, nums[i - k]) }) {
                q.remove(at: o)
            }
            
//            q.removeAll(where: { $0.element < n || $0 == (i - k, o) })
            
            q.append((i, n))
            t.append(q[0].element)
        }
        
        return t
    }
}

extension SlidingWindowMaximum: Testable {

    var problemTitle: String {
        "239 - Sliding Window Maximum.swift"
    }

    func test() {
        testCase(expected: [3,3,5,5,6,7], with: input([1,3,-1,-3,5,3,6,7], 3))
        testCase(expected: [1], with: input([1], 1))
        testCase(expected: [1, -1], with: input([1, -1], 1))
        testCase(expected: [9,9,10,10,10,10,10,10,10,9,9,9,8,8], with: input([-6,-10,-7,-1,-9,9,-8,-4,10,-5,2,9,0,-7,7,4,-2,-10,8,7], 7))
    }
}
