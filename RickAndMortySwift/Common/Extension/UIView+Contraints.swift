//
//  UIView+Contraints.swift
//  RickAndMortySwift
//
//  Created by Kevin Morales on 2/1/23.
//

import UIKit

extension UIView {
    func setContraints(top: NSLayoutYAxisAnchor? = nil,
                       right: NSLayoutXAxisAnchor? = nil,
                       bottom: NSLayoutYAxisAnchor? = nil,
                       left: NSLayoutXAxisAnchor? = nil,
                       pTop: CGFloat = .zero,
                       pRight: CGFloat = .zero,
                       pBottom: CGFloat = .zero,
                       pLeft: CGFloat = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        if let top {
            topAnchor.constraint(equalTo: top, constant: pTop).isActive = true
        }
        if let right {
            rightAnchor.constraint(equalTo: right, constant: -pRight).isActive = true
        }
        if let bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -pBottom).isActive = true
        }
        if let left {
            leftAnchor.constraint(equalTo: left, constant: pLeft).isActive = true
        }
    }
    
    func fillSuperView(widthPadding: CGFloat = .zero) {
        guard let superview else { return }
        setContraints(top: superview.topAnchor,
                      right: superview.rightAnchor,
                      bottom: superview.bottomAnchor,
                      left: superview.leftAnchor,
                      pTop: widthPadding,
                      pRight: widthPadding,
                      pBottom: widthPadding,
                      pLeft: widthPadding)
    }
}
