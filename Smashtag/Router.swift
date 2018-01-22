//
//  Router.swift
//  Smashtag
//
//  Created by Yesbol Kulanbekov on 1/22/18.
//  Copyright © 2018 Stanford University. All rights reserved.
//

import Foundation
import UIKit

struct Router {
    
    func presentMainSearch(with item: String, from vc: UIViewController) {
        
        let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let tweetSearchController = storyBoard.instantiateViewController(withIdentifier: "tweetSearchVC") as! TweetTableViewController
        tweetSearchController.searchText = item
        vc.navigationController?.pushViewController(tweetSearchController, animated: true)
    }
    
    func presentImageView(with image : UIImage, from vc: UIViewController){
        print("Present image view")
        let imageViewController = ImageViewController()
        imageViewController.image = image
        vc.navigationController?.pushViewController(imageViewController, animated: true)
    }
    
    func presentWebPage(with url: String, from vc: UIViewController) {
        print("Present Web Page")
    }
    
}
