//
//  SceneDelegate.swift
//  START-HW13-Baqytzhanuly Almaz
//
//  Created by allz on 6/23/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let viewController = ViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.navigationBar.prefersLargeTitles = true
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}
