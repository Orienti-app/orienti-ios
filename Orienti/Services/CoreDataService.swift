//
//  CoreDataService.swift
//  Orienti
//
//  Created by Kryštof Kiss on 03/12/2022.
//

import CoreData

final class CoreDataService {
    let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Model")
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Loading of store failed \(error)")
            }
        }

        return container
    }()
}
