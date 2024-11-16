//
//  TranslateView.swift
//  translate-app-ios
//
//  Created by nikita on 13.11.24.
//

import UIKit

protocol TranslateViewDelegate: AnyObject, UITableViewDelegate, UITableViewDataSource {
    func buttonTapped(_ text: String)
}

final class TranslateView: UIView {
    weak var delegate: TranslateViewDelegate?
    
    private let inputPicker = UIButton.create()
    
    private let outputPicker = UIButton.create()
    
    private let inputTextView = UITextView.create()
    
    private let outputTextView: UITextView = {
        let view = UITextView.create()
        view.isEditable = false
        return view
    }()
    
    private let translateButton: UIButton = {
        let button = UIButton()
        button.setTitle("Translate", for: .normal)
        button.layer.cornerRadius = 8
        button.backgroundColor = .systemBlue
        return button
    }()
    
    let inputTable: UITableView = {
        let table = UITableView()
        table.isHidden = true
        table.backgroundColor = .red
        return table
    }()
    
    let outputTable: UITableView = {
        let table = UITableView()
        table.isHidden = true
        table.backgroundColor = .red
        return table
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .secondarySystemBackground
        setupViews()
        setupConstraints()
        setupTargets()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setDelegate(_ delegate: TranslateViewDelegate) {
        self.delegate = delegate
        inputTable.delegate = delegate
        inputTable.dataSource = delegate
        outputTable.delegate = delegate
        outputTable.dataSource = delegate
    }
    
    func configure(translate: String) {
        outputTextView.text = translate
    }
    
    @objc func translateButtonTapped() {
        delegate?.buttonTapped(inputTextView.text ?? "")
    }
    
    @objc func toggleDropdown(_ sender: UIButton) {
        if sender === inputPicker {
            inputTable.isHidden.toggle()
        } else {
            outputTable.isHidden.toggle()
        }
    }
}

//MARK: - Setup UI
private extension TranslateView {
    func setupViews() {
        [
            inputTextView,
            outputTextView,
            translateButton,
            inputPicker,
            inputTable,
            outputPicker,
            outputTable
        ].forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            inputPicker.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8),
            inputPicker.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            inputPicker.trailingAnchor.constraint(equalTo: centerXAnchor, constant: -8),
            
            inputTable.topAnchor.constraint(equalTo: inputPicker.bottomAnchor),
            inputTable.leadingAnchor.constraint(equalTo: inputPicker.leadingAnchor),
            inputTable.trailingAnchor.constraint(equalTo: inputPicker.trailingAnchor),
            inputTable.bottomAnchor.constraint(equalTo: centerYAnchor),
            
            outputPicker.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8),
            outputPicker.leadingAnchor.constraint(equalTo: centerXAnchor, constant: 8),
            outputPicker.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            outputTable.topAnchor.constraint(equalTo: outputPicker.bottomAnchor),
            outputTable.leadingAnchor.constraint(equalTo: outputPicker.leadingAnchor),
            outputTable.trailingAnchor.constraint(equalTo: outputPicker.trailingAnchor),
            outputTable.bottomAnchor.constraint(equalTo: centerYAnchor),
            
            inputTextView.topAnchor.constraint(equalTo: inputPicker.bottomAnchor, constant: 16),
            inputTextView.leadingAnchor.constraint(equalTo: inputPicker.leadingAnchor),
            inputTextView.trailingAnchor.constraint(equalTo: outputTextView.trailingAnchor),
            inputTextView.bottomAnchor.constraint(equalTo: centerYAnchor, constant: -8),
            
            outputTextView.topAnchor.constraint(equalTo: centerYAnchor, constant: 8),
            outputTextView.leadingAnchor.constraint(equalTo: inputTextView.leadingAnchor),
            outputTextView.trailingAnchor.constraint(equalTo: translateButton.trailingAnchor),
            outputTextView.bottomAnchor.constraint(equalTo: translateButton.topAnchor, constant: -16),
            
            translateButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16),
            translateButton.leadingAnchor.constraint(equalTo: inputTextView.leadingAnchor),
            translateButton.trailingAnchor.constraint(equalTo: inputTextView.trailingAnchor),
            translateButton.heightAnchor.constraint(equalToConstant: 32),
            translateButton.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    func setupTargets() {
        inputPicker.addTarget(self, action: #selector(toggleDropdown), for: .touchDown)
        outputPicker.addTarget(self, action: #selector(toggleDropdown), for: .touchDown)
        translateButton.addTarget(self, action: #selector(translateButtonTapped), for: .touchUpInside)
    }
}
