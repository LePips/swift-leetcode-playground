//
// Reconstruct Itinerary
//
// Difficulty: Hard
// https://leetcode.com/problems/reconstruct-itinerary
//

struct ReconstructItinerary {
    
//    func f(_ c: String, _ r: [String], d: [String: [[String]]]) -> [String] {
//        if let p = d[c] {
//            guard !p.isEmpty else { return r }
//
//            var n: [[String]] = []
//
//            for i in 0 ..< p.count {
//                var nr = r
//                nr.append(p[i][1])
//
//                var nd = d
//                nd[c]?.remove(at: i)
//
//                n.append(f(p[i][1], nr, d: nd))
//            }
//
//            let ne = Dictionary(grouping: n, by: { $0.count })
//            return ne[ne.keys.max()!]!.sorted(by: { $0.joined() < $1.joined() })[0]
//        } else {
//            return r
//        }
//    }
//
//    func input(_ tickets: [[String]]) -> [String] {
//        let d = Dictionary(grouping: tickets, by: { $0[0] })
//        return f("JFK", ["JFK"], d: d)
//    }
    
    func f(_ t: String, _ r: inout [String], _ d: inout [String: [String]]) {
        
        if d[t] != nil {
            while !d[t]!.isEmpty {
                f(d[t]!.removeFirst(), &r, &d)
            }
        }
        
        r.append(t)
    }
    
    func input(_ tickets: [[String]]) -> [String] {
        
        guard !tickets.isEmpty else { return [] }
        
        var d = Dictionary(grouping: tickets.sorted(by: { $0[1] < $1[1] }), by: { $0[0] })
            .mapValues { a in
                a.flatMap { b in
                    b[1]
                } as [String]
            }
        
        var r: [String] = []
        
        f("JFK", &r, &d)
        
        return r.reversed()
    }
}

extension ReconstructItinerary: Testable {

    var problemTitle: String {
        "332 - Reconstruct Itinerary.swift"
    }

    func test() {
        testCase(expected: ["JFK","MUC","LHR","SFO","SJC"], with: input([["MUC","LHR"],["JFK","MUC"],["SFO","SJC"],["LHR","SFO"]]))
        testCase(expected: ["JFK","ATL","JFK","SFO","ATL","SFO"], with: input([["JFK","SFO"],["JFK","ATL"],["SFO","ATL"],["ATL","JFK"],["ATL","SFO"]]))
        testCase(expected: ["JFK","NRT","JFK","KUL"], with: input([["JFK","KUL"],["JFK","NRT"],["NRT","JFK"]]))
//        testCase(expected: [], with: input([["AXA","EZE"],["EZE","AUA"],["ADL","JFK"],["ADL","TIA"],["AUA","AXA"],["EZE","TIA"],["EZE","TIA"],["AXA","EZE"],["EZE","ADL"],["ANU","EZE"],["TIA","EZE"],["JFK","ADL"],["AUA","JFK"],["JFK","EZE"],["EZE","ANU"],["ADL","AUA"],["ANU","AXA"],["AXA","ADL"],["AUA","JFK"],["EZE","ADL"],["ANU","TIA"],["AUA","JFK"],["TIA","JFK"],["EZE","AUA"],["AXA","EZE"],["AUA","ANU"],["ADL","AXA"],["EZE","ADL"],["AUA","ANU"],["AXA","EZE"],["TIA","AUA"],["AXA","EZE"],["AUA","SYD"],["ADL","JFK"],["EZE","AUA"],["ADL","ANU"],["AUA","TIA"],["ADL","EZE"],["TIA","JFK"],["AXA","ANU"],["JFK","AXA"],["JFK","ADL"],["ADL","EZE"],["AXA","TIA"],["JFK","AUA"],["ADL","EZE"],["JFK","ADL"],["ADL","AXA"],["TIA","AUA"],["AXA","JFK"],["ADL","AUA"],["TIA","JFK"],["JFK","ADL"],["JFK","ADL"],["ANU","AXA"],["TIA","AXA"],["EZE","JFK"],["EZE","AXA"],["ADL","TIA"],["JFK","AUA"],["TIA","EZE"],["EZE","ADL"],["JFK","ANU"],["TIA","AUA"],["EZE","ADL"],["ADL","JFK"],["ANU","AXA"],["AUA","AXA"],["ANU","EZE"],["ADL","AXA"],["ANU","AXA"],["TIA","ADL"],["JFK","ADL"],["JFK","TIA"],["AUA","ADL"],["AUA","TIA"],["TIA","JFK"],["EZE","JFK"],["AUA","ADL"],["ADL","AUA"],["EZE","ANU"],["ADL","ANU"],["AUA","AXA"],["AXA","TIA"],["AXA","TIA"],["ADL","AXA"],["EZE","AXA"],["AXA","JFK"],["JFK","AUA"],["ANU","ADL"],["AXA","TIA"],["ANU","AUA"],["JFK","EZE"],["AXA","ADL"],["TIA","EZE"],["JFK","AXA"],["AXA","ADL"],["EZE","AUA"],["AXA","ANU"],["ADL","EZE"],["AUA","EZE"]]))
    }
}
