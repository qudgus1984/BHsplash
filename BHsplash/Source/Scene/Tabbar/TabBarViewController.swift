//
//  TabbarViewController.swift
//  BHsplash
//
//  Created by 이병현 on 2022/11/01.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstVC = UINavigationController(rootViewController: TabManViewController())
        firstVC.tabBarItem.image = UIImage(systemName: "photo.fill")
        
        let secondVC = UINavigationController(rootViewController: SearchViewController())
        secondVC.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        secondVC.navigationController?.isNavigationBarHidden = true
        
        viewControllers = [firstVC, secondVC]
    }
    
}
