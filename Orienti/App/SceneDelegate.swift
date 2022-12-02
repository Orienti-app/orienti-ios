//
//  SceneDelegate.swift
//  Orienti
//
//  Created by Kryštof Kiss on 02/12/2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    // MARK: - Public properties

    var window: UIWindow?

    // MARK: - Public methods

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        let window = _configureWindowFor(scene)
        let rootVC = _configureRootViewController()

        window.rootViewController = rootVC
        window.makeKeyAndVisible()

        self.window = window
    }

    // MARK: - Private methods

    private func _configureWindowFor(_ scene: UIScene) -> UIWindow {
        guard let windowScene = (scene as? UIWindowScene) else {
            return UIWindow(frame: UIScreen.main.bounds)
        }

        let window = UIWindow(windowScene: windowScene)

        return window
    }

    private func _configureRootViewController() -> UIViewController {
        let mainController = ViewController()

        return mainController
    }
}
