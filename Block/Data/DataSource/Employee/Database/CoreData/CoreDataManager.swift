//
//  CoreDataManager.swift
//  Block
//
//  Created by Raúl Pera Pairó on 30/3/22.
//

import Foundation
import CoreData

class CoreDataManager {
    // MARK: Properties
    static let shared = CoreDataManager()
    let persistentContainer: NSPersistentContainer

    // MARK: Constructor
    init() {
        persistentContainer = NSPersistentContainer(name: "LocalStorageDataBase")
        persistentContainer.loadPersistentStores { (_, error) in
            if let error = error {
                fatalError("Core Data Store failed \(error.localizedDescription)")
            }
        }
    }

    // MARK: Functionality
    func updateEmployee(employee: Employee) {
        let entity = EmployeeEntity(context: persistentContainer.viewContext)
        entity.id = employee.id
        entity.name = employee.name
        entity.phone = employee.phone
        entity.email = employee.email
        entity.biography = employee.biography
        entity.smallPhoto = employee.smallPhoto
        entity.largePhoto = employee.largePhoto
        entity.team = employee.team
        entity.employeeType = employee.employeeType

        do {
            try persistentContainer.viewContext.save()
        } catch {
            persistentContainer.viewContext.rollback()
        }
    }

    func deleteEmployee(employee: Employee) {
        let entity = EmployeeEntity(context: persistentContainer.viewContext)
        entity.id = employee.id
        entity.name = employee.name
        entity.phone = employee.phone
        entity.email = employee.email
        entity.biography = employee.biography
        entity.smallPhoto = employee.smallPhoto
        entity.largePhoto = employee.largePhoto
        entity.team = employee.team
        entity.employeeType = employee.employeeType

        persistentContainer.viewContext.delete(entity)

        do {
            try persistentContainer.viewContext.save()
        } catch {
            persistentContainer.viewContext.rollback()
            NSLog("Failed to save context \(error)")
        }
    }

    func getAllEmployees() throws -> [Employee] {
        let fetchRequest: NSFetchRequest<EmployeeEntity> = EmployeeEntity.fetchRequest()
        do {
            return try persistentContainer.viewContext.fetch(fetchRequest).map {
                Employee(
                    id: $0.id ?? "",
                    name: $0.name ?? "",
                    phone: $0.phone ?? "",
                    email: $0.email ?? "",
                    biography: $0.biography ?? "",
                    smallPhoto: $0.smallPhoto ?? "",
                    largePhoto: $0.largePhoto ?? "",
                    team: $0.team ?? "",
                    employeeType: $0.employeeType ?? ""
                )
            }
        } catch {
            throw StoreEmployeeError.emptyList
        }
    }

    func saveMovie(employee: Employee) throws {
        let entity = EmployeeEntity(context: persistentContainer.viewContext)
        entity.name = employee.name
        entity.email = employee.email
        entity.biography = employee.biography
        entity.id = employee.id
        entity.employeeType = employee.employeeType
        entity.phone = employee.phone
        entity.team = employee.team
        entity.largePhoto = employee.largePhoto
        entity.smallPhoto = employee.smallPhoto

        do {
            try persistentContainer.viewContext.save()
        } catch {
            throw StoreEmployeeError.data
        }
    }
}
