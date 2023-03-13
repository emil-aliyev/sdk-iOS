//
//  AppDelegate.swift
//  SkyTechChat
//
//  Created by RashadShirizadaW on 07/08/2022.
//  Copyright (c) 2022 RashadShirizadaW. All rights reserved.
//

import UIKit
import SkyTech_Chat

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let params: [String:Any] = [
                  "language": "YOUR_LANGUAGE", // language code, default is auto
                  "contact": [ // set contacts default and custom fields
                      "email": "Email",
                      "fullname": "Your_FULLNAME",
                      "phone": "YOUR_PHONE"
                      
                             ]
              ]
              
        let config = ChatConfiguration(apiKey: "8122035606297043751cd2", appId: "699c11f6fe8db479107dcd958dc4e6b0", deviceToken: "YOUR_DEVICE_TOKEN", deviceOS: UIDevice.current.systemName.lowercased(), params: params)
              ChatManager.configuration = config
            
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

