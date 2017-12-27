//
//  CellRepresentable.swift
//  Smashtag
//
//  Created by Yesbol Kulanbekov on 12/27/17.
//  Copyright © 2017 Stanford University. All rights reserved.
//

import Foundation
import UIKit

protocol CellRepresentable{
    func cellInstance(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell
}
