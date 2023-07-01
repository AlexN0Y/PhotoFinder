//
//  Constants.swift
//  PhotoFinderApp
//
//  Created by Alex Gav on 29.06.2023.
//

import Foundation

enum GlobalConstants {
    static var accessKey: String? {
        guard let plistPath = Bundle.main.path(forResource: "APIKeys", ofType: "plist") else {
            return nil
        }

        guard let plistData = FileManager.default.contents(atPath: plistPath) else {
            return nil
        }

        do {
            guard let plistDictionary = try PropertyListSerialization.propertyList(from: plistData, options: [], format: nil) as? [String: Any] else {
                return nil
            }

            if let value = plistDictionary["Access Key"] as? String {
                return value
            } else {
                return nil
            }
        } catch {
            print("Error: \(error)")
        }
        return nil
    }
        
}
