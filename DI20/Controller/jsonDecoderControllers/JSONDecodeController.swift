//
//  JSONDecodeController.swift
//  DI20
//
//  Created by Kevin Fichou on 30/09/2021.
//

import Foundation
import UIKit
import CoreData
//complete after making the json file
public func extractJSONData(filePath: URL) {
    if let data = try? Data(contentsOf: filePath) {
        do {
            let jsonExtract = try JSONSerialization.jsonObject(with: data, options: []) as? Dictionary<String, Any>
            jsonExtract?.forEach{(extract) in
                extractionValues(extract: extract, model: People(context: AppDelegate.viewContext), title: extract.key)
            }
        } catch { print(error.localizedDescription)}
        QuizzData.dataExtracted = true
    }
}
private func extractionValues(extract: Dictionary<String, Any>.Element, model: NSManagedObject, title: String){
    let extractValues = extract.value as! NSArray
    extractValues.forEach{(value) in
        parserManagedObject(itemArray: value as! Dictionary<String, String>, modelToParse: model, title: title)
    }
}
private func parserManagedObject(itemArray: Dictionary<String, String>, modelToParse: NSManagedObject, title: String){
    creationObject(item: itemArray, model: modelToParse, title: title)
}
private func creationObject(item: Dictionary<String, String>, model: NSManagedObject, title: String) {
    let newModel = NSEntityDescription.insertNewObject(forEntityName: title, into: AppDelegate.viewContext)
    item.forEach{(element) in
        let entityKeys = model.entity.attributesByName.keys
        loopInElement(element: element, entity: entityKeys, model: newModel)
    }
    do{ try? AppDelegate.viewContext.save()
    } catch { print(error.localizedDescription)}
}
private func loopInElement(element: Dictionary<String, String>.Element, entity: Dictionary<String, NSAttributeDescription>.Keys, model: NSManagedObject) {
    entity.forEach{(title) in
        (title == element.key) ? model.setValue(element.value, forKey: title) : print("error : we have \(title), but we want \(element.key)")
    }
}
