//
//  createAccountPage.swift
//  twitter
//
//  Created by Karon Bell on 5/2/23.
//

import Foundation
import UIKit
import Combine

class createAccountPage: UIViewController {
    
    
    private var viewModel = RegisterViewViewModel()
    private var subs: Set<AnyCancellable> = []
    
    @IBOutlet weak var Name: UITextField!
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextButton.isEnabled = false
        nextButton.addTarget(self, action: #selector(nextButtonn), for: .touchUpInside)
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapToDismiss)))
        bindViews()
    }
    
    @objc func didTapToDismiss() {
        view.endEditing(true)
    }
    
    @objc private func didChangeEmail() {
        viewModel.email = email.text
        viewModel.validateRegistrationForm()
    }
    
    @objc private func didChangePassword() {
        viewModel.password = password.text
        viewModel.validateRegistrationForm()
        
    }
    @objc private func didChangeName() {
        viewModel.name = Name.text!
        viewModel.validateRegistrationForm()
    }
    private func bindViews() {
        
       
            if let email = email {
                email.addTarget(self, action: #selector(didChangeEmail), for: .editingChanged)
            } else {
                print("email is nil")
            }
         
            if let password = password {
                password.addTarget(self, action: #selector(didChangePassword), for: .editingChanged)
            } else {
                print("password is nil")
            }
           
           
            viewModel.$isRegistrationFormValid.sink { [weak self] validationState in
                
                if let nextButton = self!.nextButton {
                    self?.nextButton.isEnabled = validationState
                } else {
                    print("button is nil")
                }
               
            }
            .store(in: &subs)
            
        
        email.addTarget(self, action: #selector(didChangeEmail), for: .editingChanged)
        password.addTarget(self, action: #selector(didChangePassword), for: .editingChanged)
        Name.addTarget(self, action: #selector(didChangeName), for: .editingChanged)
        viewModel.$isRegistrationFormValid.sink { [weak self] validationState in
            self?.nextButton.isEnabled = validationState
        }
        .store(in: &subs)
        
        viewModel.$user.sink { [weak self] user in
            print(user)
        }
        .store(in: &subs)
    }
    @objc func nextButtonn() {
        
        viewModel.createUser()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
      
        let vc1 = storyboard.instantiateViewController(withIdentifier: "tabBar")
        vc1.modalPresentationStyle = .fullScreen // set the modalPresentationStyle
        self.present(vc1, animated: true, completion: nil)
        
       
        
        print("Next hit")
    }

}
