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


struct TweetDetailViewModel {
    
    private let tweet: Twitter.Tweet?
    var sections: [Section]
    
    init(with tweet: Twitter.Tweet) {
        self.tweet = tweet
        self.sections = [Section]()
        
        let images = tweet.media.map{ media -> ImageCellViewModel in
            let aspectRatio = media.aspectRatio
            return ImageCellViewModel(url: media.url, aspectRatio: aspectRatio)
        }
        let hashtags = tweet.hashtags.map{ return TextCellViewModel(text: $0.keyword)}
        let urls = tweet.urls.map{ return TextCellViewModel(text: $0.keyword)}
        let users = tweet.userMentions.map{ return TextCellViewModel(text: $0.keyword)}
        
        if !images.isEmpty{
            sections.append(Section(name: "Images", viewModels: images))
        }
        if !hashtags.isEmpty{
            sections.append(Section(name: "Hashtags", viewModels: hashtags))
        }
        if !urls.isEmpty{
            sections.append(Section(name: "URLs", viewModels: urls))
        }
        if !users.isEmpty{
            sections.append(Section(name: "Users", viewModels: users))
        }
        
        
    }
    
    var sectionCount: Int {
        return sections.count
    }
    
    func rowCount(section: Int) -> Int? {
        return sections[section].viewModels.count
    }
    
    func heightForRow(indexPath: IndexPath) -> CGFloat {
        let section = indexPath.section
        let row = indexPath.row
        return sections[section].viewModels[row].cellHeight
    }
    
    func sectionName(section: Int) -> String {
        return sections[section].name
    }
    
    func cellInstance(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let section = indexPath.section
        let row = indexPath.row
        let cell = sections[section].viewModels[row].cellInstance(tableView, indexPath: indexPath)
        return cell
    }
    
    
    
}




struct TextCellViewModel: CellRepresentable {
    var text: String
    
    var cellHeight: CGFloat {
        return Constants.standardCellHeight
    }
    func cellInstance(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TextCell", for: indexPath)
        cell.textLabel?.text = text
        return cell
    }
}

extension TextCellViewModel {
    var url : URL {
        return URL(string: "")!
    }
}


struct ImageCellViewModel: CellRepresentable {
    var url: URL
    var aspectRatio: Double
    
    var cellHeight: CGFloat {
        return CGFloat(359/aspectRatio)
    }
    
    func cellInstance(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let imageCell = tableView.dequeueReusableCell(withIdentifier: "ImageCell", for: indexPath)
        if let cellU = imageCell as? ImageTableViewCell{
            let imageLoader = ImageLoader()
            imageLoader.downloadImage(url: self.url, onCompletion: { imageData in
                DispatchQueue.main.async {
                    cellU.imageViewOfCell.image = UIImage(data: imageData)
                }
            })
        }
        return imageCell
    }
}

extension ImageCellViewModel {
    var text : String {
        return ""
    }
}








