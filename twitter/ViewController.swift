//
//  ViewController.swift
//  twitter
//
//  Created by Karon Bell on 4/30/23.
//

import UIKit


class TwitterHomePage: UIViewController {

    var currentLineView: UIView?

    let tableViewContainer = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

     

        
        let tabBarController = CustomTabBarController()
        tabBarController.delegate = self

        let forYouTabBarItem = CustomTabBarItem(
            title: "For you",
            image: UIImage(named: "forYouImage"),
            selectedImage: UIImage(named: "forYouImageSelected")
        )
        let followingTabBarItem = CustomTabBarItem(
            title: "Following",
            image: UIImage(named: "followingImage"),
            selectedImage: UIImage(named: "followingImageSelected")
        )

        
        let homeViewController = UIViewController()
        homeViewController.tabBarItem = forYouTabBarItem

        let followingViewController = UIViewController()
        followingViewController.tabBarItem = followingTabBarItem

        tabBarController.viewControllers = [homeViewController, followingViewController]

        addChild(tabBarController)

        view.addSubview(tabBarController.view)
        tabBarController.view.translatesAutoresizingMaskIntoConstraints = false
      
    
//
      
        tableViewContainer.translatesAutoresizingMaskIntoConstraints = false
        tableViewContainer.isUserInteractionEnabled = true
        view.addSubview(tableViewContainer)

        let twitterHomeFeedViewController = twitterHomeFeedTableView(style: .plain)
        addChild(twitterHomeFeedViewController)
        twitterHomeFeedViewController.view.translatesAutoresizingMaskIntoConstraints = false
        tableViewContainer.addSubview(twitterHomeFeedViewController.view)

        NSLayoutConstraint.activate([
            twitterHomeFeedViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            twitterHomeFeedViewController.view.topAnchor.constraint(equalTo: tabBarController.view.bottomAnchor),
            twitterHomeFeedViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            twitterHomeFeedViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        NSLayoutConstraint.activate([
            tabBarController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tabBarController.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tabBarController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tabBarController.view.heightAnchor.constraint(equalToConstant: 23),

            tableViewContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableViewContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableViewContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableViewContainer.topAnchor.constraint(equalTo: tabBarController.view.bottomAnchor, constant: 10)
        ])
        let twitterLogoImageView = UIImageView(image: UIImage(named: "twitterLogo"))
        twitterLogoImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(twitterLogoImageView)

        NSLayoutConstraint.activate([
            twitterLogoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            twitterLogoImageView.bottomAnchor.constraint(equalTo: view.topAnchor, constant: 97),
            twitterLogoImageView.widthAnchor.constraint(equalToConstant: 59),
            twitterLogoImageView.heightAnchor.constraint(equalToConstant: 34)
        ])

        let addTweetButton = UIButton()
        addTweetButton.setImage(UIImage(named: "addTweet"), for: .normal)
        addTweetButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(addTweetButton)

        NSLayoutConstraint.activate([
            addTweetButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 143),
            addTweetButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -25),
            addTweetButton.widthAnchor.constraint(equalToConstant: 95),
            addTweetButton.heightAnchor.constraint(equalToConstant: 77)
        ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Reload the data in the table view if the "For you" tab bar item is reselected
        if let tabBarController = self.tabBarController,
           tabBarController.selectedIndex == 0,
           let navigationController = tabBarController.selectedViewController as? UINavigationController,
           navigationController.topViewController is twitterHomeFeedTableView {
            if let tableView = (navigationController.topViewController as? twitterHomeFeedTableView)?.tableView {
                tableView.reloadData()
            }
        }
    }

}



extension TwitterHomePage: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        // Remove any existing blue line views
        currentLineView?.removeFromSuperview()
        
       
        // Check if the selected view controller is the one for the "For you" tab bar item
        if tabBarController.selectedIndex == 0 {
            // Show the table view container
            tableViewContainer.isHidden = false
            
            // Reload the data in the table view
            if let twitterHomeFeedVC = viewController as? twitterHomeFeedTableView {
                twitterHomeFeedVC.tableView.reloadData()
            }
            
            // Add a blue line below the selected tab bar item
            let itemWidth = tabBarController.tabBar.frame.width / CGFloat(tabBarController.tabBar.items?.count ?? 3)
            let lineWidth: CGFloat = 165
            let lineX = itemWidth * CGFloat(tabBarController.selectedIndex) + (itemWidth - lineWidth) / 2
            let lineY = tabBarController.tabBar.frame.height - 0
            
            let lineView = UIView(frame: CGRect(x: lineX, y: lineY, width: lineWidth, height: 2))
            lineView.backgroundColor = UIColor.systemBlue
            tabBarController.tabBar.addSubview(lineView)
            
            // Keep a reference to the current line view
            currentLineView = lineView
        } else {
            // Hide the table view container
            tableViewContainer.isHidden = true
            
            // Add a blue line below the selected tab bar item
            let itemWidth = tabBarController.tabBar.frame.width / CGFloat(tabBarController.tabBar.items?.count ?? 3)
            let lineWidth: CGFloat = 165
            let lineX = itemWidth * CGFloat(tabBarController.selectedIndex) + (itemWidth - lineWidth) / 2
            let lineY = tabBarController.tabBar.frame.height - 0
            
            let lineView = UIView(frame: CGRect(x: lineX, y: lineY, width: lineWidth, height: 2))
            lineView.backgroundColor = UIColor.systemBlue
            tabBarController.tabBar.addSubview(lineView)
            
            // Keep a reference to the current line view
            currentLineView = lineView
        }
    }

}

//
