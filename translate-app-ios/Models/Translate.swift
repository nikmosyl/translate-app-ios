//
//  Translate.swift
//  translate-app-ios
//
//  Created by nikita on 14.11.24.
//

import Foundation

struct Translation: Decodable {
    let text: String
    let pronunciation: Pronunciation
    
    enum CodingKeys: String, CodingKey {
        case text = "destination-text"
        case pronunciation = "pronunciation"
    }
}

struct Pronunciation: Decodable {
    let inputAudio: String
    let outputAudio: String
    
    enum CodingKeys: String, CodingKey {
        case inputAudio = "source-text-audio"
        case outputAudio = "destination-text-audio"
    }
}
