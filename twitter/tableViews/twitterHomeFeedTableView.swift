//
//  twitterHomeFeedTableView.swift
//  twitter
//
//  Created by Karon Bell on 5/4/23.
//
//
 import Foundation
 import UIKit
 import Firebase

//class LinkTweet {
    
    // linkTweet is a class for when a user wants to add a link into their tweet.. they have to add a title to the tweet to explan it, and their is also an optional text for them to also include even more.
    
  //  var link: URL
  //  var title: String
  //  var text: String?
    
  //  init(link: URL, title: String, text: String?) {
     //   self.link = link
     //   self.title = title
    //    self.text = text
  //  }
//}

struct Tweet: Encodable, Decodable {
    
    var name: String
    let message: String
    let profileName: Data?
    let title: String
    let userName: String
    let comments: String
    let numberOfComments: Int
    let retweet: String
    let numberOfRetweets: Int
    let likes: String
    let numberOfLikes: Int
    let views: String
    let numberOfViews: Int
    let share: String
    let date: String
    let timePosted: String
    let reTweetName: String
    let likesName: String
    let commentsLabel: String
    let reTweetImagee: String
    let likeImagee: String
    let shareImagee: String
    
  //  let addLink: LinkTweet
 
   }



class MyTableViewCell: UITableViewCell {
    
    
    let nameLabel = UILabel()
    let messageLabel = UILabel()
    let profileImageView = UIImageView()
    let titleLabel = UILabel()
    let userNameLabel = UILabel()
    let commentsLabel = UIButton()
    let dateLabel = UILabel()
    let photoTweet = UIImageView()
    let videoTweet = UIView()
    let numberOfCommentsLabel = UILabel()
    let retweetsLabel = UIButton()
    let numberOfRetweetsLabel = UILabel()
    let likesLabel = UIButton()
    let numberOfLikesLabel = UILabel()
    let viewsLabel = UIButton()
    let numberOfViewsLabel = UILabel()
    let shareLabel = UIButton()
    let timePostedLabel = UILabel()
    let numberOfReTweetsabel = UILabel()
    let reTweetImagee = UIButton()
    let likeImagee = UIButton()
    let shareImagee = UIButton()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        commentsLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        numberOfCommentsLabel.translatesAutoresizingMaskIntoConstraints = false
        retweetsLabel.translatesAutoresizingMaskIntoConstraints = false
        numberOfRetweetsLabel.translatesAutoresizingMaskIntoConstraints = false
        likesLabel.translatesAutoresizingMaskIntoConstraints = false
        numberOfLikesLabel.translatesAutoresizingMaskIntoConstraints = false
        viewsLabel.translatesAutoresizingMaskIntoConstraints = false
        numberOfViewsLabel.translatesAutoresizingMaskIntoConstraints = false
        shareLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        timePostedLabel.translatesAutoresizingMaskIntoConstraints  = false
        videoTweet.translatesAutoresizingMaskIntoConstraints = false
        photoTweet.translatesAutoresizingMaskIntoConstraints = false
        numberOfRetweetsLabel.translatesAutoresizingMaskIntoConstraints = false
        
        commentsLabel.addTarget(self, action: #selector(didTapCommentsLabel), for: .touchUpInside)
     
        
        contentView.addSubview(nameLabel)
        contentView.addSubview(messageLabel)
        contentView.addSubview(profileImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(userNameLabel)
        contentView.addSubview(commentsLabel)
        contentView.addSubview(numberOfCommentsLabel)
        contentView.addSubview(retweetsLabel)
        contentView.addSubview(numberOfRetweetsLabel)
        contentView.addSubview(likesLabel)
        contentView.addSubview(numberOfLikesLabel)
        contentView.addSubview(viewsLabel)
        contentView.addSubview(numberOfViewsLabel)
        contentView.addSubview(shareLabel)
        contentView.addSubview(dateLabel)
        contentView.addSubview(timePostedLabel)
        contentView.addSubview(photoTweet)
        contentView.addSubview(videoTweet)
        contentView.addSubview(numberOfRetweetsLabel)
                
        NSLayoutConstraint.activate([
            
            
            profileImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            profileImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            profileImageView.widthAnchor.constraint(equalToConstant: 50),
            profileImageView.heightAnchor.constraint(equalToConstant: 50),
            
        
            
            nameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 16),
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: -16),
            nameLabel.trailingAnchor.constraint(equalTo: userNameLabel.leadingAnchor, constant: -16),
            nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -50),
            
            userNameLabel.trailingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 243),
            userNameLabel.leadingAnchor.constraint(equalTo: profileImageView.leadingAnchor, constant: 167),
            userNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            
            messageLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 16),
            messageLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: -45),
            messageLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            messageLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            commentsLabel.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: -16),
            commentsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 13),
            
            numberOfCommentsLabel.leadingAnchor.constraint(equalTo: commentsLabel.trailingAnchor, constant: 5),
            numberOfCommentsLabel.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: -16),
            
            retweetsLabel.leadingAnchor.constraint(equalTo: numberOfCommentsLabel.trailingAnchor, constant: 19),
            retweetsLabel.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: -16),
            
           numberOfRetweetsLabel.leadingAnchor.constraint(equalTo: retweetsLabel.trailingAnchor, constant: 8),
            numberOfRetweetsLabel.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: -16),
            
            likesLabel.leadingAnchor.constraint(equalTo: numberOfCommentsLabel.trailingAnchor, constant: 107),
            likesLabel.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: -16),
            
            numberOfLikesLabel.leadingAnchor.constraint(equalTo: commentsLabel.leadingAnchor, constant: 183),
            numberOfLikesLabel.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: -16),
            
            viewsLabel.leadingAnchor.constraint(equalTo: numberOfCommentsLabel.trailingAnchor, constant: 195),
            viewsLabel.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: -16),
            
            numberOfViewsLabel.leadingAnchor.constraint(equalTo: numberOfCommentsLabel.trailingAnchor, constant: 228),
            numberOfViewsLabel.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: -16),
            
            
            shareLabel.leadingAnchor.constraint(equalTo: numberOfCommentsLabel.trailingAnchor, constant: 276),
            shareLabel.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: -16),
            
            dateLabel.widthAnchor.constraint(equalToConstant: 0),
            dateLabel.heightAnchor.constraint(equalToConstant: 0),
            
            timePostedLabel.widthAnchor.constraint(equalToConstant: 0),
            timePostedLabel.heightAnchor.constraint(equalToConstant: 0),
            
            photoTweet.widthAnchor.constraint(equalToConstant: 0),
            photoTweet.heightAnchor.constraint(equalToConstant: 0),
            
            videoTweet.widthAnchor.constraint(equalToConstant: 0),
            videoTweet.heightAnchor.constraint(equalToConstant: 0)
         
        ])
        
        // Set the corner radius of the image view
        profileImageView.layer.cornerRadius = 3.0
        profileImageView.clipsToBounds = true
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
           
    @objc func didTapCommentsLabel() {
          // Handle the tap event here
        
        print("Jam")
      }


    
    
    func configure(with tweet: Tweet) {
        
        nameLabel.text = tweet.name
        messageLabel.text = tweet.message
        if let imageData = tweet.profileName, let image = UIImage(data: imageData) {
            profileImageView.image = image
        } else {
            // Set a default image if the profile image data is nil or unable to be converted to a UIImage
            profileImageView.image = UIImage(named: "defaultProfile")
        }

        titleLabel.text = tweet.title
        userNameLabel.text = tweet.userName
        
        likeImagee.setImage(UIImage(systemName: "\(tweet.likeImagee)"), for: .normal)
        
        reTweetImagee.setImage(UIImage(systemName: "\(tweet.reTweetImagee)"), for: .normal)
      
        commentsLabel.setImage(UIImage(systemName: "\(tweet.commentsLabel)"), for: .normal)
        
        commentsLabel.translatesAutoresizingMaskIntoConstraints = false
        numberOfCommentsLabel.text = "\(tweet.numberOfComments)"
        retweetsLabel.setImage(UIImage(systemName: "repeat"), for: .normal)
        numberOfRetweetsLabel.text = "\(tweet.numberOfRetweets)"
        likesLabel.setImage(UIImage(systemName: "suit.heart"), for: .normal)
        numberOfLikesLabel.text = "\(tweet.numberOfLikes)"
        viewsLabel.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        numberOfViewsLabel.text = "\(tweet.numberOfViews)"
        shareLabel.setImage(UIImage(systemName: "tray.and.arrow.down.fill"), for: .normal)
        dateLabel.text = tweet.date
        numberOfRetweetsLabel.text = "\(tweet.numberOfRetweets)"
     
        
        
    }
    // the amount right amount of things that has to be able
    
    
}



class twitterHomeFeedTableView: UITableViewController, UIViewControllerTransitioningDelegate, AddTweetDelegate, ProfilePickerDelegate {
    func didUpdateName(_ name: String) {
     //   name = name
    }
    
   
    func profilePickerDidFinish(with user: Userr) {
        currentUser = user
        
        // Update the stored profile image in UserDefaults
        if let imageData = user.profilePic!.pngData() {
            UserDefaults.standard.set(imageData, forKey: "profileImage")
        }
        
        // Check if currentUser's profilePic property is not nil
        if let profilePic = user.profilePic {
            profileImageViewImage(profilePic: profilePic)
        } else {
            // Use a default profile image or handle the case when profilePic is nil
            profileImageViewImage(profilePic: UIImage(named: "defaultProfile")!)
        }
        
        // Perform any other necessary actions after selecting the profile image
    }



    func didAddTweet(_ tweet: Tweet) {
        tweets.append(tweet)
        tableView.reloadData()
        
        // Store the updated tweets array in UserDefaults
        let encoder = JSONEncoder()
        if let encodedData = try? encoder.encode(tweets) {
            UserDefaults.standard.set(encodedData, forKey: "tweets")
        }
    }

    var currentUser: Userr?
    var isProfileImageViewHidden = false
    let profileImageView = UIImageView()
    let twitterLogoImageView = UIImageView(image: UIImage(named: "twitterLogo"))
    let addTweetbutton = UIButton(frame: CGRect(x: 150, y: 130, width: 89, height: 64))
    var addTweetViewController: AddTweet?
    let addTweetButton = UIButton()
    var signOutButton = UIButton(type: .system)
 
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
    //   handleAuth()
            // Toggle profileImageView back on
            profileImageView.isHidden = isProfileImageViewHidden
        
      //  handleAuth()
        
        }

    
    
    override func viewDidLoad() {
            super.viewDidLoad()

            let twitterProfileView = TwitterProfileView()
            let maxCharacterLimit = 20 // Define your maximum character limit here
            
            

         addTweetButtonn()
        
        // Retrieve the profile image data from UserDefaults
          if let imageData = UserDefaults.standard.data(forKey: "profileImage") {
              if let profileImage = UIImage(data: imageData) {
                  profileImageViewImage(profilePic: profileImage)
              } else {
                  // Use a default profile image or handle the case when the image data is invalid
                  profileImageViewImage(profilePic: UIImage(named: "defaultProfile")!)
              }
          } else {
              // Use a default profile image or handle the case when the image data is not found
              profileImageViewImage(profilePic: UIImage(named: "defaultProfile")!)
          }

           
            // Retrieve the stored tweets from UserDefaults
             if let encodedData = UserDefaults.standard.data(forKey: "tweets") {
                 let decoder = JSONDecoder()
                 if let decodedData = try? decoder.decode([Tweet].self, from: encodedData) {
                     tweets = decodedData
                 }
             }

                
             // Retrieve the saved name and set it in TwitterProfileView
             if let name = UserDefaults.standard.string(forKey: "ProfileName") {
                 twitterProfileView.profileName.text = name
                 
                 print(twitterProfileView.profileName.text as Any)
                 
                 
                 tweets[0].name = name
                 
                 
             
                 
             }

             
           // performSegue(withIdentifier: "tweetCell", sender: self)
            
            tableView.delegate = self
            tableView.dataSource = self
            tableView.isUserInteractionEnabled = true
               
   

          configureSignOutButton()
            
            profileImageView.isUserInteractionEnabled = true
            
            let tapGuestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
            
            profileImageView.addGestureRecognizer(tapGuestureRecognizer)
            
            tabBarController?.delegate = self
            
            tableView.register(MyTableViewCell.self, forCellReuseIdentifier: "tweetCell")
            
            
            // Set the delegate of the UITabBarController to self
            self.tabBarController?.delegate = self
            
            tableView.translatesAutoresizingMaskIntoConstraints = false
         //   twitterLogoImageView.translatesAutoresizingMaskIntoConstraints = false
            addTweetbutton.translatesAutoresizingMaskIntoConstraints = false
            
        }
        
   
    @objc func addTweetButtonTapped() {
        let addTweetViewController = AddTweet(profileImage: profileImageView.image)

        addTweetViewController.delegate = self // Set the delegate to self
        addTweetViewController.profileImageView.image = profileImageView.image // Pass the profile image
        
        navigationController?.modalPresentationStyle = .fullScreen
        navigationController?.modalTransitionStyle = .crossDissolve
        present(addTweetViewController, animated: true, completion: nil)
    }

    func addTweetButtonn() {
        addTweetbutton.setImage(UIImage(named: "addTweet"), for: .normal)
        addTweetbutton.layer.zPosition = 233
        addTweetbutton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(addTweetbutton)

        NSLayoutConstraint.activate([
            addTweetbutton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 143),
            addTweetbutton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -25),
            addTweetbutton.widthAnchor.constraint(equalToConstant: 95),
            addTweetbutton.heightAnchor.constraint(equalToConstant: 77)
        ])

        addTweetbutton.addTarget(self, action: #selector(addTweetButtonTapped), for: .touchUpInside)
    }



    
    func profileImageViewImage(profilePic: UIImage) {
     //    profileImageView.image = UIImage(named: "defaultProfile")
        
        profileImageView.image = profilePic

        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        
        let profileSideVC = TwitterProfileSideViewController()
              profileSideVC.profileImage = profileImageView.image
        
        // Access the tab bar controller's view instead of the current view
        guard let tabBarController = self.tabBarController else { return }
        tabBarController.view.clipsToBounds = false // Allow the image view to be visible outside the bounds of the view
        
        profileImageView.layer.masksToBounds = false

        profileImageView.layer.cornerRadius = 23.0
        profileImageView.clipsToBounds = true

        tabBarController.view.addSubview(profileImageView)

        NSLayoutConstraint.activate([
            profileImageView.trailingAnchor.constraint(equalTo: tabBarController.view.leadingAnchor, constant: 63),
            profileImageView.topAnchor.constraint(equalTo: tabBarController.view.topAnchor, constant: 48),
            profileImageView.widthAnchor.constraint(equalToConstant: 46),
            profileImageView.heightAnchor.constraint(equalToConstant: 45)
        ])
    }

    //
    func configureSignOutButton() {
        signOutButton.setImage(UIImage(systemName: "rectangle.portrait.and.arrow.right"), for: .normal)
           signOutButton.translatesAutoresizingMaskIntoConstraints = false
           
           // Access the tab bar controller's view instead of the current view
           guard let tabBarController = self.tabBarController else { return }
           tabBarController.view.addSubview(signOutButton)
           
           NSLayoutConstraint.activate([
               signOutButton.trailingAnchor.constraint(equalTo: tabBarController.view.trailingAnchor, constant: -16),
               signOutButton.topAnchor.constraint(equalTo: tabBarController.view.topAnchor, constant: 48),
               signOutButton.widthAnchor.constraint(equalToConstant: 30),
               signOutButton.heightAnchor.constraint(equalToConstant: 30)
           ])
           
           signOutButton.addTarget(self, action: #selector(didTapSignOut), for: .touchUpInside)
    }




    @objc func didTapSignOut() {
      try? Auth.auth().signOut()
        handleAuth()
    }
    
    
    func handleAuth() {
        if Auth.auth().currentUser == nil {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let navController = storyboard.instantiateViewController(withIdentifier: "nav") as? UINavigationController,
               let twitterSignUpHomePage = storyboard.instantiateViewController(withIdentifier: "signup") as? TwitterSignUpHomePage {
                navController.setViewControllers([twitterSignUpHomePage], animated: true)
                navController.modalPresentationStyle = .fullScreen
                present(navController, animated: false)
            }
        }
    }





    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        let tapLocation = sender.location(in: profileImageView)
        if profileImageView.bounds.contains(tapLocation) {
            // The tap was inside the profile image view
            profileImageTapped()
            print("JYF")
        }
    }

    
    @objc func profileImageTapped() {
        let sideViewController = TwitterProfileSideViewController()
       sideViewController.profileImage = profileImageView.image
        let presentationDelegate = TwitterProfilePresentationDelegate()
        sideViewController.transitioningDelegate = presentationDelegate
        sideViewController.modalPresentationStyle = .custom

        present(sideViewController, animated: true, completion: nil)
    }



    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweets.count
    }
    
    
    var tweets: [Tweet] = [
        
     
        
    
        
    ]
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "tweetCell", for: indexPath) as? MyTableViewCell else {
            fatalError("Unable to dequeue TweetTableViewCell")
            
        }
        
        let tweet = tweets[indexPath.row]
        cell.configure(with: tweet)
        cell.isUserInteractionEnabled = true
        return cell
        
    
        
    }
    

    
    //https://github.com/imjusttrynabelikeElon/Twitter-clone-with-own-touches
    //
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Function: tableView(_:didSelectRowAt:)")
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
          
     
              guard let vc = storyBoard.instantiateViewController(withIdentifier: "detail") as? TwitterHomeViewDetailViewController else {
              print("failed to instantiate detail view controller")
                  
              return
              }
        
       
        profileImageView.isHidden = true
      
       
      
        
        /*
         guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "detail") as? TwitterHomeViewDetailViewController else {
              print("failed to instantiate detail view controller")
             return
         }
          */
        
        
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .flipHorizontal
        vc.nameLabell = tweets[indexPath.row].name
        print(vc.nameLabell!)
        
        vc.userNamee = tweets[indexPath.row].userName
        
        vc.datee = tweets[indexPath.row].date
        
        let commentsName = tweets[indexPath.row].commentsLabel
        let commentsImage = UIImage(systemName: commentsName)
        
        let retweetName = tweets[indexPath.row].reTweetImagee
        
        let retweetImage = UIImage(systemName: retweetName)
        
        let likeName = tweets[indexPath.row].likeImagee
        
        let likeImage = UIImage(systemName: likeName)
        
        vc.likeImagee = likeImage
        
        let shareName = tweets[indexPath.row].shareImagee
        
        let shareImage = UIImage(systemName: shareName)
        
        vc.shareImagee = shareImage
        
        vc.reTweetImagee = retweetImage
        
        vc.commentsImagee = commentsImage
        
        vc.timee = tweets[indexPath.row].timePosted
        
        vc.numberOfRetweets = tweets[indexPath.row].numberOfRetweets
        
        vc.retweett = tweets[indexPath.row].reTweetName
        
        vc.likee = tweets[indexPath.row].likesName
        
        vc.numberOfLikes = tweets[indexPath.row].numberOfLikes
        
        vc.likeImage = tweets[indexPath.row].likes
        
        let imageData = tweets[indexPath.row].profileName
        let image = UIImage(data: imageData!)

        vc.selectedProfileImage = image
      
      
        vc.selectedTweet = tweets[indexPath.row].message
        print("selectedTweet set")
        print(vc.selectedTweet!)
        
        if let navVC = navigationController {
            // Create a custom back button image
            let backButtonImage = UIImage(systemName: "house")

            // Set the custom back button image for the previous view controller's navigation item
            let backButtonItem = UIBarButtonItem(image: backButtonImage, style: .plain, target: nil, action: nil)
            navVC.navigationBar.backItem?.backBarButtonItem = backButtonItem

            navVC.pushViewController(vc, animated: true)
        } else {
            let navVC = UINavigationController(rootViewController: vc)
            navVC.modalPresentationStyle = .fullScreen
            vc.tabBarItem.image = UIImage(systemName: "house")
            navVC.modalTransitionStyle = .partialCurl

            present(navVC, animated: true, completion: nil)
        }



         
    }




    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 111
    }
    
    
   

   
}

extension twitterHomeFeedTableView: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        // Check if the selected view controller belongs to the "For you" tab
        if let currentViewController = self.tabBarController?.selectedViewController,
           currentViewController.tabBarItem.title == "Following" {
            // Reload the table view data if the current view controller is the "For you" tab
            tableView.reloadData()
            print("JGHV")
        }
        
    }
}


extension twitterHomeFeedTableView {
    
   
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return CustomPresentationAnimator(isPresenting: true)
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return CustomPresentationAnimator(isPresenting: false)
    }
}
