//
//  TwiiterProfileView.swift
//  twitter
//
//  Created by Karon Bell on 5/20/23.
//


import Foundation
import UIKit
import CoreLocation


struct editProfile {
    
    var profileImagePic: UIImageView?
    var twitterImageHeaderView: UIImageView?
    var Name: String?
    var userName: String?
    var Bio: String?
    var location: String?
    var locationImage: UIImageView?
    var link: String?
    var linkImage: UIImageView?
    var dateJoinedImage: UIImageView
    var joined: String
    var dateJoined: String
    var dateOfBirth: String?
    var followers: Int
    var followersName: String
    var following: Int
    var followingName: String
    var editProfileButton: UIButton

}

protocol TwitterProfileViewDelegate: AnyObject {
    func didTapBackButton()
}


class TwitterProfileView: UIViewController, EditProfileDelegate, ProfileDataDelegate {
    
    var editProfileVMM: editProfileViewModel! // Declare the variable
      
  
    func didUpdateName(_ name: String) {
          profileName.text = name
          UserDefaults.standard.set(name, forKey: "ProfileName")
      }

      func didUpdateBio(_ bio: String) {
          profileBio.text = bio
          UserDefaults.standard.set(bio, forKey: "ProfileBio")
      }
  
  
  
  
   
    let editProfileVC: editProfileData

     override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
         editProfileVC = editProfileData()  // Initialize editProfileVC
         super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
     }

     required init?(coder aDecoder: NSCoder) {
         editProfileVC = editProfileData()  // Initialize editProfileVC
         super.init(coder: aDecoder)
     }
 

    
    // Implement EditProfileDelegate method
    func didUpdateProfileImage(_ image: UIImage?) {
        profileImagePic.image = image
    }

    
    weak var delegate: TwitterProfileViewDelegate?
    let twitterImageHeaderView = UIImageView()
    let searchButton = UIButton()
    let profileImagePic = UIImageView()
    var profileName = UILabel()
    var profileUserName = UILabel()
    var profileLocation = UILabel()
    var profileLocationImage = UIImageView()
    var profileBio = UILabel()
    var linkTextView = UITextView()
    var profileDateJoinedImageView = UIImageView()
    var profileJoined = UILabel()
    var profileDateJoined = UILabel()
    var profileFollowers = UILabel()
    var profileFollowersName = UILabel()
    var profileFollowing = UILabel()
    var profileFollowingName = UILabel()
    var profileLinkImage = UIImageView()
    let profileEditButton = UIButton()
    let twitterHomeFeedVC = twitterHomeFeedTableView()
    var editProfileDefaults: editProfile!
   // let editProfileVC: editProfileData!
    
  
    
    
   
    @objc func backButtonTapped() {
        delegate?.didTapBackButton()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let dummyCoder = NSKeyedUnarchiver(forReadingWith: Data())
          editProfileVMM = editProfileViewModel(coder: dummyCoder) // Initialize editProfileVMM
          
            
            editProfileVMM.delegatee = self // Set the delegate for name and bio updates
            editProfileVMM.delegate = self // Set the delegate for profile image updates
            
        
        
        // Retrieve the saved name and bio from UserDefaults
            if let name = UserDefaults.standard.string(forKey: "ProfileName") {
                profileName.text = name
            }
            if let bio = UserDefaults.standard.string(forKey: "ProfileBio") {
                profileBio.text = bio
            }

            // ...

        let twitterSideProfileVC = TwitterProfileSideViewController()
        
        // Create a back button
        let backButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(backButtonTapped))
        navigationItem.leftBarButtonItem = backButton
        backButton.tintColor = .white
        
        view.backgroundColor = .white
        
        configureTwitterImageHeaderView()
        configureProfileImagePic()
        
        // Remove this line
        editProfileDefaults = editProfile(profileImagePic: UIImageView(image: UIImage(named: "kb")), twitterImageHeaderView: UIImageView(image: UIImage(named: "kbb")), Name: twitterHomeFeedVC.tweets[0].name, userName: twitterHomeFeedVC.tweets[0].userName, Bio: "IOS Developer. 21. Just created a remake of the twitter app, the one you're looking at now. Elon is the goat.", location: "New York, NY", locationImage: UIImageView(image: UIImage(systemName: "network")), link: "https://github.com/imjusttrynabelikeElon", linkImage: UIImageView(image: UIImage(systemName: "link")), dateJoinedImage: UIImageView(image: UIImage(systemName: "calendar")), joined: "Joined", dateJoined: "May 2023", followers: twitterSideProfileVC.userData.followerNumber, followersName: twitterSideProfileVC.userData.followerName, following: twitterSideProfileVC.userData.followingNumber, followingName: twitterSideProfileVC.userData.followingName, editProfileButton: UIButton(frame: CGRect(x: 113, y: 110, width: 70, height: 160)))

        
       
        configure(with: editProfileDefaults)
        configureLinkTextView(with: editProfileDefaults)
    //    configureLinkTextView(with: editProfileDefaults)
        configureSearchButton()
        configureTwitterName()
        configureDateImage()
      //  configureLinkTextView(with: editProfileDefaults)
        print(twitterHomeFeedVC.tweets[0].name)
        print(twitterHomeFeedVC.tweets[0].userName)
    }
    
    
    
    func configure(with editProfilee: editProfile) {
         twitterImageHeaderView.image = editProfilee.twitterImageHeaderView?.image
         profileImagePic.image = editProfileDefaults.profileImagePic?.image
         profileName.text = editProfilee.Name
         profileUserName.text = editProfilee.userName
         profileLocation.text = editProfilee.location
         profileLocationImage.image = editProfilee.locationImage?.image
         profileLinkImage.image = editProfilee.linkImage?.image
         linkTextView.text = editProfilee.link
         profileBio.text = editProfilee.Bio
        profileDateJoinedImageView.image = editProfilee.dateJoinedImage.image
         profileJoined.text = editProfilee.joined
         profileDateJoined.text = editProfilee.dateJoined
        profileFollowers.text = "\(editProfilee.followers)"
        profileFollowing.text = "\(editProfilee.following)"
        profileFollowersName.text = editProfilee.followersName
        profileFollowingName.text = editProfilee.followingName
        profileEditButton.setTitle("Edit profile", for: .normal)
        
        
        
        
        
         configureTwitterImageHeaderView()
         configureProfileImagePic()
         configureTwitterName()
         configureTwitterUserName()
         configureProfileBio()
         configureTwitterLocationImage()
         configureTwitterLocation()
         configureProfileLinkImage()
         configureDateImage()
         configureDateJoinedWord()
         configureDateJoined()
         configureProfileFollowing()
         configureProfileFollowingName()
         configureProfileFollowers()
         configureProfileFollowersName()
         configureEditProfileButton()
         configureTabBarController()
        
        
        // Retrieve the saved name and bio from UserDefaults
        if let name = UserDefaults.standard.string(forKey: "ProfileName") {
            profileName.text = name
            var updatedProfile = editProfilee
            updatedProfile.Name = name // Update the name property
                //     editProfilee = updatedProfile // Assign the updated profile back to the constant
        }
        if let bio = UserDefaults.standard.string(forKey: "ProfileBio") {
            profileBio.text = bio
            var updatedProfile = editProfilee
            updatedProfile.Bio = bio // Update the bio property
       //editProfilee = updatedProfile // Assign the updated profile back to the constant
        }


     }
    
    func configureTabBarController() {
        let tweetsViewController = UIViewController()
        tweetsViewController.tabBarItem = UITabBarItem(
            title: "Tweets",
            image: UIImage(named: "tweetsImage"),
            selectedImage: UIImage(named: "tweetsImageSelected")
        )
        
        let repliesViewController = UIViewController()
        repliesViewController.tabBarItem = UITabBarItem(
            title: "Replies",
            image: UIImage(named: "repliesImage"),
            selectedImage: UIImage(named: "repliesImageSelected")
        )
        
        let likesViewController = UIViewController()
        likesViewController.tabBarItem = UITabBarItem(
            title: "Likes",
            image: UIImage(named: "likesImage"),
            selectedImage: UIImage(named: "likesImageSelected")
        )
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [tweetsViewController, repliesViewController, likesViewController]
        
        // Add the tab bar controller as a child view controller
        addChild(tabBarController)
        view.addSubview(tabBarController.view)
        tabBarController.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tabBarController.view.topAnchor.constraint(equalTo: view.topAnchor, constant: 425),
            tabBarController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tabBarController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tabBarController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -370),
            tabBarController.tabBar.topAnchor.constraint(equalTo: view.topAnchor, constant: 313)
        ])

        tabBarController.view.layer.zPosition = 100
    }


    
    
  
    func configureEditProfileButton() {
        
        profileEditButton.addTarget(self, action: #selector(editProfileButtonTapped), for: .touchUpInside)
        
        profileEditButton.isUserInteractionEnabled = true
        profileEditButton.translatesAutoresizingMaskIntoConstraints = false

        profileEditButton.layer.borderWidth = 3.0 // Adjust the border width as needed
        profileEditButton.layer.borderColor = UIColor.black.cgColor

        profileEditButton.titleLabel?.font = UIFont.systemFont(ofSize: 13)

        profileEditButton.setTitleColor(.black, for: .normal)

        // Adjust the content insets to create spacing between the border and the text
        profileEditButton.contentEdgeInsets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)

        profileEditButton.addTarget(self, action: #selector(editProfileButtonTapped), for: .touchUpInside)

        view.addSubview(profileEditButton)

        NSLayoutConstraint.activate([
            profileEditButton.topAnchor.constraint(equalTo: twitterImageHeaderView.bottomAnchor, constant: 11),
            profileEditButton.leadingAnchor.constraint(equalTo: profileImagePic.trailingAnchor, constant: 183)
        ])
    }
    
    var editProfileDataVM = editProfileData()
    
    @objc func editProfileButtonTapped() {
        let editProfileView = editProfileViewModel(profileImage: profileImagePic.image, twitterImageHeaderView: twitterImageHeaderView.image)
          editProfileView.delegate = self

          // Set initial values of name and bio from TwitterProfileView
          editProfileView.name = profileName.text
          editProfileView.bio = profileBio.text

          let navigationController = UINavigationController(rootViewController: editProfileView)
          present(navigationController, animated: true, completion: nil)
      }

    
    func configureProfileFollowingName() {
        profileFollowingName.isUserInteractionEnabled = true
        profileFollowingName.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(profileFollowingName)
        
        
        NSLayoutConstraint.activate([
            profileFollowingName.topAnchor.constraint(equalTo: profileFollowing.topAnchor, constant: 0),
            profileFollowingName.leadingAnchor.constraint(equalTo: profileFollowing.leadingAnchor, constant: 36)
        ])
    }
     
    func configureProfileFollowing() {
        profileFollowing.isUserInteractionEnabled = true
        profileFollowing.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(profileFollowing)
        
        
        NSLayoutConstraint.activate([
            profileFollowing.topAnchor.constraint(equalTo: view.topAnchor, constant: 400),
            profileFollowing.leadingAnchor.constraint(equalTo: profileLocationImage.leadingAnchor, constant: 0)
        ])
    }
    
    
    func configureProfileFollowersName() {
        profileFollowersName.isUserInteractionEnabled = true
        profileFollowersName.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileFollowersName)
        
        
        NSLayoutConstraint.activate([
        
            profileFollowersName.topAnchor.constraint(equalTo: profileFollowers.topAnchor, constant: 0),
            profileFollowersName.leadingAnchor.constraint(equalTo: profileFollowers.trailingAnchor, constant: 10)
        
        ])
    }
    
    func configureProfileFollowers() {
        profileFollowers.isUserInteractionEnabled = true
        profileFollowers.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileFollowers)
        
        NSLayoutConstraint.activate([
          
            
            profileFollowers.topAnchor.constraint(equalTo: profileFollowing.topAnchor, constant: 0),
            profileFollowers.leadingAnchor.constraint(equalTo: profileFollowing.leadingAnchor, constant: 119)
        
        ])
    }
     func configureDateJoined() {
         profileDateJoined.isUserInteractionEnabled = true
         profileDateJoined.translatesAutoresizingMaskIntoConstraints = false
         
         view.addSubview(profileDateJoined)
         
         
         NSLayoutConstraint.activate([
             profileDateJoined.widthAnchor.constraint(equalToConstant: 699),
             profileDateJoined.heightAnchor.constraint(equalToConstant: 293),
             profileDateJoined.topAnchor.constraint(equalTo: profileJoined.topAnchor, constant: -80),
             profileDateJoined.leadingAnchor.constraint(equalTo: profileJoined.trailingAnchor, constant: -143)
         
         ])
     }
     
     
     func configureDateJoinedWord() {
         profileJoined.isUserInteractionEnabled = true
         profileJoined.translatesAutoresizingMaskIntoConstraints = false
         
         view.addSubview(profileJoined)
         
         NSLayoutConstraint.activate([
             profileJoined.widthAnchor.constraint(equalToConstant: 200),
             profileJoined.heightAnchor.constraint(equalToConstant: 133),
             profileJoined.topAnchor.constraint(equalTo: profileDateJoinedImageView.topAnchor, constant: -52),
             profileJoined.leadingAnchor.constraint(equalTo: profileDateJoinedImageView.trailingAnchor, constant: 7)
         ])
     }
     
     func configureDateImage() {
         
         
         profileDateJoinedImageView.isUserInteractionEnabled = true
         profileDateJoinedImageView.translatesAutoresizingMaskIntoConstraints = false
         
         view.addSubview(profileDateJoinedImageView)
         
         NSLayoutConstraint.activate([
             profileDateJoinedImageView.widthAnchor.constraint(equalToConstant: 29),
             profileDateJoinedImageView.heightAnchor.constraint(equalToConstant: 29),
             profileDateJoinedImageView.topAnchor.constraint(equalTo: profileLocationImage.topAnchor, constant: 32),
             profileDateJoinedImageView.trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: 38)
         
         ])
         
     
         
     }
    
    func configureLinkTextView(with profile: editProfile) {
        linkTextView.translatesAutoresizingMaskIntoConstraints = false
        
        if let link = profile.link {
            let attributedString = NSAttributedString(string: link, attributes: [NSAttributedString.Key.link: URL(string: link)!])
            linkTextView.attributedText = attributedString
            linkTextView.text = link
        }
        
        linkTextView.isUserInteractionEnabled = true
        linkTextView.isEditable = false
        
        view.addSubview(linkTextView)
        
        NSLayoutConstraint.activate([
            linkTextView.widthAnchor.constraint(equalToConstant: 330),
            linkTextView.heightAnchor.constraint(equalToConstant: 23),
            linkTextView.topAnchor.constraint(equalTo: profileLocation.topAnchor, constant: 50),
            linkTextView.trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: 498)
        ])
        
     
    }




    func configureProfileLinkImage() {
        
        profileLinkImage.isUserInteractionEnabled = true
        profileLinkImage.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(profileLinkImage)
        NSLayoutConstraint.activate([
            profileLinkImage.widthAnchor.constraint(equalToConstant: 23),
            profileLinkImage.heightAnchor.constraint(equalToConstant: 15),
            profileLinkImage.topAnchor.constraint(equalTo: profileLocation.topAnchor, constant: 58.8),
            profileLinkImage.trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: 170)
        
        ])
    }

    func configureProfileBio() {
        profileBio.isUserInteractionEnabled = true
        profileBio.translatesAutoresizingMaskIntoConstraints = false
        profileBio.numberOfLines = 0
        profileBio.lineBreakMode = .byWordWrapping

        view.addSubview(profileBio)

        NSLayoutConstraint.activate([
            profileBio.widthAnchor.constraint(equalToConstant: 300),
            profileBio.heightAnchor.constraint(equalToConstant: 233),
            profileBio.topAnchor.constraint(equalTo: profileUserName.bottomAnchor, constant: -128),
            profileBio.trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: 313)
        ])

     
    }

    
    func configureTwitterLocation() {
        profileLocation.isUserInteractionEnabled = true
        profileLocation.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileLocation)
        
        
        
        NSLayoutConstraint.activate([
            profileLocation.widthAnchor.constraint(equalToConstant: 200),
            profileLocation.heightAnchor.constraint(equalToConstant: 133),
            profileLocation.topAnchor.constraint(equalTo: profileLocationImage.topAnchor, constant: -56),
            profileLocation.trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: 239)
        
        ])
    }
    
    
    func configureTwitterLocationImage() {
        profileLocationImage.isUserInteractionEnabled = true
        profileLocationImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileLocationImage)
        
        
        NSLayoutConstraint.activate([
            profileLocationImage.widthAnchor.constraint(equalToConstant: 23),
            profileLocationImage.heightAnchor.constraint(equalToConstant: 23),
            profileLocationImage.topAnchor.constraint(equalTo: profileBio.bottomAnchor, constant: -77),
            profileLocationImage.trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: 34)
        
        ])
    }
    
    
    func configureTwitterUserName() {
        profileUserName.isUserInteractionEnabled = true
        profileUserName.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileUserName)
        
        
        NSLayoutConstraint.activate([
        
            profileUserName.widthAnchor.constraint(equalToConstant: 200),
            profileUserName.heightAnchor.constraint(equalToConstant: 133),
            profileUserName.topAnchor.constraint(equalTo: profileName.bottomAnchor, constant: -110),
            profileUserName.trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: 216)
        
        ])
    }
    func configureTwitterName() {
        
        profileName.isUserInteractionEnabled = true
        profileName.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileName)
        
        NSLayoutConstraint.activate([
        
            profileName.widthAnchor.constraint(equalToConstant: 200),
            profileName.heightAnchor.constraint(equalToConstant: 133),
            profileName.topAnchor.constraint(equalTo: profileImagePic.bottomAnchor, constant: -33),
            profileName.trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: 223)
        
        ])
    }
    
    func configureTwitterImageHeaderView() {
       
        twitterImageHeaderView.isUserInteractionEnabled = true
        twitterImageHeaderView.translatesAutoresizingMaskIntoConstraints = false
        
        
        view.addSubview(twitterImageHeaderView)
        NSLayoutConstraint.activate([
        
            twitterImageHeaderView.widthAnchor.constraint(equalToConstant: 400),
            twitterImageHeaderView.heightAnchor.constraint(equalToConstant: 143),
            twitterImageHeaderView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0)
        ])
    }
    
    func configureProfileImagePic() {
    //    profileImagePic.image = UIImage(named: "kb")
        profileImagePic.translatesAutoresizingMaskIntoConstraints = false
        profileImagePic.layer.masksToBounds = true
        profileImagePic.layer.borderWidth = 2.0
        profileImagePic.layer.borderColor = UIColor.black.cgColor
        view.addSubview(profileImagePic)
        
        NSLayoutConstraint.activate([
            profileImagePic.widthAnchor.constraint(equalToConstant: 67),
            profileImagePic.heightAnchor.constraint(equalToConstant: 65),
            profileImagePic.topAnchor.constraint(equalTo: twitterImageHeaderView.bottomAnchor, constant: -27),
            profileImagePic.trailingAnchor.constraint(equalTo: twitterImageHeaderView.trailingAnchor, constant: -303)
        ])
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(profileImageTapped))
        profileImagePic.addGestureRecognizer(tapGesture)
        profileImagePic.isUserInteractionEnabled = true
    }

    
    
    func configureSearchButton() {
        searchButton.setImage(UIImage(systemName: "plus.magnifyingglass"), for: .normal)
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        searchButton.tintColor = .white
        view.addSubview(searchButton)
        NSLayoutConstraint.activate([
        
            searchButton.widthAnchor.constraint(equalToConstant: 300),
            searchButton.heightAnchor.constraint(equalToConstant: 50),
            searchButton.topAnchor.constraint(equalTo: twitterImageHeaderView.topAnchor, constant: 51),
            searchButton.trailingAnchor.constraint(equalTo: twitterImageHeaderView.trailingAnchor, constant: 98)
        
        ])
    }
    
  
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        profileImagePic.layer.cornerRadius = profileImagePic.frame.width / 2.0
        
        // Set corner radius here when the frame is determined
        profileEditButton.layer.cornerRadius = 13
    }

    @objc func profileImageTapped() {
        let imageViewController = UIViewController()
        imageViewController.view.backgroundColor = .black
        let imageView = UIImageView(image: profileImagePic.image)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageViewController.view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: imageViewController.view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: imageViewController.view.trailingAnchor),
            imageView.topAnchor.constraint(equalTo: imageViewController.view.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: imageViewController.view.bottomAnchor)
        ])
        
        present(imageViewController, animated: true, completion: nil)
    }
    
    
    class LocationAutoCompletion {
        let geocoder = CLGeocoder()
        
        func autoCompleteLocation(with searchText: String, completion: @escaping ([String]) -> Void) {
            geocoder.geocodeAddressString(searchText) { (placemarks, error) in
                var suggestions: [String] = []
                
                guard error == nil else {
                    completion(suggestions)
                    return
                }
                
                if let placemarks = placemarks {
                    for placemark in placemarks {
                        if let name = placemark.name {
                            suggestions.append(name)
                        }
                        
                        if let thoroughfare = placemark.thoroughfare {
                            suggestions.append(thoroughfare)
                        }
                        
                        if let subLocality = placemark.subLocality {
                            suggestions.append(subLocality)
                        }
                        
                        // Add more components as per your requirement
                    }
                }
                
                completion(suggestions)
            }
        }
    }

   
}
