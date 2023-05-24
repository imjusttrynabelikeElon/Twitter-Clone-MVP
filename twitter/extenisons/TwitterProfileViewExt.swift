//
//  TwitterProfileViewExt.swift
//  twitter
//
//  Created by Karon Bell on 5/24/23.
//

import Foundation
import UIKit


extension TwitterProfileView {
    // Implement EditProfileDelegate methods
      func didUpdateName(_ name: String) {
          profileName.text = name
      }

      func didUpdateBio(_ bio: String) {
          profileBio.text = bio
      }

}

