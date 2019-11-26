//
//  UIViewExtension.swift
//  Themes
//
//  Created by Tristan on 11/26/19.
//  Copyright © 2019 Tristan Bilot. All rights reserved.
//

import UIKit

extension UIView {

    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
         let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
         let mask = CAShapeLayer()
         mask.path = path.cgPath
         self.layer.mask = mask
    }

}
