//
// Filling Bookcase Shelves
//
// Difficulty: Medium
// https://leetcode.com/problems/filling-bookcase-shelves
//

struct FillingBookcaseShelves {
    
    func input(_ books: [[Int]], _ shelfWidth: Int) -> Int {
        
        let n = books.count
        var dp = CollectionOfOne(0) + ContiguousArray(repeating: Int.max, count: n)
        
        for i in 1 ... n {
            
            var width = 0
            var height = 0
            
            for j in (1 ... i).reversed() {
                width += books[j-1][0]
                
                if width > shelfWidth {
                    break
                }
                
                height = max(height, books[j-1][1])
                dp[i] = min(dp[i], dp[j-1] + height)
            }
        }
        
        return dp[n]
    }
}

extension FillingBookcaseShelves: Testable {

    var problemTitle: String {
        "1105 - Filling Bookcase Shelves.swift"
    }

    func test() {
        testCase(expected: 6, with: input([[1,1],[2,3],[2,3],[1,1],[1,1],[1,1],[1,2]], 4))
    }
}
