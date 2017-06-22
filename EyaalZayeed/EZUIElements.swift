//
//  EZUIElements.swift
//  EyaalZayeed
//
//  Created by apple on 20/06/17.
//  Copyright © 2017 apple. All rights reserved.
//

import Foundation
import UIKit

var appUIColor_First:UIColor = UIColor(rgb: 0x3F51B5)
var appUIColor_Second:UIColor = UIColor(rgb: 0x303F9F)
var appUIColor_Third:UIColor =  UIColor(rgb: 0xFF4081)
var appUIColor_Four:UIColor =  UIColor(rgb: 0xFF7600)

class EZTabBar: UITabBar {
    
    // var customTabbarItem = EZTabBarItem(coder: <#NSCoder#>)
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
        backgroundColor =  appUIColor_First
        barTintColor =  appUIColor_First
        
        unselectedItemTintColor =  UIColor.lightGray
        tintColor = UIColor.white
        
        
    }
    required override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    func tabBar(_ tabBar: UITabBar, willBeginCustomizing items: [UITabBarItem]){
        
    }
    
}

class EZTabBarItem: UITabBarItem {
    
    override init() {
        super.init()
        
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0)
    }
}


class EZSearchBar: UISearchBar {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
        change(textFont: UIFont(name: "Roboto", size: 15))
        tintColor =  UIColor.white
        textColor = UIColor.white
        setPlaceholderTextColorTo(color: .white)
        setMagnifyingGlassColorTo(color: .white)
    
        
    }
        
    override func draw(_ rect: CGRect) {
        // Drawing code
        
        
    }
    
}

