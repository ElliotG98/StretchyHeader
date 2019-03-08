//
//  HeaderView.swift
//  HeaderCollectionView
//
//  Created by Elliot Glaze on 04/03/2019.
//  Copyright © 2019 Elliot Glaze. All rights reserved.
//

import UIKit

class HeaderView: UICollectionReusableView {
    
    let imageView: UIImageView = {
        let iv = UIImageView(image: #imageLiteral(resourceName: "beachImage"))
        iv.contentMode = .scaleAspectFill
        
        return iv
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //custom code for layout
        
        addSubview(imageView)
        imageView.fillSuperview()
        
        //Blur
        setupVisualEffectsBlur()
        
    }
    
    var animator: UIViewPropertyAnimator!
    
    fileprivate func setupVisualEffectsBlur() {
        
        animator = UIViewPropertyAnimator(duration: 3.0, curve: .linear, animations: { [weak self]  in
            //End State
            let blurEffect = UIBlurEffect(style: .regular)
            let visualEffectView = UIVisualEffectView(effect: blurEffect)
            
            self?.addSubview(visualEffectView)
            visualEffectView.fillSuperview()
        })
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
