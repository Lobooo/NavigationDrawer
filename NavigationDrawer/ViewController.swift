//
//  ViewController.swift
//  NavigationDrawer-Swift
//
//  Created by Nishan on 9/9/17.
//  Copyright © 2016 Nishan. All rights reserved.
//

import UIKit

class ViewController: UIViewController  {
    @IBOutlet var button: HamburgerButton!
    
    var navigationDrawer:NavigationDrawer!
    let menuItem = ["Home","Favourites","Recommended","Feedback","Settings"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.button.addTarget(self, action: #selector(ViewController.showDrawer), for:.touchUpInside)
        self.button.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        
        self.title = "Navigation Drawer"

        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
        let options = NavigationDrawerOptions()
        options.navigationDrawerType = .rightDrawer
        options.navigationDrawerOpenDirection = .anyWhere
        options.navigationDrawerYPosition = 64
       
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DrawerViewController") as! DrawerViewController
        navigationDrawer = NavigationDrawer.sharedInstance
        navigationDrawer.setup(withOptions: options,button: button)
        navigationDrawer.setNavigationDrawerController(vc)
        
    }
    func toggle(_ sender: AnyObject!) {
        self.button.showsMenu = !self.button.showsMenu
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        NavigationDrawer.sharedInstance.initialize(forViewController: self)
        
    }
    
    func showDrawer()
    {
        NavigationDrawer.sharedInstance.toggleNavigationDrawer(nil)
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
      
}

