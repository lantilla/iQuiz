//
//  TableViewCell.swift
//  iQuiz
//
//  Created by Lauren Antilla on 11/8/17.
//  Copyright © 2017 Lauren Antilla. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // Customize imageView like you need
        self.imageView?.frame.size.width = 20
        self.imageView?.frame.size.height = 20
        self.imageView?.contentMode = UIViewContentMode.scaleAspectFit
    }
}
