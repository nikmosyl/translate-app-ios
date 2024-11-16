//
//  TranslateViewController.swift
//  translate-app-ios
//
//  Created by nikita on 13.11.24.
//

import UIKit

final class TranslateViewController: UIViewController {
    
    private let translateView = TranslateView()
    
    private var languages: [String] = []
    private var languagesCodes: [String: String] = [:]
    
    private var inputLanguages: String = "Auto"
    private var outputLanguages: String = "Russian"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = translateView
        translateView.setDelegate(self)
        
        DataManager.shared.getLanguage { [weak self] dictionary in
            DispatchQueue.main.async { [weak self] in
                guard let self else { return }
                languages = dictionary.keys.sorted()
                languagesCodes = dictionary
                translateView.inputTable.reloadData()
                translateView.outputTable.reloadData()
            }
        }
    }
}

extension TranslateViewController: TranslateViewDelegate {
    func buttonTapped(_ text: String) {
        DataManager.shared.translate(from: "en", to: "ru", text) { translation in
            DispatchQueue.main.async { [weak self] in
                guard let self, let translation else { return }
                translateView.configure(translate: translation.text)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        languages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = languages[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView === translateView.inputTable ? print("INPUT TABLE") : print("UNKNOWN TABLE")
        print("indexPath:", indexPath.row, "languages:", languages[indexPath.row])
    }
}
