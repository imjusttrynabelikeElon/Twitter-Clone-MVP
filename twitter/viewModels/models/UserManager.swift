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
    var bio: String? // New property to hold the bio
    var profileImageData: UIImageView? // New property to hold the profile image data
    
    // Other properties and methods
    
    // ...
}
