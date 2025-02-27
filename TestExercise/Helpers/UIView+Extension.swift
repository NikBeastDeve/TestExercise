//
//  UIView+Extension.swift
//  TestExercise
//
//  Created by Nikita Galaganov on 28.09.2020.
//

// code from:
// https://gist.github.com/kemalekren/08a986ca1cdc8cf5b5d38bdbfbe39271#file-extension-swift

import UIKit

extension UIView {
     
     func anchor (top: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, right: NSLayoutXAxisAnchor?, paddingTop: CGFloat, paddingLeft: CGFloat, paddingBottom: CGFloat, paddingRight: CGFloat, width: CGFloat, height: CGFloat, enableInsets: Bool) {
        
        var topInset = CGFloat(0)
        var bottomInset = CGFloat(0)
     
        let insets = self.safeAreaInsets
        topInset = insets.top
        bottomInset = insets.bottom
     
        print("Top: \(topInset)")
        print("bottom: \(bottomInset)")
     
     
        translatesAutoresizingMaskIntoConstraints = false
     
        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: paddingTop+topInset).isActive = true
        }
        if let left = left {
            self.leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom-bottomInset).isActive = true
        }
        if height != 0 {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        if width != 0 {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
    }
}
