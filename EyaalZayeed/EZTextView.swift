//
//  EZTextView.swift
//  EyaalZayeed
//
//  Created by apple on 20/06/17.
//  Copyright © 2017 apple. All rights reserved.
//

import Foundation
import UIKit

class EZTextView: UITextView, UITextViewDelegate {
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        changeFontName()
        
        delegate =  self
        enablesReturnKeyAutomatically = true
        
    }
    func changeFontName()
    {
        self.font = UIFont(name: "Roboto", size: (self.font?.pointSize)!)
    }
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if (text == "\n") {
            resignFirstResponder()
            //endEditing(true)
            return false
        }
        return true
    }
    
    
}
