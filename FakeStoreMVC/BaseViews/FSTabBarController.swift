//
//  FSTabBarController.swift
//  FakeStoreMVC
//
//  Created by Emir Alkal on 15.01.2023.
//

import UIKit

final class FSTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        layout()
    }
    
    fileprivate func configure() {
        tabBar.layer.masksToBounds = true
        tabBar.isOpaque = true
        tabBar.layer.cornerRadius = 30
        tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        tabBar.unselectedItemTintColor = .white
        tabBar.tintColor = UIColor(named: "SecondaryColor")
    
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = UIColor(named: "PrimaryColor")
    
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
    
    fileprivate func layout() {
        var tabFrame = tabBar.frame
        tabFrame.size.height = 100
        tabFrame.origin.y = view.frame.size.height - 100
        tabBar.frame = tabFrame
    }
    
    fileprivate func simpleAnimation(_ item: UITabBarItem) {
        guard let item = item.value(forKey: "view") as? UIView else { return }
        
        let propertyAnimator = UIViewPropertyAnimator(duration: 0.5, dampingRatio: 0.5) {
            item.transform = CGAffineTransform.identity.scaledBy(x: 0.9, y: 0.9)
        }
        
        propertyAnimator.addAnimations({
            item.transform = .identity
        }, delayFactor: 0.5)
        propertyAnimator.startAnimation()
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        super.tabBar(tabBar, didSelect: item)
        simpleAnimation(item)
    }
}

