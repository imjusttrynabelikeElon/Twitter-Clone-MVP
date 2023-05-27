//
//  profileViewLogic.swift
//  twitter
//
//  Created by Karon Bell on 5/23/23.
//

import Foundation
import UIKit



protocol EditProfileDelegate: AnyObject {
    func didUpdateProfileImage(_ image: UIImage?)
    func didUpdateName(_ name: String)
    func didUpdateBio(_ bio: String)
}
protocol ProfileDataDelegate: AnyObject {
    func updateName(_ name: String)
    func updateBio(_ bio: String)
        
}

class EditProfileView: UIViewController, UITextFieldDelegate, UITextViewDelegate {
    
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
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Edit Profile"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var twitterProfileImageViewHeader: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    init(profileImage: UIImage?, twitterImageHeaderView: UIImage?) {
        super.init(nibName: nil, bundle: nil)
        if let image = profileImage {
            profileImagePic = UIImageView(image: image)
        }
        if let headerImage = twitterImageHeaderView {
            twitterProfileImageViewHeader.image = headerImage
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
                                                                   
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        
        saveButton?.isEnabled = false // Disable initially
        
        
        configureTitleLabel()
        configureProfileImagePic()
        configureTwitterProfileImageViewHeader()
        configureNameTextField() // Add this line to call the name text field configuration
        configureBioTextView() // Add this line to call the bio text view configuration
    
        // Retrieve the saved values from UserDefaults
         if let savedName = UserDefaults.standard.string(forKey: "name") {
             self.name = savedName
           //  nameTextField?.text = savedName // Update the name text field with the saved name
         }

         if let savedBio = UserDefaults.standard.string(forKey: "bio") {
             self.bio = savedBio
           //  bioTextView?.text = savedBio // Update the bio text view with the saved bio
         }

        
        view.backgroundColor = .black
        
        // Add cancel button
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelButtonTapped))
        cancelButton.tintColor = .white
        navigationItem.leftBarButtonItem = cancelButton
        
        // Add save button
             saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveButtonTapped))
             saveButton?.isEnabled = false // Disable initially
             saveButton?.tintColor = .white
             navigationItem.rightBarButtonItem = saveButton
             
      
        
        
    }
    
    // UITextFieldDelegate method called when editing begins in the text field
    func textFieldDidBeginEditing(_ textField: UITextField) {
            saveButton?.isEnabled = true // Enable the save button
        print(textField.text as Any)
        }
    
  
    func textViewDidBeginEditing(_ textView: UITextView) {
        saveButton?.isEnabled = true
        print(textView.text as Any)
    }
      // ...
    
    
    @objc func cancelButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    @objc func saveButtonTapped() {
        if let updatedName = updatedName, let updatedBio = updatedBio {
            // Call the delegate methods to pass the updated data
            delegate?.didUpdateName(updatedName)
            delegatee?.updateBio(updatedBio)
            
            // Update the stored values
            self.name = updatedName
            self.bio = updatedBio
            
            // Save the updated values to UserDefaults
            UserDefaults.standard.set(updatedName, forKey: "name")
            UserDefaults.standard.set(updatedBio, forKey: "bio")
            UserDefaults.standard.synchronize() // Synchronize UserDefaults
            
            saveButton?.isEnabled = false // Disable the save button again after saving
            
            // Update the text fields with the updated values
            nameTextField?.text = updatedName
            bioTextView?.text = updatedBio
        } else {
            saveButton?.title = "Save"
            saveButton?.isEnabled = true // Enable the save button
            
        }
    }


    func configureTitleLabel() {
        view.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -51), // Adjust the constant value
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    func configureTwitterProfileImageViewHeader() {
        view.addSubview(twitterProfileImageViewHeader)
        
        NSLayoutConstraint.activate([
            twitterProfileImageViewHeader.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            twitterProfileImageViewHeader.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            twitterProfileImageViewHeader.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            twitterProfileImageViewHeader.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    @objc func nameTextFieldDidChange(_ textField: UITextField) {
        if let text = textField.text {
            updatedName = text // Update the updatedName property with the updated text
            delegate?.didUpdateName(text)
            
            print(textField.text as Any)
            
            // Update the name text field
         //nameTextField?.text = text
        }
    }
    
    

    func textViewDidChange(_ textView: UITextView) {
       
        print(textView.text as Any)
        updatedBio = textView.text
        delegate?.didUpdateBio(textView.text)
    }


    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if var text = textField.text {
        //    text = updatedName!
            delegate?.didUpdateName(text)
        }
        
        saveButton?.isEnabled = true
      }

      func textViewDidEndEditing(_ textView: UITextView) {
         
      }
    
    func saveChanges() {
          if let name = updatedName {
              UserDefaults.standard.set(name, forKey: "name")
              delegatee?.updateName(name) // Notify the delegate of the updated name
          }

          if let bio = updatedBio {
              UserDefaults.standard.set(bio, forKey: "bio")
              delegatee?.updateBio(bio) // Notify the delegate of the updated bio
          }

          UserDefaults.standard.synchronize()
      }
  
    func configureNameTextField() {
            // Create and add name text field
            nameTextField = UITextField()
            nameTextField!.delegate = self // Set the delegate to self
            nameTextField!.placeholder = "Name"
            nameTextField!.borderStyle = .roundedRect
            nameTextField!.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(nameTextField!)
            NSLayoutConstraint.activate([
                nameTextField!.topAnchor.constraint(equalTo: twitterProfileImageViewHeader.bottomAnchor, constant: 81),
                nameTextField!.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                nameTextField!.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                nameTextField!.heightAnchor.constraint(equalToConstant: 40)
            ])

            
            // Add label above name text field
              let nameLabel = UILabel()
              nameLabel.text = "Name"
              nameLabel.textColor = .white
              nameLabel.translatesAutoresizingMaskIntoConstraints = false
              view.addSubview(nameLabel)
              NSLayoutConstraint.activate([
                  nameLabel.bottomAnchor.constraint(equalTo: nameTextField!.topAnchor, constant: -8),
                  nameLabel.leadingAnchor.constraint(equalTo: nameTextField!.leadingAnchor),
                  nameLabel.trailingAnchor.constraint(equalTo: nameTextField!.trailingAnchor)
              ])
            
            // Assign initial value to nameTextField
            nameTextField!.text = name

            // Add an observer for the text field's text property to detect changes
            nameTextField!.addTarget(self, action: #selector(nameTextFieldDidChange(_:)), for: .editingChanged)
        }



     func configureBioTextView() {
            // Create and add bio text view
            bioTextView = UITextView()
            bioTextView!.delegate = self // Set the delegate to self
            bioTextView!.text = bio
            bioTextView!.layer.borderWidth = 1
            bioTextView!.layer.borderColor = UIColor.lightGray.cgColor
            bioTextView!.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(bioTextView!)
            NSLayoutConstraint.activate([
                bioTextView!.topAnchor.constraint(equalTo: nameTextField!.bottomAnchor, constant: 60),
                bioTextView!.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                bioTextView!.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                bioTextView!.heightAnchor.constraint(equalToConstant: 100)
            ])
            
            // Add label above bio text view
             let bioLabel = UILabel()
             bioLabel.text = "Bio"
             bioLabel.textColor = .white
             bioLabel.translatesAutoresizingMaskIntoConstraints = false
             view.addSubview(bioLabel)
             NSLayoutConstraint.activate([
                 bioLabel.bottomAnchor.constraint(equalTo: bioTextView!.topAnchor, constant: -8),
                 bioLabel.leadingAnchor.constraint(equalTo: bioTextView!.leadingAnchor),
                 bioLabel.trailingAnchor.constraint(equalTo: bioTextView!.trailingAnchor)
             ])
             

            // Add an observer for the text view's text property to detect changes
            bioTextView!.delegate = self
        }


         
       

    
    func configureProfileImagePic() {
        if let profileImageView = profileImagePic {
            twitterProfileImageViewHeader.addSubview(profileImageView)
            
            profileImageView.contentMode = .scaleAspectFill
            profileImageView.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                profileImageView.bottomAnchor.constraint(equalTo: twitterProfileImageViewHeader.bottomAnchor, constant: 33),
                profileImageView.leadingAnchor.constraint(equalTo: twitterProfileImageViewHeader.leadingAnchor, constant: 20),
                profileImageView.widthAnchor.constraint(equalToConstant: 70),
                profileImageView.heightAnchor.constraint(equalToConstant: 70)
            ])
            
            // Set corner radius to make the image view a circle
            profileImageView.layer.cornerRadius = 35
            profileImageView.clipsToBounds = true
        }
    }

}
