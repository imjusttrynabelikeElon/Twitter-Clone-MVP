//
//  loginViewModel.swift
//  twitter
//
//  Created by Karon Bell on 6/15/23.
//

import Foundation

final class logininViewModel: ObservableObject {
    
    @Published var email: String?
    @Published var password: String?
    @Published var isRegistrationFormValid: Bool = false
    
    
    
    func validateRegistrationForm() {
        guard let email = email,
              let password = password else {
            isRegistrationFormValid = false
            return
        }
        let isEmailValid = isValidEmail(email) && email.hasSuffix(".com")
        isRegistrationFormValid = isEmailValid && password.count >= 8 
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    
}
