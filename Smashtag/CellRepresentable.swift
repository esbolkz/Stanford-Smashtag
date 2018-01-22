//
//  CellRepresentable.swift
//  Smashtag
//
//  Created by Yesbol Kulanbekov on 12/27/17.
//  Copyright © 2017 Stanford University. All rights reserved.
//

import Foundation
import UIKit


protocol CellRepresentable {
    var text : String { get  }
    var url : URL { get }
    var cellHeight: CGFloat { get }
    var dataType: DataType { get }
    var aspectRatio: Double { get }
    func cellInstance(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell
}


extension CellRepresentable {
    var url : URL {
        return URL(string: "")!
    }
    
    var text : String {
        return ""
    }
    
    var aspectRatio: Double {
        return 0
    }
}





enum DataType {
    case url, hashtag, userMention, image
}
