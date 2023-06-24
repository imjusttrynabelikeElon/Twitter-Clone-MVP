//
//  UserManager.swift
//  twitter
//
//  Created by Karon Bell on 6/24/23.
//

import Foundation


class UserManager {
    static let shared = UserManager()
    private init() {}
    
    var name: String?
    
    var userName: String?
}
