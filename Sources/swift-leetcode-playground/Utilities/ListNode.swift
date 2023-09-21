public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0
        self.next = nil
    }

    public init(_ val: Int) { self.val = val
        self.next = nil
    }

    public init(_ val: Int, _ next: ListNode?) { self.val = val
        self.next = next
    }
}

extension ListNode {
    
    func outputChain(spaced: Bool = false) -> String {
        
        var c: ListNode? = self
        
        var s = "["
        
        while let d = c {
            s.append("\(d.val)")
            
            if let n = d.next {
                c = n
                s.append(spaced ? ", " : ",")
            } else {
                c = nil
            }
        }
        
        s.append("]")
        
        return s
    }
    
    func printOutput(spaced: Bool = false) {
        print(outputChain(spaced: spaced))
    }
    
    static func makeChain(_ nums: [Int]) -> ListNode? {
        
        let d = ListNode(-1)
        var c: ListNode = d
        
        for num in nums {
            let new = ListNode(num)
            c.next = new
            c = new
        }
        
        return d.next
    }
}
