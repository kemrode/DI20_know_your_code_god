//
//  QuizzData.swift
//  DI20
//
//  Created by Kevin Fichou on 04/10/2021.
//

import Foundation
import UIKit

class QuizzData {
    private struct QuizzKeys{
        static let dataExtracted: String = "dataExtracted"
    }
    static var dataExtracted: Bool {
        get { return UserDefaults.standard.bool(forKey: QuizzKeys.dataExtracted)}
        set { return UserDefaults.standard.set(newValue, forKey: QuizzKeys.dataExtracted)}
    }
}
