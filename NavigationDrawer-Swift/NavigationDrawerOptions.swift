//
//  NavigationDrawerOptions.swift
//  NavigationDrawer-Swift
//
//  Created by Nishan on 2/25/16.
//  Copyright © 2016 Nishan. All rights reserved.
//

import Foundation
import UIKit

//Types of drawer. Left drawer open from Left side of screen whereas Right drawer opens from right side of the screen
enum NavigationDrawerType
{
    case leftDrawer
    case rightDrawer
}

//Modes for opening navigation drawer. Default is Anywhere, i.e anywhere can be swiped to open navigation drawer. For Left Drawer Type , RightEdge is overridden by LeftEdge. For Right Drawer Type , LeftEdge is overridden by RighEdge
enum NavigationDrawerOpenDirection
{
    case anyWhere
    case leftEdge
    case rightEdge
}

class NavigationDrawerOptions
{
    
    //Public variables
    
    //MARK: Anchor View properties
    
    var anchorView:UIView?
    fileprivate var anchorViewHeight:CGFloat!
    fileprivate var anchorViewWidth:CGFloat!
    
    //MARK: Navigation Drawer Properties
    
    var navigationDrawerWidth:CGFloat!
    var navigationDrawerHeight:CGFloat!
    var navigationDrawerXPosition:CGFloat!
    var navigationDrawerYPosition:CGFloat!
    var navigationDrawerBackgroundColor = UIColor.white
    var navigationDrawerType = NavigationDrawerType.leftDrawer
    var navigationDrawerOpenDirection = NavigationDrawerOpenDirection.anyWhere
    var navigationDrawerEdgeSwipeDistance:CGFloat = 20.0
    
    var drawerController:UIViewController?
    
        
    init()
    {
        navigationDrawerXPosition = 0
        navigationDrawerYPosition = 0
    }
    
    /*
    Initializes defaults values for navigation Drawer
    */
    func initDefaults()
    {
        anchorViewHeight = self.anchorView!.frame.size.height
        anchorViewWidth = self.anchorView!.frame.size.width
        
        if navigationDrawerWidth == nil
        {
            navigationDrawerWidth = anchorViewWidth - 100
        }
        
        if navigationDrawerHeight == nil
        {
             navigationDrawerHeight = anchorViewHeight
        }
    }
    
    
    /*
    Calculates X Position for navigation drawer(Left or Right) and returns it. 
    
    - returns: X Position of navigation drawer
    */
    func getNavigationDrawerXPosition()->CGFloat
    {
        if navigationDrawerType == .leftDrawer
        {
            navigationDrawerXPosition = 0
        }
        else
        {
            navigationDrawerXPosition = anchorViewWidth - navigationDrawerWidth
        }
        return navigationDrawerXPosition
    }
    
    func getAnchorViewWidth() -> CGFloat
    {
        return self.anchorViewWidth
    }
    
    func getAnchorViewHeight() -> CGFloat
    {
        return self.anchorViewHeight
    }
    
}
