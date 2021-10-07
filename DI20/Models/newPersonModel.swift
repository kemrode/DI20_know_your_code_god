//
//  newPersonModel.swift
//  DI20
//
//  Created by Kevin Fichou on 16/09/2021.
//
import Foundation
import UIKit
public struct newPerson: Loopable {
    var beard: String = String()
    var big: String = String()
    var eyesColor: String = String()
    var firstname: String = String()
    var glasses: String = String()
    var hairs: String = String()
    var sex: String = String()
    var smile: String = String()
    var strong: String = String()
    var tall: String = String()
    var voice: String = String()
    
    public func registerNewPeople(newPerson: newPerson){
        let newPeople = People(context: AppDelegate.viewContext)
        newPeople.firstname = newPerson.firstname
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
    public func deleteAllData() {
        let allPeople = People.all
        allPeople.forEach{people in
            AppDelegate.viewContext.delete(people)
        }
        do{ try? AppDelegate.viewContext.save()}
        catch{print(error.localizedDescription)}
    }
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
