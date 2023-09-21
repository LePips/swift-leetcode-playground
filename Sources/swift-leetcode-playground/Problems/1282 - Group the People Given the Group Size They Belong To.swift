//
// Group the People Given the Group Size They Belong To
//
// Difficulty: Medium
// https://leetcode.com/problems/group-the-people-given-the-group-size-they-belong-to
//

struct GroupthePeopleGiventheGroupSizeTheyBelongTo {
    func input(_ groupSizes: [Int]) -> [[Int]] {
        
        var d: [Int: [Int]] = [:]
        var t: [[Int]] = []
        
        // just in 1 cycle
        for i in groupSizes.enumerated() {
            d[i.element, default: []].append(i.offset)
            
            let c = d[i.element]!
            
            if c.count == i.element {
                t.append(c)
                d[i.element] = []
            }
        }
        
        return t
    }
}

extension GroupthePeopleGiventheGroupSizeTheyBelongTo: Testable {

    var problemTitle: String {
        "1282 - Group the People Given the Group Size They Belong To.swift"
    }

    func test() {
        testCase(expected: [[5],[0,1,2],[3,4,6]], with: input([3,3,3,3,3,1,3]))
    }
}
