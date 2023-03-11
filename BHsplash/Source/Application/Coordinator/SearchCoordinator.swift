//
//  SearchCoordinator.swift
//  BHsplash
//
//  Created by 이병현 on 2023/03/11.
//

import UIKit

final class SearchCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {

        let vc = SearchViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
}
