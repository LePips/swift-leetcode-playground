//
// Time Based Key-Value Store
//
// Difficulty: Medium
// https://leetcode.com/problems/time-based-key-value-store
//

class TimeBasedKeyValueStore {
    
    private var m: [String: [(Int, String)]] = [:]

    init() {
        
    }

    private func bs(_ nums: [(Int, String)], _ timestamp: Int) -> String {
        var l = 0
        var r = nums.count - 1
        
        if nums[0].0 > timestamp {
            return ""
        }

        while l < r {
            let m = (l + r) / 2

            if nums[m].0 < timestamp {
                if nums[l + 1].0 > timestamp {
                    return nums[l].1
                }
                
                l = m + 1
            } else {
                r = m - 1
            }
        }

        return nums[l].1
    }
    
    func set(_ key: String, _ value: String, _ timestamp: Int) {
        m[key, default: []].append((timestamp, value))
    }
    
    @discardableResult
    func get(_ key: String, _ timestamp: Int) -> String {
        if let a = m[key] {
            return bs(a, timestamp)
        } else {
            return ""
        }
    }
}
/**
 * Your TimeMap object will be instantiated and called as such:
 * let obj = TimeMap()
 * obj.set(key, value, timestamp)
 * let ret_2: String = obj.get(key, timestamp)
 */

extension TimeBasedKeyValueStore: Testable {

    var problemTitle: String {
        "981 - Time Based Key-Value Store.swift"
    }

    func test() {
        var timeMap = TimeBasedKeyValueStore()
        timeMap.set("foo", "bar", 1);  // store the key "foo" and value "bar" along with timestamp = 1.
        
        testCase(expected: "bar", with: timeMap.get("foo", 1))
        testCase(expected: "bar", with: timeMap.get("foo", 3))
        
        timeMap.set("foo", "bar2", 4); // store the key "foo" and value "bar2" along with timestamp = 4.
        
        testCase(expected: "bar2", with: timeMap.get("foo", 4))
        testCase(expected: "bar2", with: timeMap.get("foo", 5))
        
//        ["TimeMap","set","set","get","get","get","get","get"]
//        [[],["love","high",10],["love","low",20],["love",5],["love",10],["love",15],["love",20],["love",25]]
        
        timeMap = TimeBasedKeyValueStore()
        
        timeMap.set("love", "high", 10)
        timeMap.set("love", "low", 20)
        
        testCase(expected: "", with: timeMap.get("love", 5))
        
        testCase(expected: "high", with: timeMap.get("love", 10))
        testCase(expected: "high", with: timeMap.get("love", 15))
        
        testCase(expected: "low", with: timeMap.get("love", 20))
        testCase(expected: "low", with: timeMap.get("love", 25))
        
        // ["TimeMap","set","set","get","set","get","get"]
        // [[],["a","bar",1],["x","b",3],["b",3],["foo","bar2",4],["foo",4],["foo",5]]
        
        timeMap = TimeBasedKeyValueStore()
        
        timeMap.set("a", "bar", 1)
        timeMap.set("x", "b", 3)
        
        testCase(expected: "", with: timeMap.get("b", 3))
    }
}
