//
//  SignupController.swift
//  EyaalZayeed
//
//  Created by apple on 14/06/17.
//  Copyright © 2017 apple. All rights reserved.
//

import UIKit


class SignupController: UIAppViewController,UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var signupTableView: UITableView!
    
    var leftImages:[String]?
    var textFieldPlaceholders :[String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialUISetup()
        updateData()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        initialUISetup()
        updateData()
    }
    func initialUISetup()
    {
        
        self.automaticallyAdjustsScrollViewInsets =  false
        self.navigationController?.navigationBar.isHidden =  true
        
    }
    func updateData()
    {
        leftImages = ["user_black","email","password","mobile","civil_ID"]
        textFieldPlaceholders = ["Username","Email","Password","Mobile No","Civil ID"]
    }
    //SignUp TableView
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        
        switch indexPath.section {
        case 0:
            return 50
        case 1:
            return 50
        case 2:
            return 168
        default:
            return 1
        }
        
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return 5
        case 1:
            return 1
        case 2:
            return 1
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        switch indexPath.section {
        case 0:
            var cell = tableView.dequeueReusableCell(withIdentifier: "signupFormTableCell")! as! SignupFormTableCell
            cell.formTextField.delegate = self
            cell.formTextField.leftImage = UIImage(named: (leftImages?[indexPath.row])!)
            cell.formTextField.attributedPlaceholder = NSAttributedString(string: (textFieldPlaceholders?[indexPath.row])!,
                                                                          attributes: [NSForegroundColorAttributeName: UIColor.lightGray])
            
            return cell
        case 1:
            var cell = tableView.dequeueReusableCell(withIdentifier: "signupFormTableCell")! as! SignupFormTableCell
            cell.formTextField.delegate = self
            
            cell.formTextField.leftImage = UIImage(named: "state")
            cell.formTextField.rightImage =  UIImage(named: "bottom_arrow")
            
            return cell
        case 2:
            var cell = tableView.dequeueReusableCell(withIdentifier: "signupNowTableCell")! as! SignupNowTableCell
            
            
            
            cell.signupNowButton.addTarget(self, action:#selector(SignupController.signupButtonClicked(_:)), for: .touchUpInside)
            
            return cell
        default:
            let cell: UITableViewCell =  UITableViewCell()
            return cell
        }
        
    }
    
    //TextField Delegates
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        print(textField.tag)
        
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        return true
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true;
    }
    func signupButtonClicked(_ sender: UIButton)
    {
        
        //perform API Call
        
    }
    @IBAction func backButtonTapped(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
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
