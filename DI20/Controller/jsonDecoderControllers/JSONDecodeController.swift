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
            dispatchExtract(jsonExtract: jsonExtract!)
        } catch { print(error.localizedDescription)}
    }
}
private func dispatchExtract(jsonExtract: Dictionary<String, Any>){
    jsonExtract.forEach{(extract) in
        
    }
}
