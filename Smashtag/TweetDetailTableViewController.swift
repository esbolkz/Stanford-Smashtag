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
        return (viewModel?.data.count)!
    }
 
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (viewModel?.data[section].count)!
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TextCell", for: indexPath)
        cell.textLabel?.text = viewModel?.data[indexPath.section][indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Heeloo"
    }
    



}
