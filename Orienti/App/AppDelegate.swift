//
//  AppDelegate.swift
//  Orienti
//
//  Created by Kryštof Kiss on 02/12/2022.
//

import ErrorHandler
import SnapKit
import UIKit
import QROrienti

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        // Configure global navigation bar colors
        let barAppearance = UINavigationBarAppearance()
        barAppearance.backgroundColor = Colors.primary
        barAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: Colors.white]
        UINavigationBar.appearance().scrollEdgeAppearance = barAppearance
        UINavigationBar.appearance().tintColor = Colors.white
        
        let service = QRService()
        let container = service.decode(content: "H4sIAAAAAAAAAIXPMWvDMBAF4L9SbvaB7iRbOm2mYwmUkqmlg2zJEOrawbGHEPzfq7Skdadsj+MeH+8C7TjM09g/j4dhBj8sfV/AtAy3OE+h/QB/+fd3Av92vcQEHmoNBRxiTsYpQ6kl7MhVaEgEQykaTWw0sxbSKuTfIXz+9pZjDHOKdaaBFTMSo9J7VXllfWlfYS3+ILpBVozY1DFKaSlDyWETG0KRoKlpRXMlG4juQcZk6H0z9ltJrQTpYsCykjyn6Tp0UTM60UpVeZMNG2V3fvip37GYs7Vm63y81vYv9eMTrF9XCJOjiAEAAA==")
        let result = service.encode(content: container!)

        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
}
