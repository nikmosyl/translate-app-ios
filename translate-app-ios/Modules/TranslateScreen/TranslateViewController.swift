//
//  TranslateViewController.swift
//  translate-app-ios
//
//  Created by nikita on 13.11.24.
//

import UIKit

final class TranslateViewController: UIViewController {
    
    private let translateView = TranslateView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = translateView
        
        translateView.delegate = self
    }
}

extension TranslateViewController: TranslateViewDelegate {
    func buttonTapped(_ text: String) {
        print("buttonTaped")
        DataManager.shared.translate(from: "en", to: "ru", text) { translation in
            print("text", translation.text)
            //print("input:", translation.pronunciation?.inputAudio)
            //print("outpur:", translation.pronunciation?.outputAudio)
        }
    }
}
