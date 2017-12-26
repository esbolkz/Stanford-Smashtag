//
//  TweetDetailViewModel.swift
//  Smashtag
//
//  Created by Yesbol Kulanbekov on 12/26/17.
//  Copyright © 2017 Stanford University. All rights reserved.
//

import Foundation
import UIKit
import Twitter



struct TweetDetailViewModel: CellDataSource {
    
    private let tweet: Twitter.Tweet?
    
    init(with tweet: Twitter.Tweet) {
        self.tweet = tweet
    }
    
    
    var mentions: [[String]]{
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
    
    var image: UIImage? {
        get {
            
            if let medias = tweet?.media {
                if !(medias.isEmpty){
                    if let imageData = try? Data(contentsOf: medias[0].url) {
                        return UIImage(data: imageData)!
                    }
                }

            }
            
            
            return nil
        }
    }
    
    
    var images: [UIImage] {
        var imageTemp = [UIImage]()
        if let medias = tweet?.media {
            for media in medias {
                if let imageData = try? Data(contentsOf: media.url) {
                    imageTemp.append(UIImage(data: imageData)!)
                }
            }
        }
        return imageTemp

        
    }
    
    

    
    
}
