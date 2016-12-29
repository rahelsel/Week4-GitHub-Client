//
//  AppDelegate.swift
//  GoGoGitHub
//
//  Created by Rachael A Helsel on 10/31/16.
//  Copyright © 2016 Rachael A Helsel. All rights reserved.
//

import UIKit

@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var authController: AuthViewController?
    var homeController: HomeViewController?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        checkAuthStatus()
        return true
    }

    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        
        GithubService.shared.tokenRequestFor(url: url, options: .userDefaults, completion: { (success) in
         
            if let authController = self.authController, let homeController = self.homeController {
            
                authController.dismissAuthController()
                homeController.update()
            
            }
            
        })
        
        return true
        
    }
    
    func checkAuthStatus() {
    
        if let token = UserDefaults.standard.getAccessToken() {
        
            print(token)
        } else {
        
            if let authViewController = storyboard.instantiate
        }
    
    }
    
}

