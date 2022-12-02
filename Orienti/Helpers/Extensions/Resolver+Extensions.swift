//
//  Resolver+Extensions.swift
//  Orienti
//
//  Created by Kryštof Kiss on 02/12/2022.
//

import Resolver

extension Resolver: ResolverRegistering {
    public static func registerAllServices() {
        // ViewModels
        register { RunnerVM() }
        register { TrainerVM() }
        // Services
        // Repositories
        // Managers
    }
}
