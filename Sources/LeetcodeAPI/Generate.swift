import Foundation
import RegexBuilder

// TODO: look at transitioning to swift-syntax
// TODO: make function searching more generic

func createFile(with contents: String, at url: URL) async {
    try! Data(contents.utf8).write(to: url)
}

func fileExists(at path: String) -> Bool {
    FileManager.default.fileExists(atPath: path)
}

func generateQuestionFile(with question: GraphqlQuestionDetail, override: Bool = false) async {
    
    let generateFilePath = #filePath

    let newFilePath = URL(fileURLWithPath: generateFilePath)
        .deletingLastPathComponent()
        .deletingLastPathComponent()
        .appending(path: "swift-leetcode-playground")
        .appending(path: "Problems")
        .appending(path: question.fileName)

    if fileExists(at: newFilePath.path(percentEncoded: false)) && !override {
        return
    }
    
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
            question.swiftCodeSnippet
                .withReturnSolution()
                .withRenamedInputFunction()
                .withNamedSolution(questionName: question.validFunctionTitle)
                .withTestable(questionName: question.validFunctionTitle, fileName: question.fileName)
                .code
        )
    fileLines.append("")

    let fileContents = fileLines.joined(separator: "\n")

    await createFile(with: fileContents, at: newFilePath)
}

extension GraphqlQuestionCodeSnippet {
    
    func withNamedSolution(questionName: String) -> Self {
        var copy = self
        copy.code = code.replacingOccurrences(of: "class Solution", with: "struct \(questionName)")
        return copy
    }

    func withReturnSolution() -> Self {
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
    
    func withRenamedInputFunction() -> Self {
        
        var splitCode = code.split(separator: "\n")
        var declarationLine = splitCode[splitCode.count - 4]
        
        let funcRegexPattern = #"func (?<name>.*)\(.*"#
        let regex = try! Regex(funcRegexPattern)
        
        if let match = declarationLine.firstMatch(of: regex) {
            declarationLine.replace(match[1].value as! Substring, with: "input")
        }
        
        splitCode[splitCode.count - 4] = declarationLine
        
        let newCode = splitCode.joined(separator: "\n")
        
        var copy = self
        copy.code = newCode
        return copy
    }
    
    func withTestable(questionName: String, fileName: String) -> Self {
        let testFunction = """
        \n
        extension \(questionName): Testable {
        
            var problemTitle: String {
                \"\(fileName)\"
            }
        
            func test() {
        
            }
        }
        """
        
        var copy = self
        copy.code = code.appending(testFunction)
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
    
    // TODO: basic problems that use ListNode lay out the definition which includes an "init()", find better solution
    var isBasicSolution: Bool {
        swiftCodeSnippet.code.contains("class Solution") &&
            !swiftCodeSnippet.code.contains("init(")
    }

    var isSwiftEnabled: Bool {
        codeSnippets?.contains(where: { $0.langSlug == "swift" }) ?? false
    }

    var swiftCodeSnippet: GraphqlQuestionCodeSnippet {
        codeSnippets!.first(where: { $0.langSlug == "swift" })!
    }
}
