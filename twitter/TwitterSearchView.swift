//
//  TwitterSearchView.swift
//  twitter
//
//  Created by Karon Bell on 5/1/23.
//

import Foundation
import UIKit
//

class TwitterSearchView: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        view.backgroundColor = .white
        configureSearchButton()
    }
    
    private func configureSearchButton() {
        let searchButton = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(searchButtonTapped))
        navigationItem.rightBarButtonItem = searchButton
    }
    
    @objc private func searchButtonTapped() {
        // Handle search button tap event
        print("search button tapped")
    }
}
