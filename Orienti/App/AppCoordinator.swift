//
//  AppCoordinator.swift
//  Orienti
//
//  Created by Kryštof Kiss on 02/12/2022.
//

import UIKit

enum AppCoordinator {
    static func startRunnerMode() {
        UIApplication.keyWindow.rootViewController = RunnerController()
        UserDefaults.standard.set(AppMode.runner.rawValue, forKey: Keys.appMode)
    }

    static func startTrainerMode() {
        UIApplication.keyWindow.rootViewController = TrainerController()
        UserDefaults.standard.set(AppMode.trainer.rawValue, forKey: Keys.appMode)
    }
}
