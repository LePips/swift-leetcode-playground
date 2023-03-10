// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation

public struct SubmissionID: Codable {
    public var submissionID: Int

    public init(submissionID: Int) {
        self.submissionID = submissionID
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.submissionID = try values.decode(Int.self, forKey: "submission_id")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(submissionID, forKey: "submission_id")
    }
}
