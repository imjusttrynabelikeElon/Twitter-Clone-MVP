//
//  profileViewLogic.swift
//  twitter
//
//  Created by Karon Bell on 5/23/23.
//

import Foundation
import UIKit


//
protocol EditProfileDelegate: AnyObject {
    func didUpdateProfileImage(_ image: UIImage?)
    func didUpdateName(_ name: String)
    func didUpdateBio(_ bio: String)
    func didUpdateLocation(_ location: String)
    func didUpdateLink(_ link: String)
}
protocol ProfileDataDelegate: AnyObject {
    func updateName(_ name: String)
    func updateBio(_ bio: String)
    func updateLocation(_ location: String)
    func updateLink(_ link: String)
        
}


class EditProfileView: UIViewController, UITextFieldDelegate, UITextViewDelegate {
    
    
    
    var editProfileVM: editProfileViewModel!
    
    var editProfileDataVC: editProfileData!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(editProfileVM.view)
        
        editProfileDataVC.saveButton?.isEnabled = false // Disable initially
        editProfileVM.configureTitleLabel()
        editProfileVM.configureProfileImagePic()
        editProfileVM.configureTwitterProfileImageViewHeader()
        editProfileVM.configureLocationTextField()
        editProfileVM.configureNameTextField() // Add this line to call the name text field configuration
        editProfileVM.configureBioTextView() // Add this line to call the bio text view configuration
        editProfileVM.configureLinkTextField()

        // Retrieve the saved values from UserDefaults
         if let savedName = UserDefaults.standard.string(forKey: "name") {
             editProfileDataVC.self.name = savedName
           //  nameTextField?.text = savedName // Update the name text field with the saved name
         }
              
         if let savedBio = UserDefaults.standard.string(forKey: "bio") {
             editProfileDataVC.self.bio = savedBio
           //  bioTextView?.text = savedBio // Update the bio text view with the saved bio
            }

        
        if let savedLocation = UserDefaults.standard.string(forKey: "location") {
            editProfileDataVC.self.location = savedLocation
       //     lo.text = savedBio // Update the bio text view with the saved bio
           }
        
        if let savedLink = UserDefaults.standard.string(forKey: "link") {
            editProfileDataVC.self.link = savedLink
        }

      
        view.backgroundColor = .black
        
    
    }
    


}
