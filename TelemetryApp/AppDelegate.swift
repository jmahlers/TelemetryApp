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
        
        let licence:String = "<LicenseContract>"+"<Customer>Washington University</Customer>"+"<OrderId>EDUCATIONAL-USE-0125</OrderId>"+"<LicenseCount>2</LicenseCount>"+"<IsTrialLicense>false</IsTrialLicense>"+"<SupportExpires>02/12/2020 00:00:00</SupportExpires>"+"<ProductCode>SC-IOS-2D-PRO</ProductCode>"+"<KeyCode>3e1fb899760442100fcf1dadf2cf09fa54b05a19e02de51a9217f4daede19c2e2e507e08ff7938ef9ebb813ae7a21492c6ec29ebd05963e806d603aa7ce2f04eec43401c341c92b538aa104b7f79ce6ecceab51379dde9fb3c7ef5ce56de3e7b4960972a66b019f28bdf9ec1b394513ecab2b9091496e51bf47724ecd189955c10e66b8cbb322fbf940aa6424c3cce05774561696287875b4f1ca854607b75930006dc5f1cceccfdec659bac177f</KeyCode>"+"</LicenseContract>"
        
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

