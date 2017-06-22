//
//  StudentActivityController.swift
//  EyaalZayeed
//
//  Created by apple on 14/06/17.
//  Copyright © 2017 apple. All rights reserved.
//

import UIKit

class StudentActivityController: UIAppViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var selectedIndex = Int ()
    
    @IBOutlet weak var activityCollectionView: UICollectionView!
    @IBOutlet weak var selectedDateLabel: EZLabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addInitialUIChanges()
    }
    override func viewWillAppear(_ animated: Bool) {
        self.addInitialUIChanges()
    }
    func addInitialUIChanges()
    {
        self.addStatusBar()
        self.automaticallyAdjustsScrollViewInsets =  false
        
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
    func collectionView(collectionView : UICollectionView,layout collectionViewLayout:UICollectionViewLayout,sizeForItemAtIndexPath indexPath:NSIndexPath) -> CGSize
    {
        var cellSize:CGSize = CGSize(width: 50, height: 60)
        return cellSize
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell: ActivityCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "activityCollectionCell", for: indexPath as IndexPath) as! ActivityCollectionCell
        
        if selectedIndex == indexPath.row
        {
            cell.backgroundColor = appUIColor_Second
            cell.dateLabel.textColor =  UIColor.white
            cell.dayLabel.textColor =  UIColor.white
            cell.monthLabel.textColor =  UIColor.white
            
        }
        else
        {
            cell.backgroundColor = UIColor.white
            cell.dateLabel.textColor =  UIColor.darkGray
            cell.dayLabel.textColor =  UIColor.darkGray
            cell.monthLabel.textColor =  UIColor.darkGray
        }
        
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var cell: ActivityCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "activityCollectionCell", for: indexPath as IndexPath) as! ActivityCollectionCell
        
        selectedIndex = indexPath.row
        
        selectedDateLabel.text =   "\(String(describing: cell.dayLabel.text!)), \(String(describing: cell.dateLabel.text!)) \(String(describing: cell.monthLabel.text!)) 2017"
        
        self.activityCollectionView.reloadData()
        
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        
        // self.navigationController?.popViewController(animated: true)
        // _ = navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
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
