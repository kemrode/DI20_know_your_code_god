//
//  peopleModel.swift
//  DI20
//
//  Created by Kevin Fichou on 03/09/2021.
//
import Foundation
import UIKit
import CoreData

class People: NSManagedObject  {
    static var all: [People]{
        let request: NSFetchRequest<People> = People.fetchRequest()
        guard let peoples = try? AppDelegate.viewContext.fetch(request) else {return []}
        return peoples
    }
    func getFirstnames(_ completion: (([People])-> Void)?) {
        let request: NSFetchRequest<People> = People.fetchRequest()
        do {
            let persons = try AppDelegate.viewContext.fetch(request)
            completion?(persons)
        } catch {
            print(error.localizedDescription)
            completion?([])
        }
    }
}


