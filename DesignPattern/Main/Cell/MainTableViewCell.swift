//
//  MainTableViewCell.swift
//  DesignPattern
//
//  Created by Trịnh Giang Đông on 4/6/20.
//  Copyright © 2020 Trịnh Giang Đông. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell, NibReusable {
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setContentForCell(by pattern: DesignPattern) {
        titleLabel.text = pattern.rawValue
    }
}
