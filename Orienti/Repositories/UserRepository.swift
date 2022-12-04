//
//  UserRepository.swift
//  Orienti
//
//  Created by Kryštof Kiss on 03/12/2022.
//

import CoreData
import Resolver

enum RepositoryError: Error {
    case cannotCreate(Error)
    case cannotGet(Error)
    case cannotDelete(Error)
    case cannotUpdate(Error)
}

final class UserRepository {
    @Injected var coreData: CoreDataService

    func create(name: String) throws -> User {
        let context = coreData.persistentContainer.viewContext

        let user = User(context: context)
        user.name = name

        do {
            try context.save()
            return user
        } catch {
            throw RepositoryError.cannotCreate(error)
        }
    }

    func getUser() throws -> User? {
        let context = coreData.persistentContainer.viewContext

        let fetchRequest = NSFetchRequest<User>(entityName: "User")
        fetchRequest.fetchLimit = 1

        do {
            let employees = try context.fetch(fetchRequest)
            return employees.first
        } catch {
            throw RepositoryError.cannotGet(error)
        }
    }

    func getAll() throws -> [User] {
        let context = coreData.persistentContainer.viewContext

        let fetchRequest = NSFetchRequest<User>(entityName: "User")

        do {
            let employees = try context.fetch(fetchRequest)
            return employees
        } catch {
            throw RepositoryError.cannotGet(error)
        }
    }

    func update(object: User) throws {
        let context = coreData.persistentContainer.viewContext

        do {
            try context.save()
        } catch {
            throw RepositoryError.cannotUpdate(error)
        }
    }

    func delete(object: User) throws {
        let context = coreData.persistentContainer.viewContext

        context.delete(object)

        do {
            try context.save()
        } catch {
            throw RepositoryError.cannotDelete(error)
        }
    }
}
