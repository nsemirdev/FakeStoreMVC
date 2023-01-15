//
//  SceneDelegate.swift
//  FakeStoreMVC
//
//  Created by Emir Alkal on 15.01.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.makeKeyAndVisible()
        
        let vc1 = HomeVC()
        vc1.view.backgroundColor = .systemTeal
        vc1.tabBarItem.image = UIImage(systemName: "house")
        
        let vc2 = UIViewController()
        vc2.view.backgroundColor = .systemRed
        vc2.tabBarItem.image = UIImage(systemName: "cart")
        
        let vc3 = UIViewController()
        vc3.view.backgroundColor = .systemBlue
        vc3.tabBarItem.image = UIImage(systemName: "person")
        
        let tabBar = FSTabBarController()
        tabBar.viewControllers = [
            vc1, vc2, vc3
        ]
        
        window?.rootViewController = tabBar
    }

}

