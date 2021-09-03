//
//  AppDelegate.swift
//  BitBucketList
//
//  Created by Sreekanth on 3/9/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var navigationController: UINavigationController?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        setupHomeViewController(launchOptions)
        return true
    }

    // MARK: Setup Splash Router
    private func setupHomeViewController(_ launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
            self.window = UIWindow(frame: UIScreen.main.bounds)
            if let window = window {
                let mainVC =  SplashViewController()
                navigationController = UINavigationController(rootViewController: mainVC)
                window.rootViewController = navigationController
                window.makeKeyAndVisible()
            }
    }

   


}

