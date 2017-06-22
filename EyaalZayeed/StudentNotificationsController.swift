//
//  StudentNotificationsController.swift
//  EyaalZayeed
//
//  Created by apple on 14/06/17.
//  Copyright © 2017 apple. All rights reserved.
//

import UIKit

class StudentNotificationsController: UIAppViewController, UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var notificationTableView: UITableView!
    
    var notificationBulletImages:[String]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addInitialUIChanges()
    }
    override func viewWillAppear(_ animated: Bool) {
        self.addInitialUIChanges()
    }
    func addInitialUIChanges()
    {
        updateArrays()
        self.addStatusBar()
        
        self.automaticallyAdjustsScrollViewInsets =  false
        
    }
    func updateArrays()
    {
        notificationBulletImages = ["notification_bullet_first","notification_bullet_second","notification_bullet_third","notification_bullet_fourth"]
    }
    //Notification TableView
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 50
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 12
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "notificationTableCell")! as! NotificationTableCell
        
     
        
        //Image altering at index
        switch indexPath.row%4 {
        case 0:
            cell.notificationBullet.image =  UIImage(named: (notificationBulletImages?[0])!)
        case 1:
            cell.notificationBullet.image =  UIImage(named: (notificationBulletImages?[1])!)
        case 2:
            cell.notificationBullet.image =  UIImage(named: (notificationBulletImages?[2])!)
        case 3:
            cell.notificationBullet.image =  UIImage(named: (notificationBulletImages?[3])!)
        default:
            break;
        }

        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
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
