//
// Design Twitter
//
// Difficulty: Medium
// https://leetcode.com/problems/design-twitter
//

import HeapModule

class Twitter {

    struct Tweet: Comparable {
        let id: Int
        let time: Int

        static func < (lhs: Tweet, rhs: Tweet) -> Bool {
            lhs.time < rhs.time
        }
    }

    private var userFollowers: [Int: Set<Int>] = [:]
    private var userTweets: [Int: Heap<Tweet>] = [:]
    private var time = 0

    init() {
        
    }
    
    func postTweet(_ userId: Int, _ tweetId: Int) {
        let newTweet = Tweet(id: tweetId, time: time)

        userTweets[userId, default: Heap<Tweet>()].insert(newTweet)

        time += 1
    }
    
    func getNewsFeed(_ userId: Int) -> [Int] {

        var tweetFeeds = (userFollowers[userId] ?? [])
            .compactMap { userTweets[$0] }
        
        tweetFeeds.append(userTweets[userId] ?? [])

        var t: [Int] = []
        var hasTweets: Bool {
            !tweetFeeds.allSatisfy { $0.isEmpty }
        }

         while t.count < 10 && hasTweets {
             var maxI = 0
             
             for i in 0 ..< tweetFeeds.count {
                 if tweetFeeds[i].max?.time ?? Int.min > tweetFeeds[maxI].max?.time ?? Int.min {
                     maxI = i
                 }
             }
             
             let tweet = tweetFeeds[maxI].popMax()
             
             t.append(tweet!.id)
         }

        return t
    }
    
    func follow(_ followerId: Int, _ followeeId: Int) {
        userFollowers[followerId, default: []].insert(followeeId)
    }
    
    func unfollow(_ followerId: Int, _ followeeId: Int) {
        userFollowers[followerId, default: []].remove(followeeId)
    }
}

/**
 * Your Twitter object will be instantiated and called as such:
 * let obj = Twitter()
 * obj.postTweet(userId, tweetId)
 * let ret_2: [Int] = obj.getNewsFeed(userId)
 * obj.follow(followerId, followeeId)
 * obj.unfollow(followerId, followeeId)
 */
/**
 * Your Twitter object will be instantiated and called as such:
 * let obj = Twitter()
 * obj.postTweet(userId, tweetId)
 * let ret_2: [Int] = obj.getNewsFeed(userId)
 * obj.follow(followerId, followeeId)
 * obj.unfollow(followerId, followeeId)
 */

extension Twitter: Testable {

    var problemTitle: String {
        "355 - Design Twitter.swift"
    }

    func test() {
        let twitter = Twitter();
        twitter.postTweet(1, 5); // User 1 posts a new tweet (id = 5).
        var a = twitter.getNewsFeed(1);  // User 1's news feed should return a list with 1 tweet id -> [5]. return [5]
        print(a)
        twitter.follow(1, 2);    // User 1 follows user 2.
        twitter.postTweet(2, 6); // User 2 posts a new tweet (id = 6).
        a = twitter.getNewsFeed(1);  // User 1's news feed should return a list with 2 tweet ids -> [6, 5]. Tweet id 6 should precede tweet id 5 because it is posted after tweet id 5.
        print(a)
        twitter.unfollow(1, 2);  // User 1 unfollows user 2.
        a = twitter.getNewsFeed(1);
        print(a)
    }
}
