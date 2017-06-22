//
//  StudentDetailTableCell.swift
//  EyaalZayeed
//
//  Created by apple on 20/06/17.
//  Copyright © 2017 apple. All rights reserved.
//

import UIKit

class StudentDetailTableCell: UITableViewCell {

    @IBOutlet weak var leftImage: UIImageView!
    @IBOutlet weak var ItemTextView: EZTextView!
    
    
    @IBOutlet weak var rightImage: UIImageView!
    @IBOutlet weak var rightButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func hideRightImageAndButton()
    {
        rightImage.isHidden =  true
        rightButton.isEnabled =  false
    }
    func showRightImageAndButton()
    {
        rightImage.isHidden =  false
        rightButton.isEnabled =  true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
