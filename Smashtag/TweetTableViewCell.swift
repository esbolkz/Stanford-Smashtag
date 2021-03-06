//
//  TweetTableViewCell.swift
//  Smashtag
//
//  Created by CS193p Instructor on 2/8/17.
//  Copyright © 2017 Stanford University. All rights reserved.
//

import UIKit
import Twitter

class TweetTableViewCell: UITableViewCell
{
    // outlets to the UI components in our Custom UITableViewCell
    @IBOutlet weak var tweetProfileImageView: UIImageView!
    @IBOutlet weak var tweetCreatedLabel: UILabel!
    @IBOutlet weak var tweetUserLabel: UILabel!
    @IBOutlet weak var tweetTextLabel: UILabel!
    
    // public API of this UITableViewCell subclass
    // each row in the table has its own instance of this class
    // and each instance will have its own tweet to show
    // as set by this var
    var tweet: Twitter.Tweet? { didSet { updateUI() } }
    
    // whenever our public API tweet is set
    // we just update our outlets using this method
    private func updateUI() {
        tweetUserLabel?.text = tweet?.user.description
        
        
        if let tweetText = tweet?.text {
            let attributedText = NSMutableAttributedString(string: tweetText)
            
            if let hashTags = tweet?.hashtags {
                for hashTag in hashTags {
                    attributedText.addAttribute(NSForegroundColorAttributeName,
                                                value: UIColor.red,
                                                range: hashTag.nsrange)
                }
            }
            
            if let urls = tweet?.urls {
                for url in urls {
                    attributedText.addAttribute(NSForegroundColorAttributeName,
                                                value: UIColor.green,
                                                range: url.nsrange)
                }
            }
            
            if let userMentions = tweet?.userMentions {
                for userMention in userMentions{
                    attributedText.addAttribute(NSForegroundColorAttributeName,
                                                value: UIColor.brown,
                                                range: userMention.nsrange)
                }
            }
            
            
            
            tweetTextLabel?.attributedText = attributedText
        }
        
        
        if let profileImageURL = tweet?.user.profileImageURL {
            
            let imageLoader = ImageLoader()
            imageLoader.downloadImage(url: profileImageURL, onCompletion: { imageData in
                DispatchQueue.main.async {
                    self.tweetProfileImageView?.image = UIImage(data: imageData)
                    
                }
            })
            
        } else {
            tweetProfileImageView?.image = nil
        }
        
        if let created = tweet?.created {
            let formatter = DateFormatter()
            if Date().timeIntervalSince(created) > 24*60*60 {
                formatter.dateStyle = .short
            } else {
                formatter.timeStyle = .short
            }
            tweetCreatedLabel?.text = formatter.string(from: created)
        } else {
            tweetCreatedLabel?.text = nil
        }
    }
}
