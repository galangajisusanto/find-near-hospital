//
//  Extenstion.swift
//  Find Near Hospital
//
//  Created by Galang Aji Susanto on 17/07/21.
//

import Foundation
import UIKit

extension UIView {
   func makeRoundCorners(byRadius rad: CGFloat) {
      self.layer.cornerRadius = rad
      self.clipsToBounds = true
   }
}
