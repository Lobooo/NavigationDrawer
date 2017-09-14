//
//  DrawerViewController.swift
//  NavigationDrawer-Swift
//
//  Created by Nishan on 2/25/16.
//  Copyright © 2016 Nishan. All rights reserved.
//

import UIKit

class DrawerViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    let menuItem = ["Home","Favourites","Recommended","Feedback","Settings"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return menuItem.count
    }
  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        cell?.textLabel?.text = menuItem[indexPath.row]
        
        return cell!
    }
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        NavigationDrawer.sharedInstance.toggleNavigationDrawer { () -> Void in
            
            if indexPath.row != 0
            {
            
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "TestViewController") as! TestViewController
            vc.text = self.menuItem[indexPath.row]
            self.navigationController?.viewControllers = [vc]
            
            }
            else
            {
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController")
                self.navigationController?.viewControllers = [vc!]

            }
        }
    }
        
}

