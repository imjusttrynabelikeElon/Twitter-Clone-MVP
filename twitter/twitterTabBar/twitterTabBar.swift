//
//  twitterTabBar.swift
//  twitter
//
//  Created by Karon Bell on 5/1/23.
//

import Foundation
import UIKit

class TwitterTabBarContainer: UIViewController {
    
    private let tabBar = TwitterTabBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addChild(tabBar)
        view.addSubview(tabBar.view)
        tabBar.view.frame = view.bounds
        tabBar.didMove(toParent: self)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tabBar.view.frame = view.bounds
    }
}



class TwitterTabBar: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homeVC = TwitterHomePage()
        let searchVC = TwitterSearchView()
        let notificationsVC = TwitterNotificationView()
        let messagesVC =  DirectMessagesView()
        
        homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
        searchVC.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), tag: 1)
        notificationsVC.tabBarItem = UITabBarItem(title: "Notifications", image: UIImage(systemName: "bell"), tag: 2)
        messagesVC.tabBarItem = UITabBarItem(title: "Messages", image: UIImage(systemName: "envelope"), tag: 3)
        
        let tabBarList = [homeVC, searchVC, notificationsVC, messagesVC]
        viewControllers = tabBarList.map { UINavigationController(rootViewController: $0) }
    }

}
//
