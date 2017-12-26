//
//  TweetDetailViewModel.swift
//  Smashtag
//
//  Created by Yesbol Kulanbekov on 12/26/17.
//  Copyright © 2017 Stanford University. All rights reserved.
//

import Foundation
import Twitter

struct TweetDetailViewModel {
    
    var data: [[String]]{
        get {
            var array = [[String]]()
            if let hashtags = tweet?.hashtags.map({ $0.keyword }){
                array.append(hashtags)
            }
            if let urls = tweet?.urls.map({$0.keyword}) {
                array.append(urls)
            }
            if let userMentions = tweet?.userMentions.map({$0.keyword}) {
                array.append(userMentions)
            }
            
            return array
        }
    }
    
    
    var dict: [String: [String]] {
        get {
            return [String: [String]]()
        }
    }
    
    
    private let tweet: Twitter.Tweet?
    
    init(with tweet: Twitter.Tweet) {
        self.tweet = tweet
    }
    
    
}
