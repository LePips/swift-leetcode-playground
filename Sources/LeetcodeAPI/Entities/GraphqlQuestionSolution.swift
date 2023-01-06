// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation

public struct GraphqlQuestionSolution: Codable {
    /// Example: "7"
    public var id: String
    public var canSeeDetail: Bool
    public var typename: AnyJSON

    public init(id: String, canSeeDetail: Bool, typename: AnyJSON) {
        self.id = id
        self.canSeeDetail = canSeeDetail
        self.typename = typename
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.id = try values.decode(String.self, forKey: "id")
        self.canSeeDetail = try values.decode(Bool.self, forKey: "canSeeDetail")
        self.typename = try values.decode(AnyJSON.self, forKey: "__typename")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(id, forKey: "id")
        try values.encode(canSeeDetail, forKey: "canSeeDetail")
        try values.encode(typename, forKey: "__typename")
    }
}
