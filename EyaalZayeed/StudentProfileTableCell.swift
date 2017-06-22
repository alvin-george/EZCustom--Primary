//
//  StudentProfileTableCell.swift
//  EyaalZayeed
//
//  Created by apple on 20/06/17.
//  Copyright © 2017 apple. All rights reserved.
//

import UIKit

class StudentProfileTableCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileNameLabel: EZLabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
