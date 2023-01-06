// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation

public struct GraphqlQueryGetQuestionDetailVariables: Codable {
    /// Example: "two-sum"
    public var titleSlug: String?

    public init(titleSlug: String? = nil) {
        self.titleSlug = titleSlug
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.titleSlug = try values.decodeIfPresent(String.self, forKey: "titleSlug")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(titleSlug, forKey: "titleSlug")
    }
}