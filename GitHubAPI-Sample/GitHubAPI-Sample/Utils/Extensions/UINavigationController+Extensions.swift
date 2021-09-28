//
//  UINavigationController+Extensions.swift
//  GitHubAPI-Sample
//
//  Created by taehy.k on 2021/09/28.
//

import UIKit

extension UINavigationController {
    public func configureTabBar(title: String, systemImageName: String) {
        let tabBarItemImage = UIImage(systemName: systemImageName)
        tabBarItem = UITabBarItem(title: title,
                                  image: tabBarItemImage?.withRenderingMode(.alwaysTemplate),
                                  selectedImage: tabBarItemImage)
    }
}
