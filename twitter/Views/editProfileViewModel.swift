//
//  editProfileViewModel.swift
//  twitter
//
//  Created by Karon Bell on 5/28/23.
//

import Foundation
import UIKit


class editProfileViewModel: UIViewController, UITextFieldDelegate, UITextViewDelegate {
    
    var editProfileDataVM = editProfileData()
    
    weak var delegatee: ProfileDataDelegate?
    weak var delegate: EditProfileDelegate?
    
    
    var updatedName: String? // Store the updated name
    var updatedBio: String? // Store the updated bio
    
    var name: String?
    var bio: String?
    var saveButton: UIBarButtonItem?
    
    var nameTextField: UITextField?
    var bioTextView: UITextView?
    
    init(profileImage: UIImage?, twitterImageHeaderView: UIImage?) {
         super.init(nibName: nil, bundle: nil)
         if let image = profileImage {
             editProfileDataVM.profileImagePic = UIImageView(image: image)
         }
         if let headerImage = twitterImageHeaderView {
             editProfileDataVM.twitterProfileImageViewHeader.image = headerImage
         }
     }
     
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        // Initialize any required properties
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
      
        configureTitleLabel()
        configureProfileImagePic()
        configureTwitterProfileImageViewHeader()
        
        configureNameTextField() // Add this line to
        configureBioTextView() // Add this line to c
     
        // Retrieve the saved values from UserDefaults
         if let savedName = UserDefaults.standard.string(forKey: "name") {
             editProfileDataVM.name = savedName
           //  nameTextField?.text = savedName // Update the name text field with the saved name
         }
              
         if let savedBio = UserDefaults.standard.string(forKey: "bio") {
             editProfileDataVM.bio = savedBio
           //  bioTextView?.text = savedBio // Update the bio text view with the saved bio
            }
       
        // Add cancel button
         let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelButtonTapped))
         cancelButton.tintColor = .white
         navigationItem.leftBarButtonItem = cancelButton
         
         // Add save button
        editProfileDataVM.saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveButtonTapped))
        editProfileDataVM.saveButton?.isEnabled = false // Disable initially
        editProfileDataVM.saveButton?.tintColor = .white
        navigationItem.rightBarButtonItem = editProfileDataVM.saveButton
              

    }
    
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        editProfileDataVM.saveButton?.isEnabled = true // Enable the save button
        print(textField.text as Any)
        }
    
  
    func textViewDidBeginEditing(_ textView: UITextView) {
        editProfileDataVM.saveButton?.isEnabled = true
        print(textView.text as Any)
    }
      // ...
    
    
    
    @objc func saveButtonTapped() {
        if let updatedName = updatedName, let updatedBio = updatedBio {
            // Call the delegate methods to pass the updated data
            editProfileDataVM.delegate?.didUpdateName(updatedName)
            editProfileDataVM.delegatee?.updateBio(updatedBio)
            
            // Update the stored values
            editProfileDataVM.self.name = updatedName
            editProfileDataVM.self.bio = updatedBio
            
            // Save the updated values to UserDefaults
            UserDefaults.standard.set(updatedName, forKey: "name")
            UserDefaults.standard.set(updatedBio, forKey: "bio")
            UserDefaults.standard.synchronize() // Synchronize UserDefaults
            
            editProfileDataVM.saveButton?.isEnabled = false // Disable the save button again after saving
            
            // Update the text fields with the updated values
            editProfileDataVM.nameTextField?.text = updatedName
            editProfileDataVM.bioTextView?.text = updatedBio
        } else {
            editProfileDataVM.saveButton?.title = "Save"
            editProfileDataVM.saveButton?.isEnabled = true // Enable the save button
            
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
    
    
    
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Edit Profile"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
  
            
          
    
        
        
    func configureNameTextField() {
            // Create and add name text field
        editProfileDataVM.nameTextField = UITextField()
        editProfileDataVM.nameTextField!.delegate = self // Set the delegate to self
        editProfileDataVM.nameTextField!.placeholder = "Name"
        editProfileDataVM.nameTextField!.borderStyle = .roundedRect
        editProfileDataVM.nameTextField!.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(editProfileDataVM.nameTextField!)
            NSLayoutConstraint.activate([
                editProfileDataVM.nameTextField!.topAnchor.constraint(equalTo: editProfileDataVM.twitterProfileImageViewHeader.bottomAnchor, constant: 81),
                editProfileDataVM.nameTextField!.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                editProfileDataVM.nameTextField!.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                editProfileDataVM.nameTextField!.heightAnchor.constraint(equalToConstant: 40)
            ])

            
            // Add label above name text field
              let nameLabel = UILabel()
              nameLabel.text = "Name"
              nameLabel.textColor = .white
              nameLabel.translatesAutoresizingMaskIntoConstraints = false
              view.addSubview(nameLabel)
              NSLayoutConstraint.activate([
                nameLabel.bottomAnchor.constraint(equalTo: editProfileDataVM.nameTextField!.topAnchor, constant: -8),
                nameLabel.leadingAnchor.constraint(equalTo: editProfileDataVM.nameTextField!.leadingAnchor),
                nameLabel.trailingAnchor.constraint(equalTo: editProfileDataVM.nameTextField!.trailingAnchor)
              ])
            
            // Assign initial value to nameTextField
        editProfileDataVM.nameTextField!.text = name

            // Add an observer for the text field's text property to detect changes
        editProfileDataVM.nameTextField!.addTarget(self, action: #selector(nameTextFieldDidChange(_:)), for: .editingChanged)
        }



    
    
    @objc func nameTextFieldDidChange(_ textField: UITextField) {
        if let text = textField.text {
            editProfileDataVM.updatedName = text // Update the updatedName property with the updated text
            editProfileDataVM.delegate?.didUpdateName(text)
            
            print(textField.text as Any)
            
            // Update the name text field
         //nameTextField?.text = text
        }
    }
   
    func configureBioTextView() {
           // Create and add bio text view
        editProfileDataVM.bioTextView = UITextView()
        editProfileDataVM.bioTextView!.delegate = self // Set the delegate to self
        editProfileDataVM.bioTextView!.text = bio
        editProfileDataVM.bioTextView!.layer.borderWidth = 1
        editProfileDataVM.bioTextView!.layer.borderColor = UIColor.lightGray.cgColor
        editProfileDataVM.bioTextView!.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(editProfileDataVM.bioTextView!)
           NSLayoutConstraint.activate([
            editProfileDataVM.bioTextView!.topAnchor.constraint(equalTo: editProfileDataVM.nameTextField!.bottomAnchor, constant: 60),
            editProfileDataVM.bioTextView!.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            editProfileDataVM.bioTextView!.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            editProfileDataVM.bioTextView!.heightAnchor.constraint(equalToConstant: 100)
           ])
           
           // Add label above bio text view
            let bioLabel = UILabel()
            bioLabel.text = "Bio"
            bioLabel.textColor = .white
            bioLabel.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(bioLabel)
            NSLayoutConstraint.activate([
                bioLabel.bottomAnchor.constraint(equalTo: editProfileDataVM.bioTextView!.topAnchor, constant: -8),
                bioLabel.leadingAnchor.constraint(equalTo: editProfileDataVM.bioTextView!.leadingAnchor),
                bioLabel.trailingAnchor.constraint(equalTo: editProfileDataVM.bioTextView!.trailingAnchor)
            ])
            

           // Add an observer for the text view's text property to detect changes
        editProfileDataVM.bioTextView!.delegate = self
       }



    func configureTwitterProfileImageViewHeader() {
        view.addSubview(editProfileDataVM.twitterProfileImageViewHeader)
        
        NSLayoutConstraint.activate([
            editProfileDataVM.twitterProfileImageViewHeader.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            editProfileDataVM.twitterProfileImageViewHeader.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            editProfileDataVM.twitterProfileImageViewHeader.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            editProfileDataVM.twitterProfileImageViewHeader.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
    
      

   
   func configureProfileImagePic() {
       if let profileImageView =  editProfileDataVM.profileImagePic {
           editProfileDataVM.twitterProfileImageViewHeader.addSubview(profileImageView)
           
           profileImageView.contentMode = .scaleAspectFill
           profileImageView.translatesAutoresizingMaskIntoConstraints = false
           
           NSLayoutConstraint.activate([
            profileImageView.bottomAnchor.constraint(equalTo: editProfileDataVM.twitterProfileImageViewHeader.bottomAnchor, constant: 33),
            profileImageView.leadingAnchor.constraint(equalTo: editProfileDataVM.twitterProfileImageViewHeader.leadingAnchor, constant: 20),
               profileImageView.widthAnchor.constraint(equalToConstant: 70),
               profileImageView.heightAnchor.constraint(equalToConstant: 70)
           ])
           
           // Set corner radius to make the image view a circle
           profileImageView.layer.cornerRadius = 35
           profileImageView.clipsToBounds = true
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
  
    @objc func cancelButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    
    
}
