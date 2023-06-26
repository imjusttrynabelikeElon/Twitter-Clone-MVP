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
    var updatedLocation: String?
    var updatedLink: String?
    
    var name: String?
    var bio: String?
    var Location: String?
    var link: String?
    
    var saveButton: UIBarButtonItem?
    
    var nameTextField: UITextField?
    var bioTextView: UITextView?
    var LocationTextView: UITextField?
    var linkTextView: UITextField?
    
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
        configureLocationTextField()
        configureLinkTextField()
           saveChanges()
        
       
        // Configure linkTextField...

        UserManager.shared.linkTextField?.text = editProfileDataVM.linkTextField?.text
        UserManager.shared.link = editProfileDataVM.link
        
           // Retrieve the saved values from UserDefaults
           if let savedName = UserDefaults.standard.string(forKey: "name") {
               editProfileDataVM.name = savedName
               // nameTextField?.text = savedName // Update the name text field with the saved name
           }
                 
           if let savedBio = UserDefaults.standard.string(forKey: "bio") {
               editProfileDataVM.bio = savedBio
               // bioTextView?.text = savedBio // Update the bio text view with the saved bio
           }
           
           if let savedLocation = UserDefaults.standard.string(forKey: "location") {
               editProfileDataVM.updatedLocation = savedLocation // Update the updatedLocation property
               editProfileDataVM.locationTextField?.text = savedLocation // Update the location text field with the saved location
               UserManager.shared.locationTextField?.text = savedLocation
           }
        
        
        if let savedLink = UserDefaults.standard.string(forKey: "link") {
            editProfileDataVM.updatedLink = savedLink
            editProfileDataVM.link = savedLink
            editProfileDataVM.linkTextField?.text = savedLink
            UserManager.shared.linkTextField?.text = savedLink
            UserManager.shared.link = savedLink
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
        // Update the corresponding variable with the new text
        if textField == nameTextField {
            editProfileDataVM.updatedName = textField.text
        } else if textField == LocationTextView {
            editProfileDataVM.updatedLocation = textField.text
        } else if textField == linkTextView {
            editProfileDataVM.updatedLink = textField.text
        }
        
        // Enable the save button
        editProfileDataVM.saveButton?.isEnabled = true
    }

    
  
    func textViewDidBeginEditing(_ textView: UITextView) {
        editProfileDataVM.saveButton?.isEnabled = true
        print(textView.text as Any)
    }
      // ...
    

    
    @objc func saveButtonTapped() {
        if let updatedName = updatedName, let updatedBio = updatedBio, let updatedLocation = updatedLocation, let updatedLink = updatedLink {
            // Call the delegate methods to pass the updated data
            delegate?.didUpdateName(updatedName)
            delegatee?.updateBio(updatedBio)
            delegate?.didUpdateLocation(updatedLocation)
            delegatee?.updateLink(updatedLink)
            delegatee?.updateLink(updatedLink)
            
            // Update the stored values
            name = updatedName
            bio = updatedBio
            Location = updatedLocation // Use the variable name "Location"
            link = updatedLink
            
            // Save the updated values to UserDefaults
            UserDefaults.standard.set(updatedName, forKey: "name")
            UserDefaults.standard.set(updatedBio, forKey: "bio")
            UserDefaults.standard.set(updatedLocation, forKey: "location")
            UserDefaults.standard.set(updatedLink, forKey: "link")
            UserDefaults.standard.synchronize()
            
            saveButton?.isEnabled = false
            
            // Update the text fields with the updated values
            nameTextField?.text = updatedName
            bioTextView?.text = updatedBio
            linkTextView?.text = updatedLink
            
            // Update the link text field in editProfileDataVM
            editProfileDataVM.linkTextField?.text = updatedLink
            linkTextView?.text = updatedLink
            
            // Update the link text field in UserManager
            UserManager.shared.linkTextField?.text = updatedLink
        } else {
            saveButton?.title = "Save"
            saveButton?.isEnabled = true
        }
    }


    func configureLocationTextField() {
        // Create and add location text field
        editProfileDataVM.locationTextField = UITextField()
        editProfileDataVM.locationTextField!.delegate = self
        editProfileDataVM.locationTextField!.placeholder = "Location"
        editProfileDataVM.locationTextField!.borderStyle = .roundedRect
        editProfileDataVM.locationTextField!.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(editProfileDataVM.locationTextField!)
        
        // Set the variable name correctly in the constraints
        NSLayoutConstraint.activate([
            editProfileDataVM.locationTextField!.topAnchor.constraint(equalTo: view.topAnchor, constant: 560),
            editProfileDataVM.locationTextField!.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            editProfileDataVM.locationTextField!.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            editProfileDataVM.locationTextField!.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        // Add label above location text field
        let locationLabel = UILabel()
        locationLabel.text = "Location"
        locationLabel.textColor = .white
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(locationLabel)
        
        // Set the variable name correctly in the constraints
        NSLayoutConstraint.activate([
            locationLabel.bottomAnchor.constraint(equalTo: editProfileDataVM.locationTextField!.topAnchor, constant: -8),
            locationLabel.leadingAnchor.constraint(equalTo: editProfileDataVM.locationTextField!.leadingAnchor),
            locationLabel.trailingAnchor.constraint(equalTo: editProfileDataVM.locationTextField!.trailingAnchor)
        ])
        
        // Assign initial value to locationTextField
        editProfileDataVM.locationTextField!.text = Location
        
        // Add an observer for the text field's text property to detect changes
        editProfileDataVM.locationTextField!.addTarget(self, action: #selector(locationTextFieldDidChange(_:)), for: .editingChanged)
    }

    func configureLinkTextField() {
        // Create and add link text field
        editProfileDataVM.linkTextField = UITextField()
        editProfileDataVM.linkTextField!.delegate = self
        editProfileDataVM.linkTextField!.placeholder = "Link"
        editProfileDataVM.linkTextField!.borderStyle = .roundedRect
        editProfileDataVM.linkTextField!.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(editProfileDataVM.linkTextField!)

        // Set the variable name correctly in the constraints
        NSLayoutConstraint.activate([
            editProfileDataVM.linkTextField!.topAnchor.constraint(equalTo: view.topAnchor, constant: 660),
            editProfileDataVM.linkTextField!.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            editProfileDataVM.linkTextField!.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            editProfileDataVM.linkTextField!.heightAnchor.constraint(equalToConstant: 40)
        ])

        // Add label above link text field
        editProfileDataVM.linkLabel.text = "Link" // Assign text to linkLabel
        editProfileDataVM.linkLabel.textColor = .white
        editProfileDataVM.linkLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(editProfileDataVM.linkLabel)

        // Set the variable name correctly in the constraints
        NSLayoutConstraint.activate([
            editProfileDataVM.linkLabel.bottomAnchor.constraint(equalTo: editProfileDataVM.linkTextField!.topAnchor, constant: -8),
            editProfileDataVM.linkLabel.leadingAnchor.constraint(equalTo: editProfileDataVM.linkTextField!.leadingAnchor),
            editProfileDataVM.linkLabel.trailingAnchor.constraint(equalTo: editProfileDataVM.linkTextField!.trailingAnchor)
        ])

        // Assign initial value to linkTextField
        editProfileDataVM.linkTextField!.text = editProfileDataVM.link

        // Add an observer for the text field's text property to detect changes
        editProfileDataVM.linkTextField!.addTarget(self, action: #selector(linkTextFieldDidChange(_:)), for: .editingChanged)
    }

    @objc func linkTextFieldDidChange(_ textField: UITextField) {
        if let text = textField.text {
            editProfileDataVM.updatedLink = text // Update the updatedLink property with the updated text
            editProfileDataVM.delegate?.didUpdateLink(text)
            
            delegate?.didUpdateLink(link!)
            print(textField.text as Any)
            
            // Update the link text field in UserManager
            UserManager.shared.linkTextField?.text = text
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

    @objc func locationTextFieldDidChange(_ textField: UITextField) {
        if let text = textField.text {
            editProfileDataVM.updatedLocation = text // Update the updatedLocation property with the updated text
            editProfileDataVM.delegate?.didUpdateLocation(text)
            
            print(textField.text as Any)
            
            // Update the location text field
            //editProfileDataVM.locationTextField?.text = text
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
        if let text = textField.text {
            if textField == editProfileDataVM.nameTextField {
                editProfileDataVM.updatedName = text // Update the updatedName property
                delegate?.didUpdateName(text) // Notify the delegate of the updated name
                
                
            } else if textField == editProfileDataVM.locationTextField {
                editProfileDataVM.updatedLocation = text // Update the updatedLocation property
                delegate?.didUpdateLocation(text) // Notify the delegate of the updated location
                
                // Save the updated location to UserDefaults
                UserDefaults.standard.set(text, forKey: "location")
                UserDefaults.standard.synchronize()
                
                
            } else if textField == editProfileDataVM.linkTextField {
                editProfileDataVM.updatedLink = text
                editProfileDataVM.link = text
                    delegate?.didUpdateLink(text)
                delegatee?.updateLink(text)
                
                UserDefaults.standard.set(text, forKey: "link")
                UserDefaults.standard.synchronize()
            }
        }
        
        editProfileDataVM.saveButton?.isEnabled = true
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

        if let location = updatedLocation {
            UserDefaults.standard.set(location, forKey: "location")
            delegatee?.updateLocation(location)
          
        }
        
        if let link = updatedLink {
            UserDefaults.standard.set(link, forKey: "link")
            delegatee?.updateLink(link)
            delegate?.didUpdateLink(link)
            UserManager.shared.locationTextField?.text = link
        }
    
          UserDefaults.standard.synchronize()
      }
  
    @objc func cancelButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    
    
}
