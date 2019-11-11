//
//  AppDelegate.swift
//  TelemetryApp
//
//  Created by Jeff Ahlers on 10/30/19.
//  Copyright © 2019 Jeff Ahlers. All rights reserved.
//

import UIKit
import SciChart


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let licence:String = "<LicenseContract>" +
        "<Customer>jake.kendrick@gmail.com</Customer>" +
        "<OrderId>Trial</OrderId>" +
        "<LicenseCount>1</LicenseCount>" +
        "<IsTrialLicense>true</IsTrialLicense>" +
        "<SupportExpires>12/11/2019 00:00:00</SupportExpires>" +
        "<ProductCode>SC-IOS-2D-ENTERPRISE-SRC</ProductCode>" +
        "<KeyCode>80b07ea46beaf563312e32edc4d6b9dd2d92b9aad1b9d601aca8bf958360d36979b7eec003211d1f0dd3e343a74e47d26f813f7b8ba3b428ffee0ec565fe3b50c9dfb348171d2742fa3970961cdd1680f123eecea0a750e740f2ab601a76409101d0a51d69172520a5ff8b12148019b88490cf4caab899c85b96326f660622dea1d6465223614c5e9dcf6076babf072afb9ed66936d05c5fa5f15b1d5cd0411e9d48588d3cc8f68055790f400f</KeyCode>" +
        "</LicenseContract>"
        
        SCIChartSurface.setRuntimeLicenseKey(licence)
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        Telemetry.shared.disconnect()
    }
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        Telemetry.shared.timer = Date()
        Telemetry.shared.connect()
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        Telemetry.shared.disconnect()
    }
    
}

