//
//  Constants.swift
//  BitBucketList
//
//  Created by Sreekanth on 3/9/21.
//

import Foundation
import UIKit

enum Constants {
    enum General{
        static let delayTimer = 0.1
    }
  static let baseURL = "https://api.bitbucket.org/2.0/repositories"
  static let timeInterval: TimeInterval = 30
  static let splashImage = "bitbucketrepolist"
  enum Animation {
        static let animationrepeat: Float = 2
        static let animationFile = "bitbucketrepolist"
        
    }
    struct Decimals {
        static let half: Double = 0.5
    }
  static let screenSize: CGRect = UIScreen.main.bounds
  static let screenWidth = screenSize.width
  static let screenHeight = screenSize.height
  static let tableHeight = screenHeight - 100
  static let rightWidth = screenWidth / 2  - 60
  static let leftWidth  = screenWidth / 2 - 15
  static let dateformmatter = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
  static let stringformatter = "MMM d, yyyy"
}
