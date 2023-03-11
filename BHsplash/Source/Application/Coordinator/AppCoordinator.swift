//
//  AppCoordinator.swift
//  BHsplash
//
//  Created by 이병현 on 2023/03/11.
//

import UIKit

final class AppCoordinator: Coordinator {
    var childCoordinators: [Coordinator]
    var navigationController: UINavigationController
    let window: UIWindow
    
    init(window: UIWindow) {
        self.childCoordinators = []
        self.navigationController = UINavigationController()
        self.window = window
    }
    
    func start() {
        let tabBarCoordinator = TabBarCoordinator(navigationController: navigationController)
        tabBarCoordinator.start()
        window.rootViewController = tabBarCoordinator.tabBarController
        childCoordinators.append(tabBarCoordinator)
        window.makeKeyAndVisible()
    }
}

