//
//  AppDelegate.swift
//  DynamicTable
//
//  Created by Ankita  on 16/12/20.
//  Copyright © 2020 Ankita . All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        // Added to add rootview controller for iOS < 13.0
        let navController = UINavigationController(rootViewController: FactsListViewController())
        // Create the UIWindow variable use above UIWindowScene variable.
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        // Set this scene's window's background color.
        self.window!.backgroundColor = UIColor.white
        self.window!.rootViewController =  navController
        // Make this scene's window be visible.
        self.window!.makeKeyAndVisible()
        return true
    }
    
    // MARK: UISceneSession Lifecycle
    // Available only for iOS >=13.0
    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    // Available only for iOS >13.0
    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    
}

