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
    
    // Other properties and methods
    
    // ...
}
