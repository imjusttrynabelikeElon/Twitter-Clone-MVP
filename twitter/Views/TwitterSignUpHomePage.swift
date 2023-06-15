//
//  TwitterSignUpHomePage.swift
//  twitter
//
//  Created by Karon Bell on 5/1/23.
//



import Foundation
import UIKit
import FirebaseAuth


class TwitterSignUpHomePage: UIViewController {
    
    
    @IBOutlet weak var continueWithGoogleButton: UIButton!
    
    @IBOutlet weak var continueWithAppleButton: UIButton!
    
    @IBOutlet weak var createAccountButton: UIButton!
    
    @IBOutlet weak var termsPrivacyPolicy: UIButton!
    
    @IBOutlet weak var cookieUse: UIButton!
    
    @IBOutlet weak var alreadyHaveAnAccount: UIButton!
    
    @IBOutlet weak var nextButton: UIButton!
    
    
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
     
        if let nextButton = nextButton  {
            // this if let allows the code to work becuase to start the button is nil and once we get to the button it will set it to nextButton so it could work.
              nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
            
       
            
        } else {
            print("nextButton is nil!")
        }
        
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

  

}
