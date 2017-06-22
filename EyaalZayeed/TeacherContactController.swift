//
//  TeacherContactController.swift
//  EyaalZayeed
//
//  Created by apple on 14/06/17.
//  Copyright © 2017 apple. All rights reserved.
//

import UIKit

class TeacherContactController: UIAppViewController, UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var searchImage: UIImageView!
    @IBOutlet weak var searchButton: UIButton!
    
    @IBOutlet weak var chatSectionTitle: EZLabel!
    @IBOutlet weak var chatSearchbar: EZSearchBar!
    
    @IBOutlet weak var chatTableView: UITableView!
    
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
        hideSearchbar()
        self.automaticallyAdjustsScrollViewInsets =  false
        
        searchButton.addTarget(self, action:#selector(StudentContactController.searchButtonTapped(_:)), for: .touchUpInside)
        
    }
    func hideSearchbar()
    {
        
        UIView.animate(withDuration: 1.5, delay: 0.05 , usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [], animations: {
            
            self.chatSectionTitle.isHidden =  false
            self.searchImage.isHidden =  false
            self.searchButton.isHidden = false
            self.chatSearchbar.isHidden =  true
            
        }, completion: nil)
        
    }
    func showsearchBar()
    {
        UIView.animate(withDuration: 1.5, delay: 0.05
            , usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [], animations: {
                
                self.chatSectionTitle.isHidden =  true
                self.searchImage.isHidden =  true
                self.searchButton.isHidden = true
                self.chatSearchbar.isHidden =  false
                
        }, completion: nil)
        
    }
    //SignUp TableView
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 12
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "contactChatTableCell")! as! ContactChatTableCell
        
        return cell
        
    }
    
    
    //Search bar delegate
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        searchBar.resignFirstResponder()
        hideSearchbar()
        
    }
    @IBAction func searchButtonTapped(_ sender: UIButton) {
        
        showsearchBar()
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
