//
//  SceneDelegate.swift
//  translate-app-ios
//
//  Created by nikita on 13.11.24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        window = UIWindow(windowScene: windowScene)
        window?.makeKeyAndVisible()
        
        let vc = UIViewController()
        vc.view.backgroundColor = .red
        
        window?.rootViewController = vc
        
        guard let _ = (scene as? UIWindowScene) else { return }
    }
}

