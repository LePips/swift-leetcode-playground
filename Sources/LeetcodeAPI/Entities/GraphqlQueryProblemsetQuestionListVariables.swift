// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation

public struct GraphqlQueryProblemsetQuestionListVariables: Codable {
    /// Example: ""
    public var categorySlug: String?
    /// Example: 50
    public var limit: Int?
    public var skip: Int?
    public var filters: GraphqlQueryProblemsetQuestionListVariablesFilterInput?

    public init(
        categorySlug: String? = nil,
        limit: Int? = nil,
        skip: Int? = nil,
        filters: GraphqlQueryProblemsetQuestionListVariablesFilterInput? = nil
    ) {
        self.categorySlug = categorySlug
        self.limit = limit
        self.skip = skip
        self.filters = filters
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.categorySlug = try values.decodeIfPresent(String.self, forKey: "categorySlug")
        self.limit = try values.decodeIfPresent(Int.self, forKey: "limit")
        self.skip = try values.decodeIfPresent(Int.self, forKey: "skip")
        self.filters = try values.decodeIfPresent(GraphqlQueryProblemsetQuestionListVariablesFilterInput.self, forKey: "filters")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(categorySlug, forKey: "categorySlug")
        try values.encodeIfPresent(limit, forKey: "limit")
        try values.encodeIfPresent(skip, forKey: "skip")
        try values.encodeIfPresent(filters, forKey: "filters")
    }
}
