//
//  SceneDelegate.swift
//  BHsplash
//
//  Created by 이병현 on 2022/10/31.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    private var appCoordinator: AppCoordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let scene = (scene as? UIWindowScene) else { return }
        appCoordinator = AppCoordinator(window: UIWindow(windowScene: scene))
        appCoordinator?.start()
    }
}

