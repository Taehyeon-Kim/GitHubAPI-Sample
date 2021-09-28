//
//  SceneDelegate.swift
//  GitHubAPI-Sample
//
//  Created by taehy.k on 2021/09/27.
//

import UIKit

import Then

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    // MARK: - Properties
    
    var window: UIWindow?
    
    lazy var repoNavController = UINavigationController(rootViewController: RepoViewController()).then {
        $0.view.backgroundColor = .systemBackground
    }
    
    lazy var userNavController = UINavigationController(rootViewController: UserViewController()).then {
        $0.view.backgroundColor = .systemBackground
    }
    
    lazy var tabBarController: UITabBarController = {
        let tabBarController = UITabBarController()
        tabBarController.delegate = tabBarController
        tabBarController.view.backgroundColor = .systemBackground
        return tabBarController
    }()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }

        configureControllers()

        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }

    // MARK: - Private Helpers
    
    private func configureControllers() {
        repoNavController.configureTabBar(
          title: "Repositories",
          systemImageName: "folder.fill.badge.plus"
        )
        userNavController.configureTabBar(title: "Current User", systemImageName: "person.fill")
        tabBarController.viewControllers = [repoNavController, userNavController]
    }
}
