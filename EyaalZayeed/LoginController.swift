//
//  LoginController.swift
//  EyaalZayeed
//
//  Created by apple on 13/06/17.
//  Copyright © 2017 apple. All rights reserved.
//

import UIKit
import Foundation

class LoginController: UIAppViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var loginTableview: UITableView!
    
    var selectedUserModule:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialUISetup()
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        initialUISetup()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        //   present(UIStoryboard(name: "StudentModule", bundle: nil).instantiateViewController(withIdentifier: "studentSubjectsController") as UIViewController, animated: true, completion: nil)
        
        //  present(UIStoryboard(name: "StudentModule", bundle: nil).instantiateViewController(withIdentifier: "studentDashBoardController") as UIViewController, animated: true, completion: nil)
        
    }
    func initialUISetup()
    {
        self.automaticallyAdjustsScrollViewInsets =  false
        self.navigationController?.navigationBar.isHidden =  true
        
    }
    
    //Login TableView
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if (indexPath.row == 0)
        {
            return 190  }
            
        else
        {
            if (selectedUserModule != nil)
            {
                switch selectedUserModule {
                case USER_TYPE.STUDENT_MODULE.rawValue:
                    return 195
                case USER_TYPE.TEACHER_MODULE.rawValue:
                    return 195
                case USER_TYPE.PARENT_MODULE.rawValue:
                    return 250
                default:
                    return 190
                }
            }
            else { return 190  }
            
            return 190
            
        }
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (indexPath.row == 0)
        {
            var cell = tableView.dequeueReusableCell(withIdentifier: "loginModulesTableCell")! as! LoginModulesTableCell
            
            return cell
        }
        else
        {
            var cell = tableView.dequeueReusableCell(withIdentifier: "loginCredentialsTableCell")! as! LoginCredentialsTableCell
            
            cell.signupButton.addTarget(self, action:#selector(LoginController.signupButtonClicked(_:)), for: .touchUpInside)
            
            cell.loginButton.addTarget(self, action:#selector(LoginController.loginButtonClicked(_:)), for: .touchUpInside)
            
            
            return cell
        }
        
    }
    func signupButtonClicked(_ sender: UIButton)
    {
        self.performSegue(withIdentifier: "segueToSignupController", sender: self)
        
    }
    func loginButtonClicked(_ sender: UIButton)
    {
        if (selectedUserModule != nil)
        {
        
        switch selectedUserModule {
            
        case USER_TYPE.STUDENT_MODULE.rawValue:
            present(UIStoryboard(name: STORYBOARD_TYPE.STUDENT_MODULE.rawValue, bundle: nil).instantiateViewController(withIdentifier: "studentDashBoardController") as UIViewController, animated: true, completion: nil)
        case USER_TYPE.TEACHER_MODULE.rawValue:
            present(UIStoryboard(name: STORYBOARD_TYPE.TEACHER_MODULE.rawValue, bundle: nil).instantiateViewController(withIdentifier: "teacherDashboardController") as UIViewController, animated: true, completion: nil)
        case USER_TYPE.PARENT_MODULE.rawValue:
            present(UIStoryboard(name: STORYBOARD_TYPE.PARENT_MODULE.rawValue, bundle: nil).instantiateViewController(withIdentifier: "parentDashboardController") as UIViewController, animated: true, completion: nil)
        default:
            break
        }
        }
        
    }
    @IBAction func userModuleSelected(_ sender: UIButton) {
        
        print(sender.tag)
        
        switch sender.tag {
        case 0:
            highlightStudentModule()
        case 1:
            highlightTeacherModule()
        case 2:
            highlightParentModule()
        default:
            break
        }
        self.loginTableview.reloadData()
        
        print("selcted Moduele  : \(selectedUserModule)")
        
    }
    func highlightStudentModule()
    {
        selectedUserModule = USER_TYPE.STUDENT_MODULE.rawValue
        
    }
    func highlightTeacherModule(){
        
        selectedUserModule = USER_TYPE.TEACHER_MODULE.rawValue
        
    }
    func highlightParentModule() {
        
        selectedUserModule =  USER_TYPE.PARENT_MODULE.rawValue
        
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
