//
//  RegisterViewViewModel.swift
//  twitter
//
//  Created by Karon Bell on 6/15/23.
//

import Foundation
import Firebase
import Combine


final class RegisterViewViewModel: ObservableObject {

    @Published var name: String?
    @Published var email: String?
    @Published var password: String?
    @Published var isRegistrationFormValid: Bool = false
    @Published var user: User?
    @Published var error: String?
    
    private var sub: Set<AnyCancellable> = []

    func validateRegistrationForm() {
        guard let email = email,
              let password = password,
              let name = name else {
            isRegistrationFormValid = false
            return
        }
        
        // Add your validation logic here
        let isEmailValid = isValidEmail(email) && email.hasSuffix(".com")
        isRegistrationFormValid = isEmailValid && password.count >= 8 && name.count >= 3
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func createUser() {
        guard let email = email,
              let name = name,
              let password = password else {
            return
        }
        
        AuthManager.shared.regUser(with: name, email: email, password: password)
            .sink { [weak self] comp in

                if case .failure(let error) = comp {
                    self?.error = error.localizedDescription
                     
                }
            } receiveValue: { [weak self] user in
                self?.user = user
                
                
            
            }
            .store(in: &sub)

    }
    
    
 

}
