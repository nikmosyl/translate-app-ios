//
//  TranslateView.swift
//  translate-app-ios
//
//  Created by nikita on 13.11.24.
//

import UIKit

protocol TranslateViewDelegate: AnyObject {
    func buttonTapped(_ text: String)
}

final class TranslateView: UIView {
    weak var delegate: TranslateViewDelegate?
    
    private let inputTextField: UITextField = {
        let field = UITextField()
        field.placeholder = "Enter text to translate"
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    private let outputLabel: UILabel = {
        let field = UILabel()
        field.text = "Output text"
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    private let translateButton: UIButton = {
        let button = UIButton()
        button.setTitle("Translate", for: .normal)
        button.backgroundColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        setupViews()
        setupConstraints()
        setupTargets()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(translate: String) {
        outputLabel.text = translate
    }
    
    @objc func translateButtonTapped() {
        delegate?.buttonTapped(inputTextField.text ?? "")
    }
}

//MARK: - Setup UI
private extension TranslateView {
    func setupViews() {
        [
            inputTextField,
            outputLabel,
            translateButton
        ].forEach { addSubview($0) }
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            inputTextField.topAnchor.constraint(equalTo: topAnchor),
            inputTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            inputTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            inputTextField.bottomAnchor.constraint(equalTo: centerYAnchor, constant: -8),
            
            outputLabel.topAnchor.constraint(equalTo: centerYAnchor, constant: 8),
            outputLabel.leadingAnchor.constraint(equalTo: inputTextField.leadingAnchor),
            outputLabel.trailingAnchor.constraint(equalTo: translateButton.trailingAnchor),
            outputLabel.bottomAnchor.constraint(equalTo: translateButton.bottomAnchor, constant: 16),
            
            translateButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16),
            translateButton.leadingAnchor.constraint(equalTo: inputTextField.leadingAnchor),
            translateButton.trailingAnchor.constraint(equalTo: inputTextField.trailingAnchor),
            translateButton.heightAnchor.constraint(equalToConstant: 32),
            translateButton.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    func setupTargets() {
        translateButton.addTarget(self, action: #selector(translateButtonTapped), for: .touchUpInside)
    }
}
