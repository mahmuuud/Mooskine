//
//  AppDelegate.swift
//  Mooskine
//
//  Created by Josh Svatek on 2017-05-29.
//  Copyright © 2017 Udacity. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let dataController=DataController(modelName: "Mooskine")

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        dataController.loadStore()
        let navBar=window?.rootViewController as! UINavigationController
        let notebooksListVC=navBar.topViewController as! NotebooksListViewController
        notebooksListVC.dataController=self.dataController
        return true
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        print("terminated")
        if dataController.context.hasChanges {
            print("has changes")
        }
        try! dataController.context.save()
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        print("entered background")
        if dataController.context.hasChanges {
            print("has changes")
        }
        try! dataController.context.save()
    }


}

