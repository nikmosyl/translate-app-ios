//
//  Translate.swift
//  translate-app-ios
//
//  Created by nikita on 14.11.24.
//

import Foundation

struct Translation: Codable {
    let text: String
    //let pronunciation: Pronunciation
    
    enum CodableKeys: String, CodingKey {
        case text = "destination-text"
        //case pronunciation = "pronunciation"
    }
}

struct Pronunciation: Codable {
    let inputAudio: String?
    let outputAudio: String?
    
    enum CodableKeys: String, CodingKey {
        case inputAudio = "source-text-audio"
        case outputAudio = "destination-text-audio"
    }
}
