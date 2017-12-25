//
//  TweetDetailTableViewController.swift
//  Smashtag
//
//  Created by Yesbol Kulanbekov on 12/25/17.
//  Copyright © 2017 Stanford University. All rights reserved.
//

import UIKit

class TweetDetailTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 4
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 2
    }


}
