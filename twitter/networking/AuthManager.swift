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
    
    func regUser(with name: String, email: String, password: String) -> AnyPublisher<User, Error> {
        return Future<User, Error> { promise in
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let error = error {
                    promise(.failure(error))
                } else if let user = authResult?.user {
                    let changeRequest = user.createProfileChangeRequest()
                    changeRequest.displayName = name
                    changeRequest.commitChanges { error in
                        if let error = error {
                            promise(.failure(error))
                        } else {
                            promise(.success(user))
                        }
                    }
                }
            }
        }
        .eraseToAnyPublisher()
    }
    
    func loginUser(email: String, password: String) -> AnyPublisher<User, Error> {
        return Future<User, Error> { promise in
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if let error = error {
                    promise(.failure(error))
                    print("KEEE")
                } else if let user = authResult?.user {
                    // Store the name and userName in the UserManager singleton
                    UserManager.shared.name = UserManager.shared.name
                    UserManager.shared.userName = UserManager.shared.userName
                    
                    promise(.success(user))
                    print("IJYGVIGUVIU")
                } else {
                    promise(.failure(NSError(domain: "LoginError", code: 0, userInfo: [NSLocalizedDescriptionKey: "User not found"])))
                    print("IYUGVJUFYV")
                }
            }
        }
        .eraseToAnyPublisher()
    }


}
