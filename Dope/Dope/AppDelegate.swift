//
//  AppDelegate.swift
//  Dope
//
//  Created by Zach Nafziger on 4/16/16.
//  Copyright © 2016 Zach Nafziger. All rights reserved.
//

import UIKit
import FirebaseUI

@UIApplicationMain
class AppDelegate: FirebaseAppDelegate {

    override func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        // Override point for customization after application launch.
        _ = Stream.sharedInstance
        _ = Stream.dictionary
        PushServer.sharedInstance.server = OneSignal(launchOptions: launchOptions, appId: "bd07345d-ef11-4307-b129-d936a6810241", handleNotification: nil)
        PushServer.sharedInstance.server.enableInAppAlertNotification(true)
        return true
    }

    override func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    override func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        FirebaseHelper().setOffline()
    }

    override func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
        FirebaseHelper().setOnline()
    }

    override func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        
    }

    override func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    override func application(application: UIApplication, openURL url: NSURL,
                     sourceApplication: String?, annotation: AnyObject) -> Bool {
        return true
    }


}

