//
//  Helper.swift
//  SwiftHonorsApp
//
//  Created by John Calderaio on 10/11/16.
//  Copyright © 2016 John Calderaio. All rights reserved.
//






import Foundation
import UIKit

class Helper {
    
    static let helper = Helper()
    
    //  All this class does is take us to the first tab on successful Facebook login
    
    func loginDidTapped() {
        
        //  Create a main storyboard instance
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        //  From main storyboard instantiate a navigation controller
        let tabBarVC = storyboard.instantiateViewController(withIdentifier: "TabBarVC") as! UITabBarController
        
        //  Get the app delegate
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        //  Set navigation controller as root view controller
        appDelegate.window?.rootViewController = tabBarVC
        
    }
    
}
