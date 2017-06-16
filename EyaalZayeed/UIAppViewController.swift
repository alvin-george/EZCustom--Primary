//
//  UIAppViewController.swift
//  EyaalZayeed
//
//  Created by apple on 14/06/17.
//  Copyright © 2017 apple. All rights reserved.
//

import UIKit
import Foundation

class UIAppViewController: UIViewController {
    
    var appUIColor_First:UIColor = UIColor(rgb: 0x3F51B5)
    var appUIColor_Second:UIColor = UIColor(rgb: 0x303F9F)
    var appUIColor_Third:UIColor =  UIColor(rgb: 0xFF4081)
    var appUIColor_Four:UIColor =  UIColor(rgb: 0xFF7600)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //addStatusBar()
        
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
    func addStatusBar()
    {
        let view = UIView(frame:
            CGRect(x: 0.0, y: 0.0, width: UIScreen.main.bounds.size.width, height: 20.0)
        )
        view.backgroundColor = appUIColor_First
        self.view.addSubview(view)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
