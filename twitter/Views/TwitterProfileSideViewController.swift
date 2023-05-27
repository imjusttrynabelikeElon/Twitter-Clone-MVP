//
//  TwitterProfileSideViewController.swift
//  twitter
//
//  Created by Karon Bell on 5/15/23.
//

import Foundation
import UIKit

struct sideProfileData {
    var name: String
    var userName: String
    var followingNumber: Int
    var followingName: String
    var followerNumber: Int
    var followerName: String
}



class TwitterProfileSideViewController: UIViewController, UIGestureRecognizerDelegate, TwitterProfileViewDelegate, ProfileDataDelegate {
    
    func updateName(_ name: String) {
          userData.name = name
          self.name.text = name // Update the UI with the new name
      }

    
    func updateBio(_ bio: String) {
        
    }
    
    
     let editProfileView: EditProfileView
       
       override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
           editProfileView = EditProfileView(profileImage: nil, twitterImageHeaderView: nil)
           super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
       }
       
       required init?(coder aDecoder: NSCoder) {
           editProfileView = EditProfileView(profileImage: nil, twitterImageHeaderView: nil)
           super.init(coder: aDecoder)
       }
       
    
    let twitterProfileView = TwitterProfileView()
    let twitterHomeFeed = twitterHomeFeedTableView()
    let secProfileImageForSideView = UIImageView()
    let secprofileImageForSideViewName = UILabel()
    var name = UILabel()
    var userName = UILabel()
    let following = UILabel()
    let followingName = UILabel()
    let followers = UILabel()
    let followersName = UILabel()
    let twitterBlueImage = UIImageView()
    let profileImagePic = UIImageView()
    let twitterBlueName = UILabel()
    let topicsImage = UIImageView()
    let topicsImageName = UILabel()
    let BookmarkImage = UIImageView()
    let BookmarkImageName = UILabel()
    let listsImage = UIImageView()
    let listsName = UILabel()
    let twitterCircle =  UIImageView()
    let twitterCircleName = UILabel()
    
    var userData = sideProfileData(name: "Karon Bell", userName: "@karonbell", followingNumber: 233, followingName: "Following", followerNumber: 233332, followerName: "Followers")
    
    @objc func profileImageTapped() {
        let profileVC = twitterProfileView // Use the existing instance
        profileVC.delegate = self

        let nav = UINavigationController(rootViewController: profileVC)
        nav.modalPresentationStyle = .overFullScreen
        nav.modalTransitionStyle = .crossDissolve
        present(nav, animated: true)
    }

       
       func didTapBackButton() {
           dismiss(animated: true, completion: nil)
          
       }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        editProfileView.delegatee = self
        
        
        
        secProfileImageForSideView.image = UIImage(systemName: "person.fill")
        secProfileImageForSideView.translatesAutoresizingMaskIntoConstraints = false
        secProfileImageForSideView.tintColor = .systemBlue
        view.addSubview(secProfileImageForSideView)
        
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(profileImageTapped))
        secProfileImageForSideView.isUserInteractionEnabled = true
        secProfileImageForSideView.addGestureRecognizer(tapGesture2)
        NSLayoutConstraint.activate([
            secProfileImageForSideView.trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: 160),
            secProfileImageForSideView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -540),
            secProfileImageForSideView.widthAnchor.constraint(equalToConstant: 55),
            secProfileImageForSideView.heightAnchor.constraint(equalToConstant: 49)
        
        ])
        
        
        // Create an instance of TwitterProfileView
        let twitterProfileView = TwitterProfileView()
        twitterProfileView.delegate = self
        
        userData = sideProfileData(name: "JH", userName: "@karonbell", followingNumber: 233, followingName: "Following", followerNumber: 233332, followerName: "Followers")

        
        
         // Retrieve the saved name and set it in TwitterProfileView
         if let name = UserDefaults.standard.string(forKey: "ProfileName") {
             twitterProfileView.profileName.text = name
             print(twitterProfileView.profileName.text as Any)
             
             userData = sideProfileData(name: name, userName: "@karonbell", followingNumber: 233, followingName: "Following", followerNumber: 233332, followerName: "Followers")
         }

         
  
        // Add twitterProfileView as a subview
     //   view.addSubview(twitterProfileView)

        // ... (Add appropriate constraints to position and size twitterProfileView in the view hierarchy)

        print(userData.name)

    
     
        // ...

        // ...
    
        name.text = userData.name
        name.numberOfLines = 0
        name.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(name)
        
        NSLayoutConstraint.activate([
            name.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 120),
            name.trailingAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -6),
            name.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -656)
        ])

        
        userName.text = userData.userName
        userName.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(userName)
        
        NSLayoutConstraint.activate([
            userName.trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: 200),
            userName.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -660)
        
        ])
        
        following.text = "\(userData.followingNumber)"
        following.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(following)
        
        
        NSLayoutConstraint.activate([
            following.trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: 135),
            following.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -620)
        
        ])
        
        followingName.text = userData.followingName
        followingName.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(followingName)
        
        NSLayoutConstraint.activate([
        
            followingName.trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: 213),
            followingName.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -620)
        ])
        
        
        followers.text = "\(userData.followerNumber)"
        followers.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(followers)
        
        NSLayoutConstraint.activate([
        
            followers.trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: 288),
            followers.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -620)
        ])
        
        followersName.text = userData.followerName
        followersName.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(followersName)
        
        NSLayoutConstraint.activate([
        
            followersName.trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: 366),
            followersName.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -620)
        ])
        profileImagePic.image = UIImage(named: "kb")
        profileImagePic.translatesAutoresizingMaskIntoConstraints = false
        profileImagePic.layer.masksToBounds = false
        profileImagePic.layer.cornerRadius = 23.0
        profileImagePic.clipsToBounds = true
        view.addSubview(profileImagePic)
        
        NSLayoutConstraint.activate([
            profileImagePic.trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: 163),
            profileImagePic.topAnchor.constraint(equalTo: view.topAnchor, constant: 61),
            profileImagePic.widthAnchor.constraint(equalToConstant: 46),
            profileImagePic.heightAnchor.constraint(equalToConstant: 45)
        ])
        
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(profileImageTapped))
        secprofileImageForSideViewName.isUserInteractionEnabled = true
        secprofileImageForSideViewName.addGestureRecognizer(tapGesture)

        secprofileImageForSideViewName.text = "Profile"
        secprofileImageForSideViewName.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(secprofileImageForSideViewName)
        
        
        NSLayoutConstraint.activate([
            secprofileImageForSideViewName.trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: 233),
            secprofileImageForSideViewName.topAnchor.constraint(equalTo: view.topAnchor, constant: 275)
            
        
        ])
        
        
     
        twitterBlueImage.image = UIImage(named: "twitterBlue")
        twitterBlueImage.translatesAutoresizingMaskIntoConstraints = false
        twitterBlueImage.layer.masksToBounds = false
        twitterBlueImage.clipsToBounds = true
        
        view.addSubview(twitterBlueImage)
        
        NSLayoutConstraint.activate([
            twitterBlueImage.trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: 163),
            twitterBlueImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 361),
            twitterBlueImage.widthAnchor.constraint(equalToConstant: 65),
            twitterBlueImage.heightAnchor.constraint(equalToConstant: 53)
        
        ])
        
        twitterBlueName.text = "Twitter Blue"
        twitterBlueName.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(twitterBlueName)
        
        
        NSLayoutConstraint.activate([
        
            twitterBlueName.trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: 270),
            twitterBlueName.topAnchor.constraint(equalTo: view.topAnchor, constant: 375)
        ])
        
        topicsImage.image = UIImage(systemName: "message.circle.fill")
        topicsImage.translatesAutoresizingMaskIntoConstraints = false
        topicsImage.layer.masksToBounds = false
        topicsImage.clipsToBounds = true
        
        
        view.addSubview(topicsImage)
        
       
        NSLayoutConstraint.activate([
            topicsImage.trailingAnchor.constraint(equalTo: view.leadingAnchor , constant: 163),
            topicsImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 463),
            topicsImage.widthAnchor.constraint(equalToConstant: 60),
            topicsImage.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        
        
        topicsImageName.text = "Topics"
        topicsImageName.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(topicsImageName)
        
        
        NSLayoutConstraint.activate([
            topicsImageName.trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: 235),
            topicsImageName.topAnchor.constraint(equalTo: view.topAnchor, constant: 476)
        
        ])
        
        
        BookmarkImage.image = UIImage(systemName: "bookmark.fill")
        BookmarkImage.translatesAutoresizingMaskIntoConstraints = false
        BookmarkImage.layer.masksToBounds = false
        BookmarkImage.clipsToBounds = true
        
        view.addSubview(BookmarkImage)
        
        
        NSLayoutConstraint.activate([
            BookmarkImage.trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: 157),
            BookmarkImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 565),
            BookmarkImage.widthAnchor.constraint(equalToConstant: 50),
            BookmarkImage.heightAnchor.constraint(equalToConstant: 48)
            
        
        ])
        
        
        BookmarkImageName.text = "Bookmarks"
        BookmarkImageName.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(BookmarkImageName)
        
        
        
        NSLayoutConstraint.activate([
        
            BookmarkImageName.trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: 263),
            BookmarkImageName.topAnchor.constraint(equalTo: view.topAnchor, constant: 576)
        
        ])
        
        
        listsImage.image = UIImage(systemName: "list.bullet.rectangle.portrait")
        listsImage.translatesAutoresizingMaskIntoConstraints = false
        listsImage.layer.masksToBounds = false
        listsImage.clipsToBounds = true
        view.addSubview(listsImage)
        
        NSLayoutConstraint.activate([
            listsImage.trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: 157),
            listsImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 653),
            listsImage.widthAnchor.constraint(equalToConstant: 50),
            listsImage.heightAnchor.constraint(equalToConstant: 48)
        
        ])
        
        listsName.text = "Lists"
        listsName.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(listsName)
        
        
        NSLayoutConstraint.activate([
            listsName.trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: 273),
            listsName.topAnchor.constraint(equalTo: view.topAnchor, constant: 663),
            listsName.widthAnchor.constraint(equalToConstant: 89)
            
        
        ])
        
        twitterCircle.image = UIImage(systemName: "person.fill.badge.plus")
        twitterCircle.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(twitterCircle)
        
        NSLayoutConstraint.activate([
            twitterCircle.trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: 157),
            twitterCircle.topAnchor.constraint(equalTo: view.topAnchor, constant: 743),
            twitterCircle.widthAnchor.constraint(equalToConstant: 50),
            twitterCircle.heightAnchor.constraint(equalToConstant: 49)
        
        ])
        
        twitterCircleName.text = "Twitter Circle"
        twitterCircleName.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(twitterCircleName)
        
        NSLayoutConstraint.activate([
            twitterCircleName.trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: 273),
            twitterCircleName.topAnchor.constraint(equalTo: view.topAnchor, constant: 758)
            
            ])
        // Customize the view and add necessary UI elements
    
        // Customize the view and add necessary UI elements
        
        // Example: Create a background color
        view.backgroundColor = UIColor.white
        
     
        
        
        
   
    }
    
    // Rest of the class implementation
}

class TwitterProfilePresentationDelegate: NSObject, UIAdaptivePresentationControllerDelegate, UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return CustomPresentationController(presentedViewController: presented, presenting: presenting)
    }
}

