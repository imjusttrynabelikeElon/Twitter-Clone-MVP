//
//  UserManager.swift
//  twitter
//
//  Created by Karon Bell on 6/24/23.
//

import Foundation
import UIKit

class UserManager {
    static let shared = UserManager()
    private init() {}
    
    var name: String?
    var userName: String?
    var bio: String?
    var profileImage: UIImageView? // Update the type to UIImageView
    var location: String?
    var locationTextField: UITextField? // Add a reference to the location text field
    var link: String?
    var linkTextField: UITextField?
    // Other properties and methods
    
    // ...
}
//
