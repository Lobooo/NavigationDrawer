//
//  TestViewController.swift
//  NavigationDrawer-Swift
//
//  Created by Nishan on 2/28/16.
//  Copyright © 2016 Nishan. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {
    
    @IBOutlet weak var testLabel: UILabel!
    
    var text:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        testLabel.text = text
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "222", style: UIBarButtonItemStyle.plain, target: self, action: #selector(TestViewController.showDrawer))
        
        NavigationDrawer.sharedInstance.initialize(forViewController: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func showDrawer()
    {
        NavigationDrawer.sharedInstance.toggleNavigationDrawer(nil)
    }

  
}
