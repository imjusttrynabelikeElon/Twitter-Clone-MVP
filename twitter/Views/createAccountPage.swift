//
//  createAccountPage.swift
//  twitter
//
//  Created by Karon Bell on 5/2/23.
//

import Foundation
import UIKit


class createAccountPage: UIViewController {
    
    
    private var viewModel = RegisterViewViewModel()
    
    @IBOutlet weak var Name: UITextField!
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        nextButton.addTarget(self, action: #selector(nextButtonn), for: .touchUpInside)
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
    }
    
    @objc func nextButtonn() {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
      
        let vc2 = storyboard.instantiateViewController(withIdentifier: "tabBar")
        vc2.modalPresentationStyle = .fullScreen // set the modalPresentationStyle
        nextButton.isEnabled = false
        self.present(vc2, animated: true, completion: nil)
        
    }
}
