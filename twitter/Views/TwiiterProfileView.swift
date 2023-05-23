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

    
}

protocol TwitterProfileViewDelegate: AnyObject {
    func didTapBackButton()
}


class TwitterProfileView: UIViewController {
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
    let twitterHomeFeedVC = twitterHomeFeedTableView()
  
    var editProfileDefaults: editProfile!
   
    @objc func backButtonTapped() {
        delegate?.didTapBackButton()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let twitterSideProfileVC = TwitterProfileSideViewController()
        
        // Create a back button
        let backButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(backButtonTapped))
        navigationItem.leftBarButtonItem = backButton
        
        view.backgroundColor = .white
        
        configureTwitterImageHeaderView()
        configureProfileImagePic()
        
        editProfileDefaults = editProfile(profileImagePic: UIImageView(image: UIImage(named: "kb")), twitterImageHeaderView: UIImageView(image: UIImage(named: "kbb")), Name: twitterHomeFeedVC.tweets[0].name, userName: twitterHomeFeedVC.tweets[0].userName, Bio: "IOS Developer. 21. Just created a remake of the twitter app, the one you're looking at now. Elon is the goat.", location: "New York, NY", locationImage: UIImageView(image: UIImage(systemName: "network")), link: "https://github.com/imjusttrynabelikeElon", linkImage: UIImageView(image: UIImage(systemName: "link")), dateJoinedImage: UIImageView(image: UIImage(systemName: "calendar")), joined: "Joined", dateJoined: "May 2023", followers: twitterSideProfileVC.userData.followerNumber, followersName: twitterSideProfileVC.userData.followerName, following: twitterSideProfileVC.userData.followingNumber, followingName: twitterSideProfileVC.userData.followingName)
        
       
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
         
         configureTwitterImageHeaderView()
         configureProfileImagePic()
         configureTwitterName()
         configureTwitterUserName()
         configureTwitterLocation()
         configureTwitterLocationImage()
         configureProfileBio()
         configureProfileLinkImage()
         configureDateImage()
         configureDateJoinedWord()
         configureDateJoined()
         configureProfileFollowers()
         configureProfileFollowersName()
        configureProfileFollowingName()
         configureProfileFollowing()
       
    
     }
    
    func configureProfileFollowingName() {
        profileFollowingName.isUserInteractionEnabled = true
        profileFollowingName.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(profileFollowingName)
        
        
        NSLayoutConstraint.activate([
            profileFollowingName.topAnchor.constraint(equalTo: profileFollowers.topAnchor, constant: 0),
            profileFollowingName.leadingAnchor.constraint(equalTo: view.trailingAnchor, constant: -187)
        ])
    }
     
    func configureProfileFollowing() {
        profileFollowing.isUserInteractionEnabled = true
        profileFollowing.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(profileFollowing)
        
        
        NSLayoutConstraint.activate([
            profileFollowing.topAnchor.constraint(equalTo: profileFollowersName.topAnchor, constant: 0),
            profileFollowing.leadingAnchor.constraint(equalTo: view.trailingAnchor, constant: -230)
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
          
            
            profileFollowers.topAnchor.constraint(equalTo: profileLocation.bottomAnchor, constant: 30),
            profileFollowers.leadingAnchor.constraint(equalTo: view.trailingAnchor, constant: -387)
        
        ])
    }
     func configureDateJoined() {
         profileDateJoined.isUserInteractionEnabled = true
         profileDateJoined.translatesAutoresizingMaskIntoConstraints = false
         
         view.addSubview(profileDateJoined)
         
         
         NSLayoutConstraint.activate([
             profileDateJoined.widthAnchor.constraint(equalToConstant: 699),
             profileDateJoined.heightAnchor.constraint(equalToConstant: 293),
             profileDateJoined.topAnchor.constraint(equalTo: profileLocationImage.bottomAnchor, constant: -103),
             profileDateJoined.leadingAnchor.constraint(equalTo: profileJoined.trailingAnchor, constant: -138)
         
         ])
     }
     
     
     func configureDateJoinedWord() {
         profileJoined.isUserInteractionEnabled = true
         profileJoined.translatesAutoresizingMaskIntoConstraints = false
         
         view.addSubview(profileJoined)
         
         NSLayoutConstraint.activate([
             profileJoined.widthAnchor.constraint(equalToConstant: 200),
             profileJoined.heightAnchor.constraint(equalToConstant: 133),
             profileJoined.topAnchor.constraint(equalTo: profileLocation.bottomAnchor, constant: -79),
             profileJoined.leadingAnchor.constraint(equalTo: profileDateJoinedImageView.trailingAnchor, constant: 13)
         ])
     }
     
     func configureDateImage() {
         
         
         profileDateJoinedImageView.isUserInteractionEnabled = true
         profileDateJoinedImageView.translatesAutoresizingMaskIntoConstraints = false
         
         view.addSubview(profileDateJoinedImageView)
         
         NSLayoutConstraint.activate([
             profileDateJoinedImageView.widthAnchor.constraint(equalToConstant: 29),
             profileDateJoinedImageView.heightAnchor.constraint(equalToConstant: 29),
             profileDateJoinedImageView.topAnchor.constraint(equalTo: profileLocationImage.bottomAnchor, constant: 29),
             profileDateJoinedImageView.trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35)
         
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
               linkTextView.trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: 500)
           ])
       }



    func configureProfileLinkImage() {
        
        profileLinkImage.isUserInteractionEnabled = true
        profileLinkImage.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(profileLinkImage)
        NSLayoutConstraint.activate([
            profileLinkImage.widthAnchor.constraint(equalToConstant: 23),
            profileLinkImage.heightAnchor.constraint(equalToConstant: 15),
            profileLinkImage.topAnchor.constraint(equalTo: profileLocation.topAnchor, constant: 58),
            profileLinkImage.trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: 172)
        
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
            profileBio.topAnchor.constraint(equalTo: profileUserName.bottomAnchor, constant: -123),
            profileBio.trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: 319)
        
        ])
    }
    
    func configureTwitterLocation() {
        profileLocation.isUserInteractionEnabled = true
        profileLocation.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileLocation)
        
        
        
        NSLayoutConstraint.activate([
            profileLocation.widthAnchor.constraint(equalToConstant: 200),
            profileLocation.heightAnchor.constraint(equalToConstant: 133),
            profileLocation.topAnchor.constraint(equalTo: profileUserName.bottomAnchor, constant: 3),
            profileLocation.trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: 236)
        
        ])
    }
    
    
    func configureTwitterLocationImage() {
        profileLocationImage.isUserInteractionEnabled = true
        profileLocationImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileLocationImage)
        
        
        NSLayoutConstraint.activate([
            profileLocationImage.widthAnchor.constraint(equalToConstant: 23),
            profileLocationImage.heightAnchor.constraint(equalToConstant: 23),
            profileLocationImage.topAnchor.constraint(equalTo: profileLocation.topAnchor, constant: 54),
            profileLocationImage.trailingAnchor.constraint(equalTo: profileLocation.leadingAnchor, constant: -3)
        
        ])
    }
    
    
    func configureTwitterUserName() {
        profileUserName.isUserInteractionEnabled = true
        profileUserName.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileUserName)
        
        
        NSLayoutConstraint.activate([
        
            profileUserName.widthAnchor.constraint(equalToConstant: 200),
            profileUserName.heightAnchor.constraint(equalToConstant: 133),
            profileUserName.topAnchor.constraint(equalTo: profileName.bottomAnchor, constant: -100),
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
            searchButton.heightAnchor.constraint(equalToConstant: 300),
            searchButton.topAnchor.constraint(equalTo: view.topAnchor, constant: -73),
            searchButton.trailingAnchor.constraint(equalTo: twitterImageHeaderView.trailingAnchor, constant: 98)
        
        ])
    }
    
  
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        profileImagePic.layer.cornerRadius = profileImagePic.frame.width / 2.0
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
