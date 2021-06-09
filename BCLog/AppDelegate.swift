//
//  AppDelegate.swift
//  BCLog
//
//  Created by Jason Panella on 5/26/20.
//  Copyright © 2020 Jason Panella. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
   
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()
        
        TourService.loadAllTours { tours in
            TourService.allTours = tours
        }
        
        _ = Auth.auth().addStateDidChangeListener { auth, user in
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            
            if user != nil {
                
                UserService.observeUserProfile(user!.uid) { userProfile in
                    UserService.currentUserProfile = userProfile
                }
                
                let controller = storyboard.instantiateViewController(withIdentifier: "MainTabBarController") as Any
                self.window?.rootViewController = controller as? UITabBarController
                self.window?.makeKeyAndVisible()
            } else {
                UserService.currentUserProfile = nil
                
                let controller = storyboard.instantiateViewController(withIdentifier: "SigninViewController") as Any
                self.window?.rootViewController = controller as? UIViewController
                self.window?.makeKeyAndVisible()
            }
        }
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

