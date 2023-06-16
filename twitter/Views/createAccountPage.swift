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
        email.addTarget(self, action: #selector(didChangeEmail), for: .editingChanged)
        password.addTarget(self, action: #selector(didChangePassword), for: .editingChanged)
        Name.addTarget(self, action: #selector(didChangeName), for: .editingChanged)
        viewModel.$isRegistrationFormValid.sink { [weak self] validationState in
            self?.nextButton.isEnabled = validationState
        }
        .store(in: &subs)
    }
    @objc func nextButtonn() {
       
    }

}
