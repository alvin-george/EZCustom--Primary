//
//  SignupNowTableCell.swift
//  EyaalZayeed
//
//  Created by apple on 14/06/17.
//  Copyright © 2017 apple. All rights reserved.
//

import UIKit

class SignupNowTableCell: UITableViewCell {

    @IBOutlet weak var termsButton: UIButton!
    @IBOutlet weak var termsImageview: UIImageView!
    @IBOutlet weak var signupNowButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        signupNowButton.makeRoundedEdge(boarderWidth: 1.0, borderColour: UIColor.clear , cornerRadius: 5.0)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
