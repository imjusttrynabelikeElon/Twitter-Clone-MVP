//
//  Bio.swift
//  twitter
//
//  Created by Karon Bell on 6/22/23.
//


import UIKit

class UserNameAndBio: UIViewController {
    
    @IBOutlet weak var nextButton: UIButton!
    
    let twitterLogoImage = UIImageView()
    let userNameTextField = UITextField()
    let bioTextField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTwitterLogoImage()
        configureUserNameTextField()
        configureBioTextField()
        updateNextButtonState()
    }
    
    func configureTwitterLogoImage() {
        // Configure the Twitter logo image
        twitterLogoImage.translatesAutoresizingMaskIntoConstraints = false
        twitterLogoImage.image = UIImage(named: "twitterLogo") // Replace "twitterLogo" with the actual image name
        twitterLogoImage.contentMode = .scaleAspectFit
        
        view.addSubview(twitterLogoImage)
        
        // Add Auto Layout constraints to center the Twitter logo image
        NSLayoutConstraint.activate([
            twitterLogoImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            twitterLogoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            twitterLogoImage.widthAnchor.constraint(equalToConstant: 100),
            twitterLogoImage.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    func configureUserNameTextField() {
        // Configure the username text field
        userNameTextField.translatesAutoresizingMaskIntoConstraints = false
        userNameTextField.placeholder = "Username"
        userNameTextField.layer.borderWidth = 1.5 // Adjust the border width as desired
        userNameTextField.layer.borderColor = UIColor.lightGray.cgColor // Adjust the border color as desired
        userNameTextField.addTarget(self, action: #selector(userNameTextFieldDidChange(_:)), for: .editingChanged) // Add target for text change event
        
        view.addSubview(userNameTextField)
        
        // Add Auto Layout constraints for the username text field
        NSLayoutConstraint.activate([
            userNameTextField.topAnchor.constraint(equalTo: twitterLogoImage.bottomAnchor, constant: 20),
            userNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            userNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            userNameTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func configureBioTextField() {
        // Configure the bio text field
        bioTextField.translatesAutoresizingMaskIntoConstraints = false
        bioTextField.placeholder = "Bio"
        bioTextField.layer.borderWidth = 1.5 // Adjust the border width as desired
        bioTextField.layer.borderColor = UIColor.lightGray.cgColor // Adjust the border color as desired
        bioTextField.addTarget(self, action: #selector(bioTextFieldDidChange(_:)), for: .editingChanged) // Add target for text change event
        
        view.addSubview(bioTextField)
        
        // Add Auto Layout constraints for the bio text field
        NSLayoutConstraint.activate([
            bioTextField.topAnchor.constraint(equalTo: userNameTextField.bottomAnchor, constant: 40),
            bioTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            bioTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            bioTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        // Add nextButton constraints
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nextButton)
        
        NSLayoutConstraint.activate([
            nextButton.topAnchor.constraint(equalTo: bioTextField.bottomAnchor, constant: 40),
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            nextButton.widthAnchor.constraint(equalToConstant: 80),
            nextButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    @objc func userNameTextFieldDidChange(_ textField: UITextField) {
        updateNextButtonState()
        guard let text = textField.text else { return }
        let remainingCharacters = 18 - text.count
        let charactersLeftText = "\(remainingCharacters) characters left"
        textField.textColor = remainingCharacters >= 0 ? .black : .red
        textField.rightView = createCharactersLeftLabel(charactersLeftText)
        textField.rightViewMode = .always
    }
    
    @objc func bioTextFieldDidChange(_ textField: UITextField) {
        updateNextButtonState()
        guard let text = textField.text else { return }
        let remainingCharacters = 100 - text.count
        let charactersLeftText = "\(remainingCharacters) characters left"
        textField.textColor = remainingCharacters >= 0 ? .black : .red
        textField.rightView = createCharactersLeftLabel(charactersLeftText)
        textField.rightViewMode = .always
    }
    
    private func createCharactersLeftLabel(_ text: String) -> UILabel {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 40))
        label.text = text
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .gray
        label.textAlignment = .right
        return label
    }
    
    private func updateNextButtonState() {
           let nameCharacterCount = getCharacterCount(from: userNameTextField.text)
           let bioCharacterCount = getCharacterCount(from: bioTextField.text)
           
           nextButton.isEnabled = nameCharacterCount >= 5 && bioCharacterCount >= 5
           
           if nextButton.isEnabled {
               print("Next button is enabled.")
           }
       }
       
       private func getCharacterCount(from text: String?) -> Int {
           guard let text = text else { return 0 }
           return text.count
       }
}
    
