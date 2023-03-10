// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation

public struct GraphqlUser: Codable {
    /// Example: "omgitspavel"
    public var username: String?
    public var isCurrentUserPremium: Bool?

    public init(username: String? = nil, isCurrentUserPremium: Bool? = nil) {
        self.username = username
        self.isCurrentUserPremium = isCurrentUserPremium
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.username = try values.decodeIfPresent(String.self, forKey: "username")
        self.isCurrentUserPremium = try values.decodeIfPresent(Bool.self, forKey: "isCurrentUserPremium")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encodeIfPresent(username, forKey: "username")
        try values.encodeIfPresent(isCurrentUserPremium, forKey: "isCurrentUserPremium")
    }
}
