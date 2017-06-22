//
//  StudentSliderMenuController.swift
//  EyaalZayeed
//
//  Created by apple on 16/06/17.
//  Copyright © 2017 apple. All rights reserved.
//

import UIKit

protocol StudentSlideMenuDelegate {
    func slideMenuItemSelectedAtIndex(_ index : Int32)
}

class StudentSliderMenuController: UIViewController, UITableViewDataSource,UITableViewDelegate, UIScrollViewDelegate{
    
    var appUIColor_First:UIColor = UIColor(rgb: 0x3F51B5)
    
    var btnMenu : UIButton!
    var delegate : StudentSlideMenuDelegate?
    
    var arrayMenuOptions = [Dictionary<String,String>]()
    var bottomMenuOptions  = [Dictionary<String,String>]()
    
    var firstName:String?
    var lastName:String?
    var profileImageUrl: String?
    
    @IBOutlet var sliderMenuTableView: UITableView!
    @IBOutlet var btnCloseMenuOverlay : UIButton!
    @IBOutlet var sideMenuButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initialUISetup()
    }
    override func viewWillAppear(_ animated: Bool) {
        initialUISetup()
        updateArrayMenuOptions()
        
    }
    func initialUISetup()
    {
        addStatusBar()
        sideMenuButton.addTarget(self, action: #selector(StudentSliderMenuController.onCloseMenuClick(_:)), for: UIControlEvents.touchUpInside)
        sliderMenuTableView.tableFooterView = UIView()
        
    }
    func addStatusBar()
    {
        let view = UIView(frame:
            CGRect(x: 0.0, y: 0.0, width: UIScreen.main.bounds.size.width, height: 20.0)
        )
        view.backgroundColor = appUIColor_First
        self.view.addSubview(view)
        
    }
    func updateArrayMenuOptions(){
        
        arrayMenuOptions.append(["title":"Study Material", "icon":"study_material"])
        arrayMenuOptions.append(["title":"Contact", "icon":"contact_icon"])
        arrayMenuOptions.append(["title":"Time Table", "icon":"timetable"])
        arrayMenuOptions.append(["title":"Activities", "icon":"activities"])
        arrayMenuOptions.append(["title":"Report Card", "icon":"report_card"])
        arrayMenuOptions.append(["title":"Attendance", "icon":"attendance"])

        
        bottomMenuOptions.append(["title":"Help & Feedback", "icon":"dashboard_icon"])
        bottomMenuOptions.append(["title":"Log Out", "icon":"dashboard_icon"])
        
       // sliderMenuTableView.reloadData()
        
    }
    
    @IBAction func onCloseMenuClick(_ button:UIButton!){
        btnMenu.tag = 0
        
        if (self.delegate != nil) {
            var index = Int32(button.tag)
            if(button == self.btnCloseMenuOverlay){
                index = -1
            }
            delegate?.slideMenuItemSelectedAtIndex(index)
        }
        
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            self.view.frame = CGRect(x: -UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width,height: UIScreen.main.bounds.size.height)
            self.view.layoutIfNeeded()
            self.view.backgroundColor = UIColor.clear
        }, completion: { (finished) -> Void in
            self.view.removeFromSuperview()
            self.removeFromParentViewController()
        })
    }
    
    //SideMenu Table
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section
        {
        case 0:
            return 1
        case 1:
            return arrayMenuOptions.count
        case 2:
            return bottomMenuOptions.count
        default:
            return 3
        }
        
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.frame =  CGRect(x: 0,y: 0,width: self.view.frame.size.width ,height: 1)
        headerView.backgroundColor = UIColor.lightGray
        return headerView
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        switch section
        {
        case 0:
            return CGFloat(0)
        case 1:
            return CGFloat(0)
        case 2:
            return CGFloat(1)
            
        default:
            return CGFloat(1)
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.section
        {
        case 0:
            return 150
        case 1:
            return 50
        case 2:
            return 50
            
        default:
            return 2
        }
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView){
        let verticalIndicator: UIImageView = (scrollView.subviews[(scrollView.subviews.count - 1)] as! UIImageView)
        verticalIndicator.backgroundColor = appUIColor_First
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section
        {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "sideMenuProfileTableCell") as! SideMenuProfileTableCell
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "sliderMenuCell") as! SideMenuTableCell
            cell.menuItemImage.image = UIImage(named: arrayMenuOptions[indexPath.row]["icon"]!)
            cell.menuItemTitle.text = arrayMenuOptions[indexPath.row]["title"]!
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "sliderMenuCell") as! SideMenuTableCell
            cell.menuItemImage.image = UIImage(named: bottomMenuOptions[indexPath.row]["icon"]!)
            cell.menuItemTitle.text = bottomMenuOptions[indexPath.row]["title"]!
            return cell
            
        default:
            let cell = UITableViewCell()
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let btn = UIButton(type: UIButtonType.custom)
        btn.tag = indexPath.row
        
        self.onCloseMenuClick(btn)
        
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
