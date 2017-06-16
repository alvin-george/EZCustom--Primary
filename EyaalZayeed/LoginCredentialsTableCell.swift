//
//  LoginCredentialsTableCell.swift
//  EyaalZayeed
//
//  Created by apple on 14/06/17.
//  Copyright © 2017 apple. All rights reserved.
//

import UIKit

class LoginCredentialsTableCell: UITableViewCell {
    
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var civilIDTextField: EZTextField!
    @IBOutlet weak var passwordTextField: EZTextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        civilIDTextField.leftImage =  UIImage(named :"civil_ID")
        passwordTextField.leftImage =  UIImage(named :"password")

        loginButton.makeRoundedEdge(boarderWidth: 1.0, borderColour: UIColor.clear , cornerRadius: 5.0)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
