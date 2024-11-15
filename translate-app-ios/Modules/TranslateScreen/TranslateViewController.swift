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
        DataManager.shared.getLanguage()
        
        DataManager.shared.translate(from: "en", to: "ru", text) { translation in
            DispatchQueue.main.async { [weak self] in
                guard let self, let translation else { return }
                translateView.configure(translate: translation.text)
            }
        }
    }
}
