//
//  AppDelegate.swift
//  Todoey
//
//  Created by Ashish Rane on 2018-08-08.
//  Copyright © 2018 Ashish Rane. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        //location of the realm file URL
        //print(Realm.Configuration.defaultConfiguration.fileURL)
        
        do {
            _ = try Realm()
        } catch {
            print("Error initializing new realm, \(error)")
        }
        
            return true
    }

}

