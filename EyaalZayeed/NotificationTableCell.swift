//
//  NotificationTableCell.swift
//  EyaalZayeed
//
//  Created by apple on 22/06/17.
//  Copyright © 2017 apple. All rights reserved.
//

import UIKit

class NotificationTableCell: UITableViewCell {

    @IBOutlet weak var notificationBullet: UIImageView!
    @IBOutlet weak var notificationDetailLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
