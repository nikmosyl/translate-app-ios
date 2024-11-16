//
//  UIButton+Extension.swift
//  translate-app-ios
//
//  Created by nikita on 17.11.24.
//

import UIKit

extension UIButton {
    static func create() -> UIButton {
        let button = UIButton()
        button.tintColor = UIColor.secondaryLabel
        button.setTitle("Select language", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.secondaryLabel.cgColor
        button.layer.cornerRadius = 8
        return button
    }
}
