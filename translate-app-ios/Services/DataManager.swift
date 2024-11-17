//
//  DataManager.swift
//  translate-app-ios
//
//  Created by nikita on 14.11.24.
//

import Foundation

enum Link: String {
    case languages = "https://ftapi.pythonanywhere.com/languages"
    case translate = "https://ftapi.pythonanywhere.com/translate?"
}

final class DataManager {
    static let shared = DataManager()
        
    private init() {}
    
    func translate(
        from: String,
        to: String,
        _ text: String,
        completion: @escaping (Translation?) -> Void
    ) {
        let url = Link.translate.rawValue
        + (from.isEmpty ? "" : "sl=" + from)
        + "&dl=" + to
        + "&text=" + text
        
        NetworkManager.shared.fetch(Translation.self, from: url) { result in
            switch result {
            case .success(let translateResult):
                completion(translateResult)
            case .failure(let error):
                print("DataManager Error:", error)
                completion(nil)
            }
        }
    }
    
    func getLanguage(completion: @escaping ([String: String]) -> Void) {
        let url = Link.languages.rawValue
        NetworkManager.shared.fetch([String: String].self, from: url) { result in
            switch result {
            case .success(let results):
                var languages: [String: String] = [:]
                results.forEach{ key, value in
                    let language = value.capitalized
                    let code = key
                    languages[language] = code
                }
                completion(languages)
            case .failure(let error):
                print("DataManager Error:", error)
            }
        }
    }
}
