//
//  UIAppExtensions.swift
//  EyaalZayeed
//
//  Created by apple on 14/06/17.
//  Copyright © 2017 apple. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    var height:CGFloat {
        get {
            return self.frame.size.height
        }
        set {
            self.frame.size.height = newValue
        }
    }
    
    var width:CGFloat {
        get {
            return self.frame.size.width
        }
        set {
            self.frame.size.width = newValue
        }
    }
    
}
extension UIImageView {
    
    func setRounded() {
        let radius = self.frame.width / 2
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
        
        self.layer.borderWidth = 3
        self.layer.borderColor = UIColor.blue.cgColor
        self.clipsToBounds = true
    }
}
extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}
extension UIButton{
    
    func makeRoundedEdge(boarderWidth:CGFloat?, borderColour: UIColor?,cornerRadius:CGFloat?)
    {
        layer.cornerRadius = cornerRadius!
        layer.borderWidth = boarderWidth!
        layer.borderColor = borderColour?.cgColor
    }
    
}
extension UITextField{
    func makeRoundedEdge(boarderWidth:CGFloat?, borderColour: UIColor?,cornerRadius:CGFloat?)
    {
        layer.cornerRadius = cornerRadius!
        layer.borderWidth = boarderWidth!
        layer.borderColor = borderColour?.cgColor
    }
}

