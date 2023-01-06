// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation

public struct Interpretation: Codable {
    public var interpretID: String
    public var testCase: String

    public init(interpretID: String, testCase: String) {
        self.interpretID = interpretID
        self.testCase = testCase
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.interpretID = try values.decode(String.self, forKey: "interpret_id")
        self.testCase = try values.decode(String.self, forKey: "test_case")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(interpretID, forKey: "interpret_id")
        try values.encode(testCase, forKey: "test_case")
    }
}
