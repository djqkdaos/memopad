//
//  TableViewCell.swift
//  To-Do-List-Work
//
//  Created by D7703_21 on 2017. 6. 26..
//  Copyright © 2017년 DIT Apps. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var textlabel: UILabel!
    @IBOutlet weak var detaillabel: UILabel!
    @IBOutlet weak var contentlabel: UILabel!
    @IBOutlet weak var myimg: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
