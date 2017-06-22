//
//  StudentProfileController.swift
//  EyaalZayeed
//
//  Created by apple on 14/06/17.
//  Copyright © 2017 apple. All rights reserved.
//

import UIKit

class StudentProfileController: UIAppViewController, UITableViewDelegate, UITableViewDataSource, UITextViewDelegate {
    
    @IBOutlet weak var studentProfileTableview: UITableView!
    
    var leftImageNames:[String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateArrays()
        self.addInitialUIChanges()
    }
    override func viewWillAppear(_ animated: Bool) {
        self.addInitialUIChanges()
    }
    func addInitialUIChanges()
    {
        self.addStatusBar()
        updateArrays()
        addNotificationForKeyBoard()
        self.automaticallyAdjustsScrollViewInsets =  false
        self.navigationController?.navigationBar.isHidden =  true
        
        studentProfileTableview.height = self.view.frame.size.height + self.view.frame.midX
        
    }
    func updateArrays()
    {
        leftImageNames = ["location","city","zip_code"]
    }
    func addNotificationForKeyBoard()
    {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        if let scrollView = self.view as? UIScrollView {
            // This important!! make scrollView content offset size (then you can set its offset later)
            scrollView.contentSize = scrollView.frame.size
        }
        
        // tap Gesture for hide keyboard
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyBoard))
        view.addGestureRecognizer(tapGesture)
    }
    
    func hideKeyBoard() {
        // No matter which textfield is active. Resign it.
                
        //    textViews.forEach{
        //        textView in textView.resignFirstResponder()
        //    }
    }
    func keyboardWillShow(notification:NSNotification){
        
        print("keyboard will show")
        // content offset should calculate from login button position and keyboard's endframe
        let loginY = (studentProfileTableview?.frame.origin.y)! + (studentProfileTableview?.frame.size.height)!
        let userInfo = notification.userInfo
        let keyboardRect = (userInfo![UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
        var diff = (keyboardRect?.origin.y)! - loginY
        
        if  diff < 0 {
            diff *= -1
            diff += 10 // adjust the gap between keyboard and login button
            if let scrollView = self.view as? UIScrollView {
                scrollView.setContentOffset(CGPoint(x: 0, y: diff), animated: false)
            }
        }
    }

    
    func keyboardWillHide(){
        print("keyboard will hide")
        if let scrollView = self.view as? UIScrollView {
            scrollView.setContentOffset(.zero, animated: false)
        }
    }
    
    
    //SignUp TableView
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        
        switch indexPath.section {
        case 0:
            return self.view.frame.size.height/3
        case 1:
            return 70
        default:
            return 1
        }
        
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return 1
        case 1:
            return 3
            
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        switch indexPath.section {
        case 0:
            var cell = tableView.dequeueReusableCell(withIdentifier: "studentProfileTableCell")! as! StudentProfileTableCell
            
            
            return cell
        case 1:
            var cell = tableView.dequeueReusableCell(withIdentifier: "studentDetailTableCell")! as! StudentDetailTableCell
            cell.ItemTextView.delegate = self
            cell.leftImage.image =  UIImage(named: leftImageNames[indexPath.row])
            
            cell.rightButton.addTarget(self, action:#selector(StudentProfileController.selectCityButtonTapped(_:)), for: .touchUpInside)
            
            switch indexPath.row {
            case 0:
                cell.hideRightImageAndButton()
            case 1:
                cell.showRightImageAndButton()
            case 2:
                cell.hideRightImageAndButton()
            default:
                break
            }
            
            return cell
        default:
            let cell: UITableViewCell =  UITableViewCell()
            return cell
        }
        
    }
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if (text == "\n") {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    func textViewDidBeginEditing(_ textView: UITextView) {
        
        print("textView Tag : \(textView.tag)")
        
        switch textView.tag {
        case 0:
            break;
        case 1:
            //show picker
            break;
        case 3:
            break
        default:
            break;
        }
        
    }
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        
        let txtFieldPosition = textView.convert(textView.bounds.origin, to: studentProfileTableview)
        let indexPath = studentProfileTableview.indexPathForRow(at: txtFieldPosition)
        if indexPath != nil {
            studentProfileTableview.scrollToRow(at: indexPath!, at: .top, animated: true)
        }
        
        return true
        
    }
    
    
    
    
    @IBAction func backButtonTapped(_ sender: Any) {
        
        print("back button")
        
        // self.navigationController?.popViewController(animated: true)
        // _ = navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
        
    }
    @IBAction func selectCityButtonTapped(_ sender: UIButton) {
        
        print("select city")
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
