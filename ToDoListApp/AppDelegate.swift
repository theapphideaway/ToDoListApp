//
//  AppDelegate.swift
//  ToDoListApp
//
//  Created by ian schoenrock on 11/13/18.
//  Copyright © 2018 ian schoenrock. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        do{
            _ = try Realm()
            
        } catch{
            print(error)
        }
        
        return true
    }


}

