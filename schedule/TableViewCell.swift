//
//  TableViewCell.swift
//  schedule
//
//  Created by Yuj-admin-mac02 on 10/01/19.
//  Copyright © 2019 Yuj-admin-mac02. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var applbl: UILabel!
    @IBOutlet weak var roomlbl: UILabel!

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
