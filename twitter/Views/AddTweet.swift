//
//  AddTweet.swift
//  twitter
//
//  Created by Karon Bell on 6/15/23.
//

import UIKit




protocol AddTweetDelegate: AnyObject {
    func didAddTweet(_ tweet: Tweet)
}


class AddTweet: UIViewController, UITextFieldDelegate, ProfilePickerDelegate {
    func profilePickerDidFinish(with user: Userr) {
        // Access the user information
        let name = user.name
        let username = user.userNaame
        let bio = user.bio
        let profilePic = user.profilePic
        weak var delegate: AddTweetDelegate?
        // Use the user information as needed
        // For example, you can update UI elements or save the user information
        
        // Update UI elements with the selected profile picture
        profileImageView.image = profilePic
        
        // Save the user information to UserDefaults or a database
        UserDefaults.standard.set(name, forKey: "userName")
        UserDefaults.standard.set(username, forKey: "userUsername")
        UserDefaults.standard.set(bio, forKey: "userBio")
        
        // Convert the profile image to Data
        if let imageData = profilePic!.pngData() {
            // Save the profile image data to UserDefaults
            UserDefaults.standard.set(imageData, forKey: "profileImage")
        }
        
        // Proceed with any other necessary actions after profile selection
        // For example, dismiss the profile picker view controller or navigate to another screen
        dismiss(animated: true, completion: nil)
    }
    
    let profileImageView = UIImageView()
    let tweetButton = UIButton()
    let tweetTextField = UITextField()
    weak var delegate: AddTweetDelegate?
    var profileImage: Data? // Updated property type
    var createAccountVC: createAccountPage?
    var namee = ""
    var userName: String = ""
    
    
    init(profileImage: UIImage?) {
        super.init(nibName: nil, bundle: nil)
        
        // Convert UIImage to Data
        if let profileImage = profileImage {
            self.profileImage = profileImage.jpegData(compressionQuality: 1.0)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        // Set the createAccountVC property as the presenting view controller
              if let presentingVC = presentingViewController as? createAccountPage {
                  createAccountVC = presentingVC
              }
              
              if let name = createAccountVC?.Name.text {
                  namee = name
              }
              
        
        profileImageView.image = UIImage(named: "kb")
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.layer.cornerRadius = 23.0
        profileImageView.clipsToBounds = true
        view.addSubview(profileImageView)
        
        NSLayoutConstraint.activate([
            profileImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            profileImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 32),
            profileImageView.widthAnchor.constraint(equalToConstant: 46),
            profileImageView.heightAnchor.constraint(equalToConstant: 45)
        ])
        
        tweetButton.setTitle("Tweet", for: .normal)
        tweetButton.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        tweetButton.setTitleColor(.black, for: .normal)
        tweetButton.backgroundColor = UIColor.systemBlue
        tweetButton.layer.cornerRadius = 15.0
        tweetButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tweetButton)
        
        NSLayoutConstraint.activate([
            tweetButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 32),
            tweetButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            tweetButton.widthAnchor.constraint(equalToConstant: 80),
            tweetButton.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        tweetTextField.placeholder = "What's happening?"
        tweetTextField.font = UIFont.systemFont(ofSize: 17)
        tweetTextField.textColor = .black
        tweetTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tweetTextField)
        
        NSLayoutConstraint.activate([
            tweetTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            tweetTextField.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 16),
            tweetTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            tweetTextField.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        tweetTextField.delegate = self
        
        tweetButton.addTarget(self, action: #selector(tweetButtonTapped), for: .touchUpInside)
    }
    
    @objc func tweetButtonTapped() {
      
        // Retrieve the userName from the UserManager singleton
             guard let name = UserManager.shared.name else {
                 return
             }
        guard let userName = UserManager.shared.userName else {
            return
        }
             
            let newTweet = Tweet(
                name: name,
                message: tweetTextField.text ?? "",
                profileName: profileImage,
                title: "",
                userName: userName,
                comments: "KUOH",
                numberOfComments: 0,
                retweet: "KIHUOL",
                numberOfRetweets: 0,
                likes: "IKUHU",
                numberOfLikes: 0,
                views: "KUHO",
                numberOfViews: 0,
                share: "IHLPHI",
                date: "05/21/23",
                timePosted: "12:00am",
                reTweetName: "Retweets",
                likesName: "Likes",
                commentsLabel: "message",
                reTweetImagee: "repeat",
                likeImagee: "suit.heart",
                shareImagee: "tray.and.arrow.down.fill"
            )
            // Inside AddTweetViewController
            let profilePicker = ProfilePicker()
            profilePicker.delegate = self
            
            
            delegate?.didAddTweet(newTweet)
            
            dismiss(animated: true, completion: nil)
            
            print("Tapped")
        
        
    }
    
}
