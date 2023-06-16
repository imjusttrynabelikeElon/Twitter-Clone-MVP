//
//  TwitterSignUpHomePage.swift
//  twitter
//
//  Created by Karon Bell on 5/1/23.
//



import Foundation
import UIKit
import FirebaseAuth
import Combine

class TwitterSignUpHomePage: UIViewController {
    
    private var viewModel = logininViewModel()
    private var subs: Set<AnyCancellable> = []
    
    @IBOutlet weak var continueWithGoogleButton: UIButton!
    
    @IBOutlet weak var continueWithAppleButton: UIButton!
    
    @IBOutlet weak var createAccountButton: UIButton!
    
    @IBOutlet weak var termsPrivacyPolicy: UIButton!
    
    @IBOutlet weak var cookieUse: UIButton!
    
    @IBOutlet weak var alreadyHaveAnAccount: UIButton!
    
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
    
        if let nextButton = nextButton  {
            // this if let allows the code to work becuase to start the button is nil and once we get to the button it will set it to nextButton so it could work.
              nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
            view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapToDismiss)))
            nextButton.isEnabled = false
            
        } else {
            print("nextButton is nil!")
        }
        
      
      
        bindViews()
       
        
        
    }
    
    
    @objc func nextButtonTapped() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
      
        let vc1 = storyboard.instantiateViewController(withIdentifier: "tabBar")
        vc1.modalPresentationStyle = .fullScreen // set the modalPresentationStyle
        self.present(vc1, animated: true, completion: nil)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        if Auth.auth().currentUser == nil {
             
        }
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
        
    }

}

