//
//  StudentDashBoardController.swift
//  EyaalZayeed
//
//  Created by apple on 14/06/17.
//  Copyright © 2017 apple. All rights reserved.
//

import UIKit
import Foundation

class StudentDashBoardController: UIAppViewController {
    
    let numberOfThumbs = 7
    var circle: Circle!
    var circleMenuImageArray:[String]!
    var circleMenuTitleArray:[String]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addStatusBar()
        prepareCustomCircleMenu()
        updateArrays()
    }
    override func viewWillAppear(_ animated: Bool) {
        
        updateArrays()
    }
    func updateArrays()
    {
        circleMenuImageArray = ["profile","contact","subjects","report","notification","activity","time_table"]
        circleMenuTitleArray = ["PROFILE","CONTACT","SUBJECTS","REPORTS","NOTIFICATIONS","ACTIVITY","TIME TABLE"]
    }
    func navigateToSubViews(selctedMenuItem:Int)
    {
        switch selctedMenuItem {
        case 0:
            print("")
        default:
            break;
        }
    }
    
    func prepareCustomCircleMenu() {
        circle = Circle(with: CGRect(x: 10, y: 90, width: 300, height: 300), numberOfSegments: numberOfThumbs, ringWidth: 60.0, isRotating: true, iconWidth: 70, iconHeight: 70)
        circle?.dataSource = self
        circle?.delegate = self
        
        let overlay = CircleOverlayView(with: circle)
        circle?.overlayView?.overlayThumb.arcColor = UIColor.clear
        circle?.circleColor = UIColor.clear
        overlay?.userImage?.image =  UIImage(named:"student_round")
        overlay?.userNameLabel?.text = "Sample User 1"
        
        // Customize thumbs
        for (_, thumb) in (circle?.thumbs.enumerated())! {
            let thumb = thumb as! CircleThumb
            
            thumb.iconView.highlightedIconColor = UIColor.clear
            thumb.iconView.isSelected = false
            thumb.iconView.isHidden = false
            thumb.separatorStyle = .none
            thumb.isGradientFill = false
            thumb.arcColor = UIColor.clear
            
            //thumb.backgroundColor =  UIColor.clear
            
            // Add circular border to icon
            thumb.iconView.layer.borderWidth = 1
            thumb.iconView.layer.masksToBounds = false
            thumb.iconView.layer.borderColor = UIColor.white.cgColor
            thumb.iconView.layer.cornerRadius = thumb.iconView.frame.height/2
            //thumb.iconView.layer.backgroundColor = UIColor.clear.cgColor
            thumb.iconView.clipsToBounds = true


        
        }
        
        // Center circle and overlay
        overlay!.center = view.center
        circle?.center = view.center
        
        // Add circle and overlay to view
        self.view.addSubview(circle!)
        self.view.addSubview(overlay!)
    }
    
}


extension StudentDashBoardController: CircleDelegate, CircleDataSource {
    
    func circle(_ circle: Circle, didMoveTo segment: Int, thumb: CircleThumb) {
        thumb.backgroundColor =  UIColor.clear
        thumb.iconView.isHidden =  false
        
        thumb.isHidden =  false
        
        thumb.iconView.image = UIImage(named: circleMenuImageArray[segment] as String)!
        
        circle.overlayView?.menuTitleLabel?.text = circleMenuTitleArray[segment] as String
        
        //        thumb.iconView.isSelected = false
        
        // Rotate selected icon
        UIView.animate(withDuration: 0.2, animations: { () -> Void in
            thumb.iconView.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
        })
        
        UIView.animate(withDuration: 0.2, delay: 0.15, options: UIViewAnimationOptions.curveEaseIn, animations: { () -> Void in
            thumb.iconView.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi * 2))
        }, completion: nil)
    }
    
    func circle(_ circle: Circle, iconForThumbAt row: Int) -> UIImage {
        //        let thumb = circle.thumbs[row] as! CircleThumb
        //        thumb.iconView.isSelected = false
        
        circle.overlayView?.overlayThumb.isHidden =  false
        // thumb.iconView.isHidden = false
        
        return UIImage(named: circleMenuImageArray[row] as String)!
    }
    
}

