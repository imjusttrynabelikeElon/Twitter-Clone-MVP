//
//  ProfilePicker.swift
//  twitter
//
//  Created by Karon Bell on 6/21/23.




import UIKit

protocol ProfilePickerDelegate: AnyObject {
    func profilePickerDidFinish(with user: Userr)
}

class ProfilePicker: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var twitterLogoImage: UIImageView!
    @IBOutlet weak var pickAProfilePic: UILabel!
    @IBOutlet weak var haveAFavDressLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    weak var delegate: ProfilePickerDelegate?
    
    let profilePickerImage = UIImageView()
    let plusSignImage = UIImageView(image: UIImage(systemName: "plus.circle.fill"))
    
    var isProfileImageSelected = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureProfilePickerImage()
        configurePlusSignImage()
        configureNextButton()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(profileImageTapped))
        profilePickerImage.isUserInteractionEnabled = true
        profilePickerImage.addGestureRecognizer(tapGesture)
    }
    
    @objc func profileImageTapped() {
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let chooseFromLibraryAction = UIAlertAction(title: "Choose from Library", style: .default) { [weak self] (_) in
            self?.showImagePicker(sourceType: .photoLibrary)
        }
        
        let takePhotoAction = UIAlertAction(title: "Take Photo", style: .default) { [weak self] (_) in
            self?.showImagePicker(sourceType: .camera)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        actionSheet.addAction(chooseFromLibraryAction)
        actionSheet.addAction(takePhotoAction)
        actionSheet.addAction(cancelAction)
        
        present(actionSheet, animated: true, completion: nil)
    }
    
    func showImagePicker(sourceType: UIImagePickerController.SourceType) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = sourceType
        present(imagePicker, animated: true, completion: nil)
    }
    
    func configureProfilePickerImage() {
        // Configure the profile picker image
        profilePickerImage.translatesAutoresizingMaskIntoConstraints = false
        profilePickerImage.contentMode = .scaleAspectFill // Change content mode to fill
        profilePickerImage.layer.cornerRadius = 95
        profilePickerImage.clipsToBounds = true
        profilePickerImage.backgroundColor = .gray
        
        view.addSubview(profilePickerImage)
        
        // Add Auto Layout constraints to center the profile picker image
        NSLayoutConstraint.activate([
            profilePickerImage.topAnchor.constraint(equalTo: haveAFavDressLabel.bottomAnchor, constant: 63),
            profilePickerImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profilePickerImage.widthAnchor.constraint(equalToConstant: 200),
            profilePickerImage.heightAnchor.constraint(equalTo: profilePickerImage.widthAnchor)
        ])
    }
    
    func configurePlusSignImage() {
        // Configure the plus sign image
        plusSignImage.translatesAutoresizingMaskIntoConstraints = false
        plusSignImage.contentMode = .scaleAspectFit
        plusSignImage.tintColor = .white
        
        profilePickerImage.addSubview(plusSignImage)
        
        // Add Auto Layout constraints for the plus sign image
        NSLayoutConstraint.activate([
            plusSignImage.bottomAnchor.constraint(equalTo: profilePickerImage.bottomAnchor, constant: -25),
            plusSignImage.trailingAnchor.constraint(equalTo: profilePickerImage.trailingAnchor, constant: -30),
            plusSignImage.widthAnchor.constraint(equalToConstant: 40),
            plusSignImage.heightAnchor.constraint(equalTo: plusSignImage.widthAnchor)
        ])
    }
    
    func configureNextButton() {
        // Configure the next button
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
     
        nextButton.isEnabled = false // Disable the button initially
        
        view.addSubview(nextButton)
        
        // Add Auto Layout constraints for the next button
        NSLayoutConstraint.activate([
            nextButton.topAnchor.constraint(equalTo: profilePickerImage.bottomAnchor, constant: 70),
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -33),
            nextButton.widthAnchor.constraint(equalToConstant: 83),
            nextButton.heightAnchor.constraint(equalToConstant: 47)
        ])
    }
    
    @objc func nextButtonTapped() {
        let profileImage: UIImage
           if let image = profilePickerImage.image {
               profileImage = image.fixOrientation() // Apply orientation correction
           } else {
               profileImage = UIImage(named: "defaultProfile")!
           }
        let user = Userr(name: "", userNaame: "", bio: "", profilePic: profileImage)

        
             delegate?.profilePickerDidFinish(with: user)
        // Convert the profile image to Data
        if let imageData = profileImage.pngData() {
            // Save the profile image data to UserDefaults
            UserDefaults.standard.set(imageData, forKey: "profileImage")
        }
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc1 = storyboard.instantiateViewController(withIdentifier: "navvv2")
        vc1.modalPresentationStyle = .fullScreen
        
        present(vc1, animated: true, completion: nil)
    }



    
    // UIImagePickerControllerDelegate methods
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[.originalImage] as? UIImage {
            profilePickerImage.image = pickedImage
            isProfileImageSelected = true
            nextButton.isEnabled = true // Enable the button when an image is selected
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}


extension UIImage {
    func fixOrientation() -> UIImage {
        if self.imageOrientation == .up {
            return self
        }

        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
        self.draw(in: CGRect(origin: .zero, size: self.size))
        let normalizedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        if let image = normalizedImage {
            return image
        } else {
            return self
        }
    }
}
