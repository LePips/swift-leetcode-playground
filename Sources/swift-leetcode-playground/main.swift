
// MARK: problem

let currentProblem: Testable = TimeBasedKeyValueStore()

// MARK: time

let shouldTime: Bool = true

// MARK: printouts

print("------------")
print(currentProblem.problemTitle)
print("")
currentProblem.test()
print("")
print("------------")
