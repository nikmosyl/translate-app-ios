//
//  UITextView+Extension.swift
//  translate-app-ios
//
//  Created by nikita on 17.11.24.
//

import UIKit

extension UITextView {
    static func create() -> UITextView {
        let view = UITextView()
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.secondaryLabel.cgColor
        view.layer.cornerRadius = 8
        view.font = .systemFont(ofSize: 16)
        return view
    }
}
