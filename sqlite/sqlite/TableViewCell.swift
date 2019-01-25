//
//  TableViewCell.swift
//  sqlite
//
//  Created by Yuj-admin-mac02 on 12/12/18.
//  Copyright © 2018 Yuj-admin-mac02. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var tasknamelbl: UILabel!
    
    @IBOutlet weak var taskidlbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
