//
//  AppDelegate.swift
//  ViewControllerExample
//
//  Created by MyMac on 2019/11/25.
//  Copyright © 2019 sandMan. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        if #available(iOS 13.0, *) {
            
        } else {
            window = UIWindow(frame: UIScreen.main.bounds)
                  window?.backgroundColor = .white
                  window?.rootViewController = ViewController()
                  window?.makeKeyAndVisible()
        }
        return true
    }
}


