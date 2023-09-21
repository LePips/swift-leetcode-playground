//
// Minimum Operations to Reduce X to Zero
//
// Difficulty: Medium
// https://leetcode.com/problems/minimum-operations-to-reduce-x-to-zero
//

struct MinimumOperationstoReduceXtoZero {
    
    func f(_ nums: [Int], _ l: Int, _ r: Int, _ x: Int) -> Int? {

        if x == 0 {
            return 0
        }

        guard x > 0, !nums.isEmpty, l <= r else { return nil }
        
        let rl = f(nums, l + 1, r, x - nums[l])
        let rr = f(nums, l, r - 1, x - nums[r])
        
        switch (rl, rr) {
        case let (.some(lv), .some(rv)):
            return 1 + min(lv, rv)
        case let (.some(lv), nil):
            return 1 + lv
        case let (nil, .some(rv)):
            return 1 + rv
        case (nil, nil):
            return nil
        }
    }

    func input(_ nums: [Int], _ x: Int) -> Int {
        f(nums, 0, nums.count - 1, x) ?? -1
    }
}

extension MinimumOperationstoReduceXtoZero: Testable {

    var problemTitle: String {
        "1658 - Minimum Operations to Reduce X to Zero.swift"
    }

    func test() {
//        testCase(expected: 2, with: input([1,1,4,2,3], 5))
//        testCase(expected: -1, with: input([5,6,7,8,9], 4))
//        testCase(expected: 5, with: input([3,2,20,1,1,3], 10))
//        testCase(expected: 16, with: input([8828,9581,49,9818,9974,9869,9991,10000,10000,10000,9999,9993,9904,8819,1231,6309], 134365))
        testCase(expected: 1, with: input([1241,8769,9151,3211,2314,8007,3713,5835,2176,8227,5251,9229,904,1899,5513,7878,8663,3804,2685,3501,1204,9742,2578,8849,1120,4687,5902,9929,6769,8171,5150,1343,9619,3973,3273,6427,47,8701,2741,7402,1412,2223,8152,805,6726,9128,2794,7137,6725,4279,7200,5582,9583,7443,6573,7221,1423,4859,2608,3772,7437,2581,975,3893,9172,3,3113,2978,9300,6029,4958,229,4630,653,1421,5512,5392,7287,8643,4495,2640,8047,7268,3878,6010,8070,7560,8931,76,6502,5952,4871,5986,4935,3015,8263,7497,8153,384,1136], 894887480))
    }
}
