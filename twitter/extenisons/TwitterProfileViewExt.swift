//
//  TwitterProfileViewExt.swift
//  twitter
//
//  Created by Karon Bell on 5/24/23.
//

import Foundation
import UIKit

// this is just the extension.

extension TwitterProfileView  {
    // Implement EditProfileDelegate methods
      
      func updateName(_ name: String) {
          profileName.text = name
          UserDefaults.standard.set(name, forKey: "ProfileName")
      }
      
      func updateBio(_ bio: String) {
          profileBio.text = bio
          UserDefaults.standard.set(bio, forKey: "ProfileBio")
      }
      
}

