// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get

public extension Paths.API.Problems {
    func topic(_ topic: String) -> WithTopic {
        WithTopic(path: "\(path)/\(topic)")
    }

    struct WithTopic {
        /// Path: `/api/problems/{topic}`
        public let path: String

        public var get: Request<LeetcodeAPI.Problems> {
            Request(method: "GET", url: path)
        }
    }
}