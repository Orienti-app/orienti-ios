//
//  AppCoordinator.swift
//  Orienti
//
//  Created by Kryštof Kiss on 02/12/2022.
//

import UIKit

enum AppCoordinator {
    static func startSelectMode() {
        UIApplication.keyWindow.rootViewController = RoleController()
        UserDefaults.standard.removeObject(forKey: Keys.appMode)
    }

    static func startRunnerMode() {
        UIApplication.keyWindow.rootViewController = UINavigationController(rootViewController: RunnerController())
        UserDefaults.standard.set(AppMode.runner.rawValue, forKey: Keys.appMode)
    }

    static func startTrainerMode() {
        UIApplication.keyWindow.rootViewController = UINavigationController(rootViewController: TrainerController())
        UserDefaults.standard.set(AppMode.trainer.rawValue, forKey: Keys.appMode)
    }
}
