//
//  ParentProfileController.swift
//  EyaalZayeed
//
//  Created by apple on 14/06/17.
//  Copyright © 2017 apple. All rights reserved.
//

import UIKit

class ParentProfileController: UIAppViewController {

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
