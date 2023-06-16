//
//  AuthManager.swift
//  twitter
//
//  Created by Karon Bell on 6/15/23.
//

import Foundation
import Firebase
import FirebaseAuthCombineSwift
import Combine


class AuthManager {
    static let shared = AuthManager()
    
    func regUser(with email: String, password: String) -> AnyPublisher<User, Error> {
      return Auth.auth().createUser(withEmail: email, password: password)
            .map(\.user)
            .eraseToAnyPublisher()
    }
}
