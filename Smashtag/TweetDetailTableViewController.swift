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
    let router = Router()
        
        
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel?.sectionCount ?? 0
    }
 
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.rowCount(section: section) ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return viewModel?.cellInstance(tableView,indexPath: indexPath) ?? UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel?.sectionName(section: section)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel?.heightForRow(indexPath: indexPath) ?? UITableViewAutomaticDimension
    }
    
}

extension TweetDetailTableViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        

        
        
        guard let cellData: CellRepresentable = viewModel?.viewModelForIndexPath(tableView, indexPath: indexPath) else { return }
        let dataType: DataType = cellData.dataType
        
        
        switch dataType {
        case .hashtag, .userMention:
            router.presentMainSearch(with: cellData.text, from: self)
        case .image:
            let cell = tableView.cellForRow(at: indexPath)
            if let imageViewCell = cell as? ImageTableViewCell,
               let image = imageViewCell.imageViewOfCell.image {
                router.presentImageView(with: image, from: self)
            }
        case .url:
            router.presentWebPage(with: cellData.text, from: self)
        }
        
    
    }
}





