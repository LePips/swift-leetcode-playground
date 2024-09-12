@_exported import HeapModule

// MARK: problem

let currentProblem: Testable = PacificAtlanticWaterFlow()

// MARK: time

let shouldTime: Bool = true

// MARK: printouts

print("------------")
print(currentProblem.problemTitle)
print("")
currentProblem.test()
print("")
print("------------")
