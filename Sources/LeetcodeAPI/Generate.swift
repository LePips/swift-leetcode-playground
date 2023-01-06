import Foundation

func createFile(with contents: String, at url: URL) async {
    try! Data(contents.utf8).write(to: url)
}

func generateQuestionFile(with question: GraphqlQuestionDetail) async {
    var fileLines: [String] = []

    fileLines.append("//")
    fileLines.append("// \(question.title ?? "--")")
    fileLines.append("//")
    fileLines.append("// Difficulty: \(question.difficulty?.value ?? "--")")
    fileLines.append("// https://leetcode.com/problems/\(question.titleSlug ?? "--")")
    fileLines.append("//")
    fileLines.append("")
    fileLines
        .append(
            question.swiftCodeSnippet.returnSolution()
                .namedSolution(questionName: question.validFunctionTitle)
        )

    let fileContents = fileLines.joined(separator: "\n")

    let generateFilePath = #filePath

    let newFilePath = URL(fileURLWithPath: generateFilePath)
        .deletingLastPathComponent()
        .deletingLastPathComponent()
        .appending(path: "swift-leetcode-playground")
        .appending(path: "Problems")
        .appending(path: question.fileName)

    await createFile(with: fileContents, at: newFilePath)
}

extension GraphqlQuestionCodeSnippet {
    func namedSolution(questionName: String) -> String {
        code.replacingOccurrences(of: "class Solution", with: "struct \(questionName)")
    }

    func returnSolution() -> GraphqlQuestionCodeSnippet {
        let splitCode = code.split(separator: "\n")
        let declarationLine = splitCode[splitCode.count - 4].split(separator: " ")

        // some solutions will use an inout parameter instead
        guard let index = declarationLine.firstIndex(of: "->") else { return self }

        let returnTypeIndex = Int(index) + 1
        let returnType = String(declarationLine[returnTypeIndex])

        let returnValue: String

        if returnType.first == "[" {
            returnValue = "[]"
        } else if returnType.last == "?" {
            returnValue = "nil"
        } else if returnType == "Int" || returnType == "Double" {
            returnValue = "0"
        } else if returnType == "String" {
            returnValue = "\"\""
        } else if returnType == "Bool" {
            returnValue = "false"
        } else {
            returnValue = "fatalError()"
        }

        var c = code.split(separator: "\n").map { String($0) }
        c[c.count - 3] = "\t\t\(returnValue)"

        let newCode = c.joined(separator: "\n")

        var copy = self
        copy.code = newCode
        return copy
    }
}

extension GraphqlQuestionDetail {
    var validFunctionTitle: String {
        let raw = title!
            .filter { $0.isLetter || $0.isNumber }

        if raw.first!.isNumber {
            return "_\(raw)"
        }

        return raw
    }

    var fileName: String {
        let fileName = "\(title!.removingPercentEncoding!).swift"

        if let questionFrontendID {
            return questionFrontendID
                .appending(" - ")
                .appending(fileName)
        }

        return fileName
    }

    var swiftEnabled: Bool {
        codeSnippets?.contains(where: { $0.langSlug == "swift" }) ?? false
    }

    var swiftCodeSnippet: GraphqlQuestionCodeSnippet {
        codeSnippets!.first(where: { $0.langSlug == "swift" })!
    }

    var isBasicSolution: Bool {
        swiftCodeSnippet.code.contains("class Solution") &&
            !swiftCodeSnippet.code.contains("init(")
    }
}
