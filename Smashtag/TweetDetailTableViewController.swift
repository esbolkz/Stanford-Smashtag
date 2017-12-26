//
//  TweetDetailTableViewController.swift
//  Smashtag
//
//  Created by Yesbol Kulanbekov on 12/25/17.
//  Copyright © 2017 Stanford University. All rights reserved.
//

import UIKit

class TweetDetailTableViewController: UITableViewController {

    var viewModel: TweetDetailViewModel? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1 + (viewModel?.mentions.count)!
    }
 
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 1
        }
        return (viewModel?.mentions[section - 1].count)!
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TextCell", for: indexPath)
        
        if indexPath.section == 0 {
            let imageCell = tableView.dequeueReusableCell(withIdentifier: "ImageCell", for: indexPath)
            if let cellU = imageCell as? ImageTableViewCell{
                cellU.imageViewOfCell.image = viewModel?.image
                return cellU
            }
        } else {
            cell.textLabel?.text = viewModel?.mentions[(indexPath.section) - 1][indexPath.row]

        }
        


        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return String(section)
    }
    



}
