//
// Walking Robot Simulation
//
// Difficulty: Medium
// https://leetcode.com/problems/walking-robot-simulation
//

struct WalkingRobotSimulation {
    
    func closest(_ obstacles: [[Int]], _ c: Int, _ k: Int, _ d: Int) -> [Int]? {
        
        let i = d % 2 == 0 ? 1 : 0
        let ii = d % 2 == 0 ? 0 : 1
        
        let n = d <= 1 ? 1 : -1
        let nc = c + (n * k)
        
        let inline = obstacles.filter { $0[ii] == c }
        
        guard let first = inline.first else { return nil }
        
        var t: [Int] = first
        
        for o in inline {
            let od = o[i]
            
            if abs(t[i]) - abs(nc) > abs(od) - abs(nc) {
                t = o
            }
        }
        
        if abs(t[i]) > c, abs(t[i]) <= nc {
            return t
        } else {
            return nil
        }
    }
    
    func input(_ commands: [Int], _ obstacles: [[Int]]) -> Int {
		
        var lx = 0
        var ly = 0
        var d = 0
        
        var t = 0
        
        for c in commands {
            switch c {
            case -2:
                d = (d - 1) % 4
            case -1:
                d = (d + 1) % 4
            default:
                switch d {
                case 0:
                    if let c = closest(obstacles, ly, c, d) {
                        ly = c[1] - 1
                    } else {
                        ly += c
                    }
                case 1:
                    if let c = closest(obstacles, lx, c, d) {
                        lx += c[0] - 1
                    } else {
                        lx += c
                    }
                case 2:
                    if let c = closest(obstacles, ly, c, d) {
                        ly = c[1] + 1
                    } else {
                        ly -= c
                    }
                case 3:
                    if let c = closest(obstacles, lx, c, d) {
                        lx += c[0] - 1
                    } else {
                        lx -= c
                    }
                default:
                    fatalError()
                }
                
                t = max(t, lx * lx + ly * ly)
            }
        }
        
        return t
    }
}

extension WalkingRobotSimulation: Testable {

    var problemTitle: String {
        "874 - Walking Robot Simulation.swift"
    }

    func test() {
//        testCase(expected: 25, with: input([4, -1, 3], []))
        testCase(expected: 65, with: input([4,-1,4,-2,4], [[2,4]]))
//        testCase(expected: 36, with: input([6,-1,-1,6], []))
//        testCase(expected: 361, with: input([-2,-1,4,7,8], [[1,1],[2,1],[4,4],[5,-5],[2,-3],[-2,-3],[-1,-3],[-4,-1],[-4,3],[5,1]]))
//        testCase(expected: 1, with: input([2], [[0, 2]]))
    }
}
