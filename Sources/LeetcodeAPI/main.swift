import Foundation
import Get

let numberOfProblems: Double = 10

let client = APIClient(baseURL: URL(string: "https://leetcode.com"))

var allProblemsRequest = Paths.graphql.post(.init(
    query: "query problemsetQuestionList($categorySlug: String, $limit: Int, $skip: Int, $filters: QuestionListFilterInput) { problemsetQuestionList: questionList( categorySlug: $categorySlug limit: $limit skip: $skip filters: $filters ) { total: totalNum questions: data { acRate content difficulty freqBar questionId questionFrontendId isFavor isPaidOnly status title titleSlug topicTags { name id slug } hasSolution hasVideoSolution codeSnippets { lang langSlug code } } } }",
    variables: .init(object: ["categorySlug": .string(""), "limit": .number(numberOfProblems), "skip": .number(0), "filters": .object([:])])
))

asyncMain {
    do {
        let allProblemsResponse = try await client.send(allProblemsRequest)
        let allProblems = allProblemsResponse.value.data.problemsetQuestionList?.questions ?? []
        let validProblems = allProblems
            .filter { !($0.isPaidOnly ?? true) }
            .filter(\.swiftEnabled)
            .filter(\.isBasicSolution)

        print("Problems: \(validProblems.count)")

        for problem in validProblems {
            print(problem.fileName)
            await generateQuestionFile(with: problem)
        }
    } catch {
        print("LeetCode request error: \(error)")
    }
}
