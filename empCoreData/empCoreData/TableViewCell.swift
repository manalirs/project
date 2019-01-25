//
//  TableViewCell.swift
//  empCoreData
//
//  Created by Yuj-admin-mac02 on 13/12/18.
//  Copyright © 2018 Yuj-admin-mac02. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var name1: UILabel!
 
    @IBOutlet weak var no1: UILabel!
    
    @IBOutlet weak var salary1: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
      
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
