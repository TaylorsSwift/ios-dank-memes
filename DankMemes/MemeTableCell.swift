//
//  MemeTableCell.swift
//  DankMemes
//
//  Created by Taylor Caldwell on 6/11/15.
//  Copyright (c) 2015 Rithms. All rights reserved.
//

import UIKit

class MemeTableCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setText(topText: String, bottomText: String) {
        self.textLabel?.text = "\(topText) \(bottomText)"
    }

}
