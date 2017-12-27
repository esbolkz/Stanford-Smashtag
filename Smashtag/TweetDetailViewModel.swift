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
    
    var sectionCount: Int {
        return mentions.count + 1//(images.isEmpty ? 0 : 1)
    }
    
    func rowCount(section: Int) -> Int? {
//        if let tableSection = Section(rawValue: section){
//            switch tableSection {
//            case .image:
//                return 1//images.count
//            case .hashtags, .urls, .users:
//                return mentions[tableSection]?.count ?? 0
//            }
//        }
//        return nil
        
        if section == 0{
            return 1
        } else {
            return mentions[Section(rawValue: (section + 1))!]?.count ?? 0
        }
        
        
    }
    
    func sectionName(section: Int) -> String {
//        if let tableSection = Section(rawValue: section){
//            return String(describing: tableSection).capitalized
//        } else {
//            return ""
//        }
        return "\(section + 1)"
    }
    
    
    
    func cellInstance(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let section = indexPath.section
        let row = indexPath.row
//        if let tableSection = Section(rawValue: section){
//            switch tableSection {
//            case .image:
//                let imageCell = tableView.dequeueReusableCell(withIdentifier: "ImageCell", for: indexPath)
//                if let cellU = imageCell as? ImageTableViewCell{
//                    //DispatchQueue.main.async {
//                        cellU.imageViewOfCell.image = UIImage(named: "cat")//self.images[row]
//
//                    //}
//                    return cellU
//                }
//            case .hashtags, .urls, .users:
//                let cell = tableView.dequeueReusableCell(withIdentifier: "TextCell", for: indexPath)
//                cell.textLabel?.text = (mentions[tableSection]?[row])! // + " S: \(section) R: \(row)"
//                //cell.textLabel?.text = " S: \(section) R: \(row)"
//                return cell
//            }
//            
//
//            
//        }
        
        
        if section == 0 {
            let imageCell = tableView.dequeueReusableCell(withIdentifier: "ImageCell", for: indexPath)
            if let cellU = imageCell as? ImageTableViewCell{
                //DispatchQueue.main.async {
                cellU.imageViewOfCell.image = UIImage(named: "cat")//self.images[row]
                
                //}
                return cellU
            }
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TextCell", for: indexPath)
            cell.textLabel?.text = (mentions[Section(rawValue: (section + 1))!]?[row])!
            // + " S: \(section) R: \(row)"
            //cell.textLabel?.text = " S: \(section) R: \(row)"
            return cell
        }
        
        
        
        
        
        
        return UITableViewCell()
        
    }
    
    
    private var mentions: [Section: [String]]{
        get {
            var dictionary = [Section: [String]]()
            
            if let hashtags = tweet?.hashtags.map({ $0.keyword }), !(hashtags.isEmpty){
                dictionary[Section.hashtags] = hashtags
            }
            if let urls = tweet?.urls.map({$0.keyword}), !(urls.isEmpty) {
                dictionary[Section.urls] = urls
            }
            if let userMentions = tweet?.userMentions.map({$0.keyword}), !(userMentions.isEmpty) {
                dictionary[Section.users] = userMentions
            }
            
            return dictionary
        }
    }
    
    
    private var images: [UIImage] {
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




