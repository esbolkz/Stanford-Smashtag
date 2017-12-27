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



struct TweetDetailViewModel: CellRepresentable {
    
    private let tweet: Twitter.Tweet?
    
    init(with tweet: Twitter.Tweet) {
        self.tweet = tweet
    }
    
    var sectionCount: Int{
        return mentions.count + 1
    }
    
    
    func rowCount(section: Int) -> Int? {
        if let tableSection = Section(rawValue: section){
            switch tableSection {
            case .image:
                return images.count
            case .hashtag, .url, .userMention:
                return mentions[section - 1].count
            }
        }
        return nil
    }
    
    
    func cellInstance(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let section = indexPath.section
        let row = indexPath.row
        if let tableSection = Section(rawValue: section){
            switch tableSection {
            case .image:
                let imageCell = tableView.dequeueReusableCell(withIdentifier: "ImageCell", for: indexPath)
                if let cellU = imageCell as? ImageTableViewCell{
                    cellU.imageViewOfCell.image = images[row]
                    return cellU
                }
            case .hashtag, .url, .userMention:
                let cell = tableView.dequeueReusableCell(withIdentifier: "TextCell", for: indexPath)
                cell.textLabel?.text = mentions[section - 1][row] + " S: \(section) R: \(row)"
                return cell
            }
        }
        
        return UITableViewCell()
        
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

protocol CellRepresentable{
    func cellInstance(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell
}


enum Section: Int {
    case image = 0,hashtag,url,userMention
}


