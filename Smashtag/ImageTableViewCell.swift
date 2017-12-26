//
//  ImageTableViewCell.swift
//  Smashtag
//
//  Created by Yesbol Kulanbekov on 12/26/17.
//  Copyright © 2017 Stanford University. All rights reserved.
//

import UIKit

class ImageTableViewCell: UITableViewCell {
    @IBOutlet weak var imageViewOfCell: UIImageView!
}

protocol CellDataSource {
    var image: UIImage? { get }
}
