//
//  AppDelegate.swift
//  Project
//
//  Created by Logic on 2019/11/12.
//  Copyright © 2019 Galanz. All rights reserved.
//

import UIKit
import YKWoodpecker

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UITabBarController().setupItems()
        window?.makeKeyAndVisible()
        
        YKWoodpeckerManager.sharedInstance()?.show()

        return true
    }
    
}

