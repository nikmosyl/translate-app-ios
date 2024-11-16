//
//  StorageManager.swift
//  translate-app-ios
//
//  Created by nikita on 16.11.24.
//

import Foundation

enum Storege: String {
    case input
    case output
    case favorites
}

final class StorageManager {
    static let shared = StorageManager()
    
    private init() {}
    
    //MARK: - Language
    func save(_ languages: String..., to storege: Storege) {
        if let encodedLanguage = try? JSONEncoder().encode(languages) {
            print("save input:", languages, "to:", storege.rawValue)
            UserDefaults.standard.set(encodedLanguage, forKey: storege.rawValue)
        }
    }
    
    func loadInput(from storage: Storege) -> [String] {
        if let data = UserDefaults.standard.data(forKey: storage.rawValue),
           let language = try? JSONDecoder().decode([String].self, from: data) {
            return language
        }
        return []
    }
}
