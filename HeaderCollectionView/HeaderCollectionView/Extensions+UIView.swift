//
//  Extensions+UIView.swift
//  HeaderCollectionView
//
//  Created by Elliot Glaze on 05/03/2019.
//  Copyright © 2019 Elliot Glaze. All rights reserved.
//

import UIKit

struct AnchoredConstraints {
    var top, leading, bottom, trailing, width, height: NSLayoutConstraint?
}

extension UIView {
    
    @discardableResult
    func anchor(top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, trailing: NSLayoutXAxisAnchor?, padding: UIEdgeInsets = .zero, size: CGSize = .zero) -> AnchoredConstraints {
        translatesAutoresizingMaskIntoConstraints = false
        var anchoredConstraints = AnchoredConstraints()
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: padding.top)
        }
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: padding.left)
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom)
        }
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: -padding.right)
        }
        
        if size.width != 0 {
            anchoredConstraints.width = widthAnchor.constraint(equalToConstant: size.width)
        }
        if size.height != 0 {
            anchoredConstraints.height = heightAnchor.constraint(equalToConstant: size.height)
        }
        [anchoredConstraints.top, anchoredConstraints.leading, anchoredConstraints.bottom, anchoredConstraints.trailing, anchoredConstraints.width, anchoredConstraints.height].forEach{$0?.isActive = true}
        
        return anchoredConstraints
    }
    
    func anchorSize(to view: UIView) {
        let width = widthAnchor.constraint(equalTo: view.widthAnchor)
        let height = heightAnchor.constraint(equalTo: view.heightAnchor)
        [width, height].forEach{$0?.isActive = true}
    }
    
    func fillSuperview(padding: UIEdgeInsets = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        
        if let superviewTopAnchor = superview?.topAnchor {
            topAnchor.constraint(equalTo: superviewTopAnchor, constant: padding.top).isActive = true
        }
        if let superviewleadingAnchor = superview?.leadingAnchor {
            leadingAnchor.constraint(equalTo: superviewleadingAnchor, constant: padding.left).isActive = true
        }
        if let superviewBottomAnchor = superview?.bottomAnchor {
            bottomAnchor.constraint(equalTo: superviewBottomAnchor, constant: -padding.bottom).isActive = true
        }
        if let superviewTrailingAnchor = superview?.trailingAnchor {
            trailingAnchor.constraint(equalTo: superviewTrailingAnchor, constant: -padding.right).isActive = true
        }
    }
}
