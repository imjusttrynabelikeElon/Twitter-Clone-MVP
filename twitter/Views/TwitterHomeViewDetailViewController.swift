//
//  TwitterHomeViewDetailViewController.swift
//  twitter
//
//  Created by Karon Bell on 5/7/23.
//

import Foundation
import UIKit

//

//


class TwitterHomeViewDetailViewController: UIViewController {
   
    @IBOutlet weak var selectedLabel: UILabel!
    
    var selectedTweet: String?
    
    var selectedProfileImage: UIImage?
   
    var nameLabell: String?
    
    var nameUILabel: UILabel!
    
    var userNameLabell: UILabel!
    
    var userNamee: String?
    
    var dateLabel: UILabel!
    
    var datee: String?
    
    var timeLabel: UILabel!
    
    var timee: String?
    
    var retweetLabel: UILabel!
    
    
    var retweett: String?
    
    var likee: String?
    
    var numberOfLikes: Int?
    
   var numberOfLikesLabel: UILabel!
    
    
    var likeLabel: UILabel!
    
    
    var comment: String?
    
    
    var commentLabel: UILabel!
    
    
    var share: String?
    
    
    var shareLabel: UILabel!
    
    
    var numberOfRetweets: Int?
    
    
    var numberOfRetweetsLabel: UILabel!
    
    var likeImage: String?
    
    
    var likeImageLabel: UILabel!
    
    
    var reTweetImage: String?
    
    
    var reTweetImageLabel: UILabel!
    
    
    var shareImageLabel: UILabel!
    
    
    var commentsImageLabel: UILabel!
    
  
    var commentsImage: String?
    
    var shareImage: String?
    
    var numberOfReTweetsName: UILabel!
    
    var commentsImagee: UIImage!
    
    
    var reTweetImagee: UIImage!
    
    var likeImagee: UIImage!
    
    var shareImagee: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("K")
        
        
        view.backgroundColor = .white
        
        // Set the title of the navigation bar
             self.title = "Tweet"
   
             // Create a back bar button item
             let backButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(backButtonTapped))
             self.navigationItem.leftBarButtonItem = backButton
        
        
        

        if let commentImageToLoad = commentsImagee as UIImage? {
            let commentImage = UIButton()
            commentImage.setImage(commentImageToLoad, for: .normal)
            commentImage.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(commentImage)

            // Add constraints to center the commentImage horizontally and vertically
            NSLayoutConstraint.activate([
              
                commentImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -185),
                commentImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -303),
                commentImage.widthAnchor.constraint(equalToConstant: 33),
                commentImage.heightAnchor.constraint(equalToConstant: 63)
            ])
        }
        
        
        if let likeToLoad = likeImagee as UIImage? {
            let likeeImage = UIButton()
            likeeImage.setImage(likeToLoad, for: .normal)
            likeeImage.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(likeeImage)

            // Add constraints to center the commentImage horizontally and vertically
            NSLayoutConstraint.activate([
              
                likeeImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -185),
                likeeImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -144),
               likeeImage.heightAnchor.constraint(equalToConstant: 63)
            ])
        }
        
        if let shareImageToLoad = shareImagee as UIImage? {
            let shareImageee = UIButton()
            shareImageee.setImage(shareImageToLoad, for: .normal)
            shareImageee.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(shareImageee)

            // Add constraints to center the commentImage horizontally and vertically
            NSLayoutConstraint.activate([
              
               shareImageee.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -185),
                shareImageee.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -63),
               shareImageee.heightAnchor.constraint(equalToConstant: 63)
            ])
        }
        
        if let retweetImageToLoad = reTweetImagee as UIImage? {
            let retweetImage = UIButton()
            retweetImage.setImage(retweetImageToLoad, for: .normal)
            retweetImage.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(retweetImage)

            // Add constraints to center the commentImage horizontally and vertically
            NSLayoutConstraint.activate([
              
               retweetImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -185),
                retweetImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -223),
               retweetImage.widthAnchor.constraint(equalToConstant: 33),
                retweetImage.heightAnchor.constraint(equalToConstant: 63)
            ])
        }
        

        if let label = selectedLabel as UILabel? {
            label.numberOfLines = 0
            label.lineBreakMode = .byWordWrapping
            
            label.textAlignment = .center
            label.translatesAutoresizingMaskIntoConstraints = false
            
            
            view.addSubview(label)
            
            if let tweetToLoad = selectedTweet {
                label.text = tweetToLoad
                print(tweetToLoad)
                print("HTGDC")
                label.sizeToFit()
                
            }
            
            label.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                label.heightAnchor.constraint(equalToConstant: 580),
                label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
             
                label.widthAnchor.constraint(equalToConstant: 280),
                label.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -293),
               
            ])
            
            
            timeLabel = UILabel()
         
         
         
         if let timeLabell = timeLabel as UILabel? {
            timeLabell.numberOfLines = 0
            timeLabell.lineBreakMode = .byWordWrapping
            timeLabell.textAlignment = .center
            timeLabell.translatesAutoresizingMaskIntoConstraints = false
             
             
             view.addSubview(timeLabell)
             
             if let timeToPost = timee {
                 timeLabell.text = timeToPost
 
                 timeLabell.sizeToFit()
             }
             
             timeLabell.translatesAutoresizingMaskIntoConstraints = false
             NSLayoutConstraint.activate([
                 timeLabell.heightAnchor.constraint(equalToConstant: 400),
                 timeLabell.widthAnchor.constraint(equalToConstant: 180),
                 timeLabell.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -115),
                 timeLabell.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -133)
             
             ])
             
         }
         
           

            
            
            if let retweetLabell = retweetLabel as UILabel? {
                retweetLabell.numberOfLines = 0
                retweetLabell.lineBreakMode = .byWordWrapping
                retweetLabell.textAlignment = .center
                retweetLabell.translatesAutoresizingMaskIntoConstraints = false
                
                
                view.addSubview(retweetLabell)
                
                if let timeToPost = timee {
                    retweetLabell.text = timeToPost
    
                    retweetLabell.sizeToFit()
                }
         //
                retweetLabell.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    retweetLabell.heightAnchor.constraint(equalToConstant: 400),
                    retweetLabell.widthAnchor.constraint(equalToConstant: 180),
                    retweetLabell.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -115),
                    retweetLabell.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -133)
                
                ])
            }
            
            
            if let retweetToLoad = retweetLabel as UILabel? {
                retweetToLoad.numberOfLines = 0
                retweetToLoad.lineBreakMode = .byWordWrapping
                retweetToLoad.textAlignment = .center
                retweetToLoad.translatesAutoresizingMaskIntoConstraints = false
                
                
                view.addSubview(retweetToLoad)
                
                if let retweetLabel = retweett {
                    retweetToLoad.text = retweetLabel
                    
                    retweetToLoad.sizeToFit()
                }
            }
            
            
            if let likeToLoad = likeLabel as UILabel? {
                likeToLoad.numberOfLines = 0
                likeToLoad.lineBreakMode = .byWordWrapping
                likeToLoad.textAlignment = .center
                likeToLoad.translatesAutoresizingMaskIntoConstraints = false
                
                
                view.addSubview(likeToLoad)
                
                if let likeLabel = likee {
                    likeToLoad.text = likeLabel
                    
                    likeToLoad.sizeToFit()
                }
            }
            
         

            
            if let reTweetImageToLoad = reTweetImageLabel as UILabel? {
               reTweetImageToLoad.numberOfLines = 0
               reTweetImageToLoad.lineBreakMode = .byWordWrapping
               reTweetImageToLoad.textAlignment = .center
               reTweetImageToLoad.translatesAutoresizingMaskIntoConstraints = false
           
                
                view.addSubview(reTweetImageToLoad)
                
                if let reTweetImageToLoad = reTweetImageLabel {
                    reTweetImageToLoad.text = reTweetImage
                    
                   reTweetImageToLoad.sizeToFit()
                }
            }
            
            
            if let likeImageToLoad = likeImageLabel as UILabel? {
               likeImageToLoad.numberOfLines = 0
               likeImageToLoad.lineBreakMode = .byWordWrapping
               likeImageToLoad.textAlignment = .center
               likeImageToLoad.translatesAutoresizingMaskIntoConstraints = false
           
                
                view.addSubview(likeImageToLoad)
                
                if let likeImageToLoad = likeImageLabel {
                    likeImageToLoad.text = likeImage
                    
                   likeImageToLoad.sizeToFit()
                }
            }
            
            if let shareImageToLoad = shareImageLabel as UILabel? {
               shareImageToLoad.numberOfLines = 0
               shareImageToLoad.lineBreakMode = .byWordWrapping
               shareImageToLoad.textAlignment = .center
               shareImageToLoad.translatesAutoresizingMaskIntoConstraints = false
           
                
                view.addSubview(shareImageToLoad)
                
                if let shareImageToLoad = shareImageLabel {
                   shareImageToLoad.text = shareImage
                    
                   shareImageLabel.sizeToFit()
                }
            }
            
            dateLabel = UILabel()

            
            if let dateToLoad = dateLabel as UILabel? {
                dateToLoad.numberOfLines = 0
                dateToLoad.lineBreakMode = .byWordWrapping
                dateToLoad.textAlignment = .center
                dateToLoad.translatesAutoresizingMaskIntoConstraints = false
                
                view.addSubview(dateToLoad)
                
                if let DateLabell = datee {
                    dateToLoad.text = DateLabell
                    dateToLoad.sizeToFit()
                }
                
                NSLayoutConstraint.activate([
                
                    dateToLoad.heightAnchor.constraint(equalToConstant: 100),
                    dateToLoad.widthAnchor.constraint(equalToConstant: 150),
                    dateToLoad.bottomAnchor.constraint(equalTo: label.bottomAnchor, constant: 10),
                    dateToLoad.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -33)
                ])
            }
            
            
            timeLabel = UILabel()
         
         
         
         if let timeLabell = timeLabel as UILabel? {
            timeLabell.numberOfLines = 0
            timeLabell.lineBreakMode = .byWordWrapping
            timeLabell.textAlignment = .center
            timeLabell.translatesAutoresizingMaskIntoConstraints = false
             
             
             view.addSubview(timeLabell)
             
             if let timeToPost = timee {
                 timeLabell.text = timeToPost
 
                 timeLabell.sizeToFit()
             }
             
             timeLabell.translatesAutoresizingMaskIntoConstraints = false
             NSLayoutConstraint.activate([
                 timeLabell.heightAnchor.constraint(equalToConstant: 400),
                 timeLabell.widthAnchor.constraint(equalToConstant: 180),
                 timeLabell.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -115),
                 timeLabell.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -133)
             
             ])
             
         }
            
        
            numberOfRetweetsLabel = UILabel()
            
            if let numberOfReTweetsToLoad = numberOfRetweetsLabel as UILabel? {
               numberOfReTweetsToLoad.numberOfLines = 0
               numberOfReTweetsToLoad.lineBreakMode = .byWordWrapping
               numberOfReTweetsToLoad.textAlignment = .center
               numberOfReTweetsToLoad.translatesAutoresizingMaskIntoConstraints = false
           
                
                view.addSubview(numberOfReTweetsToLoad)
             
                if let numberOfRetweetsLabel = numberOfRetweetsLabel {
                    numberOfRetweetsLabel.text = "\(numberOfRetweets!)"
                    numberOfRetweetsLabel.sizeToFit()
                }

            }
            
            NSLayoutConstraint.activate([
                numberOfRetweetsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -253),
                numberOfRetweetsLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -258),
              
            
            ])
            
            numberOfReTweetsName = UILabel()
            
            if let reTweetNameToLoad = numberOfReTweetsName as UILabel? {
               reTweetNameToLoad.numberOfLines = 0
               reTweetNameToLoad.lineBreakMode = .byWordWrapping
               reTweetNameToLoad.textAlignment = .center
               reTweetNameToLoad.translatesAutoresizingMaskIntoConstraints = false
           
                
                view.addSubview(reTweetNameToLoad)
             
                if let TweetToLoadName = retweett {
                    reTweetNameToLoad.text = TweetToLoadName
                    reTweetNameToLoad.sizeToFit()
                }

            }
            
            NSLayoutConstraint.activate([
                numberOfReTweetsName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -283),
                numberOfReTweetsName.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -258),
              
            
            ])
            
           
            
            numberOfLikesLabel = UILabel()
            
            if let numberOfLikesToLoad = numberOfLikesLabel as UILabel? {
                numberOfLikesToLoad.numberOfLines = 0
                numberOfLikesToLoad.lineBreakMode = .byWordWrapping
                numberOfLikesToLoad.textAlignment = .center
                numberOfLikesToLoad.translatesAutoresizingMaskIntoConstraints = false
                
                view.addSubview(numberOfLikesToLoad)
                
                if let numberOfLikesLabell = numberOfLikesLabel {
                    numberOfLikesLabell.text = "\(numberOfLikes!)"
                    numberOfLikesLabell.sizeToFit()
                }
            
            }
            NSLayoutConstraint.activate([
               numberOfLikesLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -83),
                numberOfLikesLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -258),
              
            
            ])
            
          likeLabel = UILabel()
            
            if let likeNamee = likeLabel as UILabel? {
                likeNamee.numberOfLines = 0
                likeNamee.lineBreakMode = .byWordWrapping
                likeNamee.textAlignment = .center
                likeNamee.translatesAutoresizingMaskIntoConstraints = false
           
                
                view.addSubview(likeNamee)
             
                if let likeNameToLoad = likee {
                  likeNamee.text = likeNameToLoad
                  likeNamee.sizeToFit()
                }

            }
            
            NSLayoutConstraint.activate([
                likeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -110),
               likeLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -258),
              
            
            ])
            
            
            
           
            
           
        }
        
      
        
      //  numberOfRetweetsLabel = UILabel()
        
         shareLabel = UILabel()
        
         commentsImageLabel = UILabel()
        
         retweetLabel = UILabel()
        
         likeLabel = UILabel()
        
         nameUILabel = UILabel()

         userNameLabell = UILabel()
            
      
        
        
            
            if let selectedProfileImage = selectedProfileImage {
                let imageView = UIImageView(image: selectedProfileImage)
                imageView.translatesAutoresizingMaskIntoConstraints = false
                view.addSubview(imageView)
            
                if let nameToLoad = nameUILabel as UILabel?  {
                  
                    nameToLoad.lineBreakMode = .byWordWrapping
                    print("UTFC")
                    nameToLoad.textAlignment = .center
                    nameToLoad.translatesAutoresizingMaskIntoConstraints = false
                    
                    view.addSubview(nameToLoad)
                    
                    if let namme = nameLabell {
                        if namme.count > 15 {
                            let endIndex = namme.index(namme.startIndex, offsetBy: 15)
                            let truncatedName = namme[..<endIndex] + "..."
                            nameToLoad.text = String(truncatedName)
                        } else {
                            nameToLoad.text = namme
                        }
                    }

                    
                    NSLayoutConstraint.activate([
                        
                        nameToLoad.heightAnchor.constraint(equalToConstant: 400),
                        nameToLoad.widthAnchor.constraint(equalToConstant: 200),
                        nameToLoad.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -500),
                        nameToLoad.trailingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 200),
                        nameToLoad.centerYAnchor.constraint(equalTo: imageView.centerYAnchor), // Align the centerY of the label with the centerY of the imageView
                         nameToLoad.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 8), // Place the leading edge of the label after the trailing edge of the imageView with a small spacing
                        
                    ])
                    
                   
                  
                    if let userNameToLoad = userNameLabell as UILabel?  {
                        userNameToLoad.numberOfLines = 0
                        userNameToLoad.lineBreakMode = .byWordWrapping
                        
                        userNameToLoad.textAlignment = .center
                        userNameToLoad.translatesAutoresizingMaskIntoConstraints = false
                        
                        view.addSubview(userNameToLoad)
                        
                        if let UserNamee = userNamee {
                            userNameToLoad.text = UserNamee
                            print("Hi \(UserNamee)")
                            print("JYCG")
                            userNameToLoad.sizeToFit()
                        }
                        
                        NSLayoutConstraint.activate([
                            
                            userNameToLoad.heightAnchor.constraint(equalToConstant: 400),
                            userNameToLoad.widthAnchor.constraint(equalToConstant: 200),
                            userNameToLoad.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -478),
                            userNameToLoad.trailingAnchor.constraint(equalTo: nameToLoad.leadingAnchor, constant: 233),
                            userNameToLoad.leadingAnchor.constraint(equalTo: nameToLoad.trailingAnchor, constant: -233)
                            
                        ])
                    }
                    
                }
                
                // Add the tap gesture recognizer to the imageView
                let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
                imageView.addGestureRecognizer(tapGesture)

                NSLayoutConstraint.activate([
                    imageView.heightAnchor.constraint(equalToConstant: 50),
                    imageView.widthAnchor.constraint(equalToConstant: 50),
                    imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -150),
                    imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -680),
                    
                
                ])
                
                imageView.layer.cornerRadius = 25 // sets the corner radius to half of the width/height of the view
                imageView.clipsToBounds = true // makes sure the corners are rounded and not visible outside the view

                imageView.isUserInteractionEnabled = true

        }
        
      
        

    }
    
    @objc func imageTapped() {
        let fullScreenImageView = UIImageView(image: selectedProfileImage)
        fullScreenImageView.frame = view.frame
        fullScreenImageView.contentMode = .scaleAspectFit
        
        let fullScreenVC = UIViewController()
        fullScreenVC.view.addSubview(fullScreenImageView)
        fullScreenVC.modalPresentationStyle = .popover
        
        present(fullScreenVC, animated: true) {
            // Add a tap gesture recognizer to dismiss the full screen view controller
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissFullScreen))
            fullScreenVC.view.addGestureRecognizer(tapGesture)
        }
    }

    @objc func dismissFullScreen() {
        dismiss(animated: true, completion: nil)
    }

 
    @IBAction func backButtonTapped(_ sender: UIBarButtonItem) {
           navigationController?.popViewController(animated: true)
        
       }



}
//
