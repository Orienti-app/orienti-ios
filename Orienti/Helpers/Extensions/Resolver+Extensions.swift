//
//  Resolver+Extensions.swift
//  Orienti
//
//  Created by Kryštof Kiss on 02/12/2022.
//

import QROrienti
import Resolver

extension Resolver: ResolverRegistering {
    public static func registerAllServices() {
        // ViewModels
        register { RunnerVM() }.scope(.unique)
        register { TrainerVM() }.scope(.unique)
        register { SettingsVM() }.scope(.unique)
        
        // Services
        register { QRService() }.scope(.application)
        
        // Repositories
        register { UserRepository() }
        
        // Services
        register { CoreDataService() }.scope(.application)
    }
}
