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
}

class EditProfileView: UIViewController {
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
    
    weak var delegate: EditProfileDelegate?
    
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
        configureTitleLabel()
        configureProfileImagePic()
        configureTwitterProfileImageViewHeader()
        
        view.backgroundColor = .black
        
        // Add cancel button
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelButtonTapped))
        cancelButton.tintColor = .white
        navigationItem.leftBarButtonItem = cancelButton
    }
    
    @objc func cancelButtonTapped() {
        dismiss(animated: true, completion: nil)
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
