//
//  AppDelegate.swift
//  Navigation
//
//  Created by Владислав Ковальский on 10.04.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = setupTabBarController()
        window?.makeKeyAndVisible()
        return true
    }
    
    func setupFeedViewController() -> UINavigationController {
        let feedViewController = FeedViewController()
        feedViewController.tabBarItem.title = "Лента"
        feedViewController.tabBarItem = UITabBarItem(title: "Лента", image: UIImage(systemName: "doc.richtext"), tag: 0)
        return UINavigationController(rootViewController: feedViewController)
    }
    
    func setupProfileViewController() -> UINavigationController {
    let profileViewController = ProfileViewController()
    profileViewController.title = "Профиль"
    profileViewController.tabBarItem = UITabBarItem(title: "Профиль", image: UIImage(systemName: "person.circle"), tag: 1)
    return UINavigationController(rootViewController: profileViewController)
        
    }
    
    func setupTabBarController() -> UITabBarController {
        let tabBarController = UITabBarController()
        UITabBar.appearance().backgroundColor = .systemGray
        tabBarController.viewControllers = [setupFeedViewController(), setupProfileViewController()]
        return tabBarController
    }


}

