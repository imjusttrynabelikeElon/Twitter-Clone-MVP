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


class AddTweet: UIViewController, UITextFieldDelegate {
    let profileImageView = UIImageView()
    let tweetButton = UIButton()
    let tweetTextField = UITextField()
    weak var delegate: AddTweetDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

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
        let newTweet = Tweet(name: "Your Name", message: tweetTextField.text ?? "", profileImageName: "your_profile_image_name", title: "", userName: "@your_username", comments: "KUOH", numberOfComments: 0, retweet: "KIHUOL", numberOfRetweets: 0, likes: "IKUHU", numberOfLikes: 0, views: "KUHO", numberOfViews: 0, share: "IHLPHI", date: "05/21/23", timePosted: "12:00am", reTweetName: "Retweets", likesName: "Likes", commentsLabel: "message", reTweetImagee: "repeat", likeImagee: "suit.heart", shareImagee: "tray.and.arrow.down.fill")

        delegate?.didAddTweet(newTweet)
        dismiss(animated: true)
        print("Tapped")
    }


}
