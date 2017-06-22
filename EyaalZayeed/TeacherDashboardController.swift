//
//  TeacherDashboardController.swift
//  EyaalZayeed
//
//  Created by apple on 14/06/17.
//  Copyright © 2017 apple. All rights reserved.
//

import UIKit

class TeacherDashboardController: UIAppViewController, TeacherSlideMenuDelegate,CircleMenuDelegate {
    
    //circle Menu
    var buttonTitleLabel:UILabel!
    var circleMenuImageNameArray:[String]!
    var circleMenuTitleArray:[String]!
    
    @IBOutlet weak var circleCenterButton: CircleMenu!
    @IBOutlet weak var sideMenuButton: UIButton!
    @IBOutlet weak var teacherNameLabel: EZLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialUISetup()
        updateArrays()
    }
    override func viewWillAppear(_ animated: Bool) {
        initialUISetup()
        updateArrays()
    }
    override func viewDidAppear(_ animated: Bool) {
        self.circleCenterButton.sendActions(for: .touchUpInside)
    }
    func initialUISetup()
    {
        addStatusBar()
        self.automaticallyAdjustsScrollViewInsets = false
        sideMenuButton.addTarget(self, action: #selector(TeacherDashboardController.onSlideMenuButtonPressed(_:)), for: UIControlEvents.touchUpInside)
        
    }
    func updateArrays()
    {
        circleMenuImageNameArray = ["profile","contact","subjects","report","notification","activity","child"]
        circleMenuTitleArray = ["Profile","Contact","Subjects","Report","Notification","Activity","Child"]
        circleCenterButton.buttonsCount = circleMenuImageNameArray.count
        //circleCenterButton.tintColor = appUIColor_First
    }

    func onSlideMenuButtonPressed(_ sender : UIButton){
        
        if (sender.tag == 10)        {
            // To Hide Menu If it already there
            self.slideMenuItemSelectedAtIndex(-1);
            
            sender.tag = 0;
            
            let viewMenuBack : UIView = view.subviews.last!
            
            UIView.animate(withDuration: 0.3, animations: { () -> Void in
                var frameMenu : CGRect = viewMenuBack.frame
                frameMenu.origin.x = -1 * UIScreen.main.bounds.size.width
                viewMenuBack.frame = frameMenu
                viewMenuBack.layoutIfNeeded()
                viewMenuBack.backgroundColor = UIColor.clear
            }, completion: { (finished) -> Void in
                viewMenuBack.removeFromSuperview()
            })
            
            return
        }
        
        sender.isEnabled = false
        sender.tag = 10
        
        let menuVC : TeacherSliderMenuController = UIStoryboard(name: STORYBOARD_TYPE.TEACHER_MODULE.rawValue, bundle: nil).instantiateViewController(withIdentifier: "teacherSliderMenuController") as! TeacherSliderMenuController
        menuVC.btnMenu = sender
        menuVC.delegate = self
        self.view.addSubview(menuVC.view)
        self.addChildViewController(menuVC)
        menuVC.view.layoutIfNeeded()
        
        
        menuVC.view.frame=CGRect(x: 0 - UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height);
        
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            menuVC.view.frame=CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height);
            sender.isEnabled = true
        }, completion:nil)
        
    }
    func slideMenuItemSelectedAtIndex(_ index: Int32) {
        // let topViewController : UIViewController = self.navigationController!.topViewController!
        // print("View Controller is : \(topViewController) \n", terminator: "")
        
    }
    // MARK: <CircleMenuDelegate>
    func circleMenu(_ circleMenu: CircleMenu, willDisplay button: UIButton, atIndex: Int) {
        
        circleMenu.buttonsCount =  circleMenuImageNameArray.count
        circleMenu.distance =  Float(self.view.frame.size.width/2 - 10)
        circleMenu.duration = 0.3
        
        button.setBackgroundImage(UIImage(named: circleMenuImageNameArray[atIndex]), for: .normal)
        
        // set highlited image
        let highlightedImage  = UIImage(named: circleMenuImageNameArray[atIndex])?.withRenderingMode(.alwaysTemplate)
        button.setImage(highlightedImage, for: .highlighted)
        
        
        buttonTitleLabel = UILabel(frame: CGRect(x: button.frame.origin.x - button.frame.midX , y: button.frame.origin.y + (button.frame.midX + 10), width: button.frame.size.width * 2, height: button.frame.size.height))
        buttonTitleLabel?.text = circleMenuTitleArray[atIndex]
        buttonTitleLabel?.font = UIFont(name: "Arial", size: 12.0)
        buttonTitleLabel?.textAlignment =  .center
        buttonTitleLabel?.textColor =  UIColor.black
        buttonTitleLabel?.allowsDefaultTighteningForTruncation =  true
        button.addSubview(buttonTitleLabel!)
        
    }
    
    func circleMenu(_ circleMenu: CircleMenu, buttonWillSelected button: UIButton, atIndex: Int) {
        buttonTitleLabel.text = ""
        button.addSubview(buttonTitleLabel!)
        DispatchQueue.main.asyncAfter(deadline: (DispatchTime.now() + DispatchTimeInterval.seconds(Int(1)))){
            
            switch atIndex {
            case 0:
                self.performSegue(withIdentifier: "segueToTeacherProfileController", sender: self)
            case 1:
                self.performSegue(withIdentifier: "segueToTeacherContactController", sender: self)
            case 2:
                self.performSegue(withIdentifier: "segueToTeacherSubjectsController", sender: self)
            case 3:
                self.performSegue(withIdentifier: "segueToTeacherReportController", sender: self)
            case 4:
                self.performSegue(withIdentifier: "segueToTeacherNotificationController", sender: self)
            case 5:
                self.performSegue(withIdentifier: "segueToTeacherActivityController", sender: self)
            case 6:
                self.performSegue(withIdentifier: "segueToTeacherChildController", sender: self)
            default:
                break;
            }

        }
        
    }
    
    func circleMenu(_ circleMenu: CircleMenu, buttonDidSelected button: UIButton, atIndex: Int) {
        print("button did selected: \(atIndex)")
        
        
        
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
