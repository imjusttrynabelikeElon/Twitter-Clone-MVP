//
//  loginViewModel.swift
//  twitter
//
//  Created by Karon Bell on 6/15/23.
//
//
import Foundation
import Combine
import Firebase

 class logininViewModel: ObservableObject {
    
    @Published var email: String?
    @Published var password: String?
    @Published var isRegistrationFormValid: Bool = false
    @Published var error: String?
    @Published var user: User?
    
    private var sub: Set<AnyCancellable> = []
    
    
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
    
    func loginUser() {
        guard let email = email,
              let password = password else {
            return
        }
        
        AuthManager.shared.loginUser(email: email, password: password)
            .sink { [weak self] comp in
                
                
                if case .failure(let error) = comp {
                    self?.error = error.localizedDescription
                    print("IUGIUGIUI")
                
                }
                
            } receiveValue: { [weak self] user in
                self?.user = user
                print("JYFGUCV")
            }
            .store(in: &sub)
    }
    
}
