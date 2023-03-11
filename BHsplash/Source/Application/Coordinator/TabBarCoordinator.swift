//
//  TabBarCoordinator.swift
//  BHsplash
//
//  Created by 이병현 on 2023/03/11.
//

import UIKit

class TabBarCoordinator: Coordinator {
    
    enum TabBar: Int, CaseIterable {
        case main
        case search
        
        var title: String {
            switch self {
            case .main:
                return "UpSplash"
            case .search:
                return "Search"
            }
        }
        
        var image: UIImage? {
            switch self {
            case .main:
                return UIImage(systemName: "photo")
            case .search:
                return UIImage(systemName: "magnifyingglass")
            }
        }
    }

    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    var tabBarController: UITabBarController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.tabBarController = UITabBarController()
    }
    
    func start() {
        configureTabBarController()
    }
}

extension TabBarCoordinator {
    private func configureTabBarController() {
        let tabs: [TabBar] = TabBar.allCases
        let controllers: [UINavigationController] = tabs.map { tabBarController($0) }
        tabBarController.setViewControllers(controllers, animated: true)
        tabBarController.selectedIndex = TabBar.main.rawValue
        tabBarController.tabBar.tintColor = UIColor(named: "MainColorReverse")
        tabBarController.tabBar.backgroundColor = UIColor(named: "SystemBackground")
        tabBarController.tabBar.isTranslucent = false
    }
    
    private func tabBarController(_ tabs: TabBar) -> UINavigationController {
        let navigationController = UINavigationController()
        
        navigationController.tabBarItem = UITabBarItem.init(
            title: nil,
            image: tabs.image,
            tag: tabs.rawValue
        )
        
        switch tabs {
        case .main:
            let mainCoordinator = MainCoordinator(navigationController: navigationController)
            mainCoordinator.start()
            childCoordinators.append(mainCoordinator)
        case .search:
            let searchCoordinator = SearchCoordinator(navigationController: navigationController)
            searchCoordinator.start()
            childCoordinators.append(searchCoordinator)
        }

        return navigationController
    }
}
