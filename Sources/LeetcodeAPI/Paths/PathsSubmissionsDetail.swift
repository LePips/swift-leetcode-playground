// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get

public extension Paths.Submissions {
    var detail: Detail {
        Detail(path: path + "/detail")
    }

    struct Detail {
        /// Path: `/submissions/detail`
        public let path: String
    }
}