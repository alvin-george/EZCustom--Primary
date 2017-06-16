//
//  SubjectsDetailTableCell.swift
//  EyaalZayeed
//
//  Created by apple on 13/06/17.
//  Copyright © 2017 apple. All rights reserved.
//

import UIKit

class SubjectsDetailTableCell: UITableViewCell {

    @IBOutlet weak var chapterTitleLabel: UILabel!
    @IBOutlet weak var chapterDetailTextView: UITextView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
