//
//  editProfileModel.swift
//  twitter
//
//  Created by Karon Bell on 5/27/23.
//

import Foundation
import UIKit

struct editProfileData {
    
    weak var delegatee: ProfileDataDelegate?
    weak var delegate: EditProfileDelegate?
    
    
    var updatedName: String? // Store the updated name
    var updatedBio: String? // Store the updated bio
     
    var name: String?
    var bio: String?
    var saveButton: UIBarButtonItem?
    
    var nameTextField: UITextField?
    var bioTextView: UITextView?
    
    var profileImagePic: UIImageView?
  
    var twitterProfileImageViewHeader: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Edit Profile"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
    
}



