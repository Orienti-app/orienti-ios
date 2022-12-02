//
//  AppDelegate.swift
//  Orienti
//
//  Created by Kryštof Kiss on 02/12/2022.
//

import ErrorHandler
import SnapKit
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        // Configure global navigation bar colors
        let barAppearance = UINavigationBarAppearance()
        barAppearance.backgroundColor = Colors.primary
        UINavigationBar.appearance().scrollEdgeAppearance = barAppearance
        UINavigationBar.appearance().tintColor = .white

        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
}
