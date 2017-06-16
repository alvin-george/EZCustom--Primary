//
//  StudentSubjectsController.swift
//  EyaalZayeed
//
//  Created by apple on 13/06/17.
//  Copyright © 2017 apple. All rights reserved.
//

import UIKit

class StudentSubjectsController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var subjectsTableView: UITableView!
    
    var topItems = [String]()
    var subItems = [String]()
    var selectedIndexPathSection:Int = -1
    var expandedItemList = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topItems = ["Subject 1","Subject 2","Subject 3","Subject 4","Subject 5"]
        subItems = ["Monday","TuesDay","WednessDay"]

        
    }
    override func viewWillAppear(_ animated: Bool) {
        
        self.addInitialUIChanges()
        self.title = "SUBJECTS"
        
    }
    func addInitialUIChanges()
    {
        self.automaticallyAdjustsScrollViewInsets =  false
        
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return topItems.count
        
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 50
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 100
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return topItems.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if (expandedItemList != nil){
      
        for i in 0..<expandedItemList.count{
            
            if(expandedItemList[i] == section)
            {
                i == expandedItemList.count
                return 0
            }
        }
        }
        else {
            print("expanded item nil")
        }
        return self.subItems.count
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        var headerView =  UIView()
        let headerCell = tableView.dequeueReusableCell(withIdentifier: "subjectsHeaderTableCell") as! SubjectsHeaderTableCell
        headerCell.subjectTitleLabel.text = topItems[section] as String
        headerCell.headerCellButton.tag =  section+100
        headerCell.headerCellButton.addTarget(self, action:#selector(StudentSubjectsController.headerCellButtonTapped(_:)), for: .touchUpInside)
        
        headerView.addSubview(headerCell)
        
        //minimize and maximize image with animation.
        if(expandedItemList.contains(section))
        {
            UIView.animate(withDuration: 0.3, delay: 1.0, usingSpringWithDamping: 5.0, initialSpringVelocity: 5.0, options: UIViewAnimationOptions.transitionCrossDissolve, animations: {
                headerCell.expandCollapseImageView.image =  UIImage(named: "accordion_plus")
            }, completion: nil)
        }
        else{
            
            UIView.animate(withDuration: 0.3, delay: 1.0, usingSpringWithDamping: 5.0, initialSpringVelocity: 5.0, options: UIViewAnimationOptions.transitionCrossDissolve, animations: {
                headerCell.expandCollapseImageView.image =  UIImage(named: "reload_icon")
            }, completion: nil)
        }

        
        return headerView
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "subjectsDetailTableCell") as UITableViewCell? ?? UITableViewCell(style: .default, reuseIdentifier: "subjectsDetailTableCell")
        
        return cell
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    //button tapped on header cell
    func headerCellButtonTapped(_ sender:UIButton)
    {
        print("btn click")
        for  i in 0..<expandedItemList.count {
            
            if(expandedItemList[i] == (sender.tag-100))
            {
                expandedItemList.remove(at: i)
                self.subjectsTableView.reloadData()
                
                return
            }
        }
        selectedIndexPathSection = sender.tag - 100
        expandedItemList.append(selectedIndexPathSection)
        
        
        UIView.animate(withDuration: 0.3, delay: 1.0, options: UIViewAnimationOptions.transitionCrossDissolve , animations: {
            self.subjectsTableView.reloadData()
        }, completion: nil)
        
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
