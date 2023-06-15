//
//  RegisterViewViewModel.swift
//  twitter
//
//  Created by Karon Bell on 6/15/23.
//

import Foundation



final class RegisterViewViewModel: ObservableObject {

    @Published var name: String!
    @Published var email: String!
    @Published var password: String!
    @Published var isRegistrationFormValid: Bool = false
    
   
    
    func validateRegistrationForm() {
        // Add your validation logic here
    }
}
