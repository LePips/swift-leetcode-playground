// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation

public struct GraphqlQuestionTopicTag: Codable {
    /// Example: "Array"
    public var name: String
    /// Example: "array"
    public var slug: String
    public var translatedName: String?
    public var typename: AnyJSON?

    public init(name: String, slug: String, translatedName: String? = nil, typename: AnyJSON? = nil) {
        self.name = name
        self.slug = slug
        self.translatedName = translatedName
        self.typename = typename
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.name = try values.decode(String.self, forKey: "name")
        self.slug = try values.decode(String.self, forKey: "slug")
        self.translatedName = try values.decodeIfPresent(String.self, forKey: "translatedName")
        self.typename = try values.decodeIfPresent(AnyJSON.self, forKey: "__typename")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(name, forKey: "name")
        try values.encode(slug, forKey: "slug")
        try values.encodeIfPresent(translatedName, forKey: "translatedName")
        try values.encodeIfPresent(typename, forKey: "__typename")
    }
}
