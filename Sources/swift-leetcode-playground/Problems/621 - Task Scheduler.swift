//
// Task Scheduler
//
// Difficulty: Medium
// https://leetcode.com/problems/task-scheduler
//

import HeapModule

struct TaskScheduler {
    
    func input(_ tasks: [Character], _ n: Int) -> Int {
        
        let tasks = tasks.map { $0.asciiValue! }
        
        let d = Dictionary(grouping: tasks, by: { $0 })
            .mapValues { $0.count }
        
        var h = Heap<Int>()
        h.insert(contentsOf: d.values)
        
        var t = 0
        
        while !h.isEmpty {
            var cycle = n + 1
            var store: [Int] = []
            var tc = 0
            
            while cycle > 0 && !h.isEmpty {
                cycle -= 1
                
                if h.max! > 1 {
                    store.append(h.max! - 1)
                }
                
                h.removeMax()
                tc += 1
            }
            
            for s in store {
                h.insert(s)
            }
            
            t += h.isEmpty ? tc : n + 1
        }
        
		return t
    }
}

extension TaskScheduler: Testable {

    var problemTitle: String {
        "621 - Task Scheduler.swift"
    }

    func test() {
        testCase(expected: 8, with: input(["A","A","A","B","B","B"], 2))
    }
}
