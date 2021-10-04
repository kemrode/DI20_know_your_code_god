//
//  newPersonModel.swift
//  DI20
//
//  Created by Kevin Fichou on 16/09/2021.
//

import Foundation
import UIKit

public struct newPerson: Loopable {
    var beard: String = ""
    var big: String = ""
    var eyesColor: String = ""
    var firstname: String = ""
    var glasses: String = ""
    var hairs: String = ""
    var sex: String = ""
    var smile: String = ""
    var strong: String = ""
    var tall: String = ""
    var voice: String = ""
}
public func registerNewPeople(newPerson: newPerson){
    let newPeople = People(context: AppDelegate.viewContext)
    newPeople.firstname = newPerson.firstname
//    newPeople.big = newPerson.big
    newPeople.eyesColor = newPerson.eyesColor
    newPeople.glasses = newPerson.glasses
    newPeople.hairs = newPerson.hairs
    newPeople.sex = newPerson.sex
    newPeople.smile = newPerson.smile
    newPeople.strong = newPerson.strong
    newPeople.tall = newPerson.tall
    newPeople.voice = newPerson.voice
    do{try? AppDelegate.viewContext.save()}
    catch{print(error.localizedDescription)}
}
func deleteAllData() {
    let allPeople = People.all
    allPeople.forEach{people in
        AppDelegate.viewContext.delete(people)
    }
//        AppDelegate.viewContext.delete(peopleList)
    do{ try? AppDelegate.viewContext.save()}
    catch{print(error.localizedDescription)}
}
protocol Loopable {
    func allProperties() throws -> [String: Any]
}
extension Loopable {
    func allProperties() throws -> [String: Any] {
        var result: [String: Any] = [:]
        let mirror = Mirror(reflecting: self)
        guard let style = mirror.displayStyle, style == .struct || style == .class else {
            throw NSError()
        }
        for (property, value) in mirror.children {
        guard let property = property else {
            continue
        }
        result[property] = value
        }
        return result
    }
}
