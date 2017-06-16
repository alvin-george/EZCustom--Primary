//
//  SubjectsHeaderTableCell.swift
//  EyaalZayeed
//
//  Created by apple on 13/06/17.
//  Copyright © 2017 apple. All rights reserved.
//

import UIKit

class SubjectsHeaderTableCell: UITableViewCell {
    
    @IBOutlet weak var subjectTitleLabel: UILabel!
    @IBOutlet weak var expandCollapseImageView: UIImageView!
        @IBOutlet weak var subjectImageView: UIImageView!
    
    @IBOutlet weak var NoOfChaptersLabel: UILabel!
    @IBOutlet weak var headerCellButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
